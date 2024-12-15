import { Resolver, Query, Args } from '@nestjs/graphql'
import { UseGuards } from '@nestjs/common'
import type { Query as QueryType } from '@src/generated/graphql'
import { PrismaService } from '@src/modules/prisma/prisma.service'
import { AuthGuard } from '@src/common/guards/auth/auth.guard'
import { analyzeText } from '@src/lib/analyzeText'
import { searchShoppingItem, type SearchResult } from '@src/lib/shopping'
@Resolver('SearchItem')
export class SearchItemResolver {
  constructor(private prisma: PrismaService) {}

  @Query('searchItem')
  @UseGuards(AuthGuard)
  async items(
    @Args('name') name: string,
    @Args('isAnalyze') isAnalyze: boolean
  ): Promise<QueryType['searchItem']> {
    if (isAnalyze) {
      const { productNames, extractedWords } = await analyzeText(name)

      const shoppingItems = await Promise.all(
        productNames.map((v) => searchShoppingItem({ query: v }))
      )

      const hit = shoppingItems[0]?.hits[0]
      if (!hit) {
        return null
      }

      const images = this.extractImages(shoppingItems, extractedWords)

      return {
        name: hit.name,
        imageURL: hit.exImage.url,
        images,
      }
    }

    const data = await searchShoppingItem({ query: name })

    if (!data) {
      return null
    }

    const hit = data.hits[0]
    const images = data.hits.map((hit) => hit.exImage.url)

    return {
      name: hit.name,
      imageURL: hit.exImage.url,
      images,
    }
  }

  private extractImages(
    shoppingItems: (SearchResult | null)[],
    extractedWords: string[]
  ): string[] {
    const imagesItems = shoppingItems.flatMap(
      (v) => v?.hits.map((v) => v) || []
    )

    let images = imagesItems
      .filter((v) => {
        for (const word of extractedWords) {
          if (v.name.includes(word) || v.headLine.includes(word)) {
            return true
          }
        }
        return false
      })
      .map((v) => v.exImage.url)
      .filter((value, index, self) => self.indexOf(value) === index)

    if (images.length === 0) {
      // ヒットした画像がない場合は、全ての画像を返す
      images = imagesItems.map((v) => v.exImage.url)
    }

    return images
  }
}

import { Resolver, Query, Args } from '@nestjs/graphql'
import { UseGuards } from '@nestjs/common'
import type { Query as QueryType } from '@src/generated/graphql'
import { PrismaService } from '@src/modules/prisma/prisma.service'
import { AuthGuard } from '@src/common/guards/auth/auth.guard'
import { analyzeText } from '@src/lib/analyzeText'

@Resolver('SearchItem')
export class SearchItemResolver {
  constructor(private prisma: PrismaService) {}

  @Query('searchItem')
  @UseGuards(AuthGuard)
  async items(@Args('name') name: string): Promise<QueryType['searchItem']> {
    await analyzeText(name)

    return {
      name: 'test',
      imageURL: 'test',
      images: [],
    }
  }
}

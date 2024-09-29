import { Resolver, Query, Args } from '@nestjs/graphql'
import { UseGuards } from '@nestjs/common'
import type { Query as QueryType } from '@src/generated/graphql'
import { PrismaService } from '@src/modules/prisma/prisma.service'
import { AuthGuard } from '@src/common/guards/auth/auth.guard'
import { getShoppingItem } from '@src/lib/shopping'

@Resolver('')
export class ItemFromQRResolver {
  constructor(private prisma: PrismaService) {}

  @Query('itemFromQR')
  @UseGuards(AuthGuard)
  async items(
    @Args('janCode') janCode: string
  ): Promise<QueryType['itemFromQR']> {
    const item = await getShoppingItem(janCode)

    return item
  }
}

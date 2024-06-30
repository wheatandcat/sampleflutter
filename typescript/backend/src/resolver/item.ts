import { Resolver, Query, Mutation, Args, Context } from '@nestjs/graphql'
import { UseGuards } from '@nestjs/common'
import {
  Query as QueryType,
  Mutation as MutationType,
  MutationCreateItemArgs,
  MutationUpdateItemArgs,
} from '@src/generated/graphql'
import { PrismaService } from '@src/modules/prisma/prisma.service'
import { format } from '@src/lib/graphql'
import { AuthGuard } from '@src/common/guards/auth/auth.guard'

@Resolver('')
export class ItemResolver {
  constructor(private prisma: PrismaService) {}

  @Query('items')
  @UseGuards(AuthGuard)
  async items(
    @Args('categoryId') categoryId: number,
    @Context() context
  ): Promise<QueryType['items']> {
    const user = context.req.auth

    const r = await this.prisma.item.findMany({
      where: {
        userId: user.userId,
        categoryId: categoryId,
      },
      orderBy: {
        order: 'asc',
      },
    })
    return r.map((c) => format(c))
  }

  @Query('item')
  @UseGuards(AuthGuard)
  async item(
    @Args('id') id: number,
    @Context() context
  ): Promise<QueryType['item']> {
    const user = context.req.auth

    const r = await this.prisma.item.findFirst({
      where: {
        id: id,
        userId: user.userId,
      },
    })
    return format(r)
  }

  @Mutation('createItem')
  @UseGuards(AuthGuard)
  async createItem(
    @Args('input') input: MutationCreateItemArgs['input'],
    @Context() context
  ): Promise<MutationType['createItem']> {
    const user = context.req.auth

    const r = await this.prisma.item.create({
      data: {
        userId: user.userId,
        name: input.name,
        categoryId: input.categoryId,
        imageURL: input.imageURL,
        stock: input.stock,
        expirationDate: input.expirationDate,
        order: input.order,
      },
    })

    return format(r)
  }
  @Mutation('updateItem')
  @UseGuards(AuthGuard)
  async updateItem(
    @Args('input') input: MutationUpdateItemArgs['input'],
    @Context() context
  ): Promise<MutationType['createItem']> {
    const user = context.req.auth
    const r = await this.prisma.item.update({
      where: {
        id: input.id,
        userId: user.userId,
      },
      data: {
        name: input.name,
        imageURL: input.imageURL,
        stock: input.stock,
        expirationDate: input.expirationDate,
        order: input.order,
      },
    })

    return format(r)
  }
  @Mutation('deleteItem')
  @UseGuards(AuthGuard)
  async deleteItem(
    @Args('id') id: number,
    @Context() context
  ): Promise<MutationType['createItem']> {
    const user = context.req.auth

    const r = await this.prisma.item.delete({
      where: {
        id: id,
        userId: user.userId,
      },
    })
    return format(r)
  }

  @Query('itemAll')
  @UseGuards(AuthGuard)
  async itemAll(@Context() context): Promise<QueryType['itemAll']> {
    const user = context.req.auth
    console.log('user_id', user.userId)

    const r = await this.prisma.item.findMany({
      where: {
        userId: user.userId,
      },
      include: {
        category: true,
      },
      orderBy: [
        {
          categoryId: 'asc',
        },
        {
          order: 'asc',
        },
      ],
    })
    return r.map((c) => format(c))
  }
}

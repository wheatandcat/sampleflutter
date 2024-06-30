import { Resolver, Query, Mutation, Args, Context } from '@nestjs/graphql'
import { UseGuards } from '@nestjs/common'
import {
  Query as QueryType,
  Mutation as MutationType,
  MutationCreateCategoryArgs,
  MutationUpdateCategoryArgs,
} from '@src/generated/graphql'
import { PrismaService } from '@src/modules/prisma/prisma.service'
import { format } from '@src/lib/graphql'
import { AuthGuard } from '@src/common/guards/auth/auth.guard'

@Resolver('')
export class CategoryResolver {
  constructor(private prisma: PrismaService) {}

  @Query('categories')
  @UseGuards(AuthGuard)
  async categories(@Context() context): Promise<QueryType['categories']> {
    const user = context.req.auth

    const r = await this.prisma.category.findMany({
      where: {
        userId: user.userId,
      },
      orderBy: {
        order: 'asc',
      },
    })

    const categoryId = r.map((v) => v.id)
    const itemCount = await this.prisma.item.groupBy({
      by: ['categoryId'],
      where: {
        categoryId: {
          in: categoryId,
        },
      },
      _count: {
        id: true,
      },
    })

    return r.map((c) => {
      return {
        ...format(c),
        itemCount:
          itemCount.find((v) => v.categoryId === c.id)?._count?.id || 0,
      }
    })
  }

  @Query('category')
  @UseGuards(AuthGuard)
  async category(
    @Args('id') id: number,
    @Context() context
  ): Promise<QueryType['category']> {
    const user = context.req.auth

    const r = await this.prisma.category.findFirst({
      where: {
        id: id,
        userId: user.userId,
      },
    })
    return format(r)
  }

  @Mutation('createCategory')
  @UseGuards(AuthGuard)
  async createCategory(
    @Args('input') input: MutationCreateCategoryArgs['input'],
    @Context() context
  ): Promise<MutationType['createCategory']> {
    const user = context.req.auth

    const r = await this.prisma.category.create({
      data: {
        userId: user.userId,
        name: input.name,
        imageURL: input.imageURL,
        order: input.order,
      },
    })

    return format(r)
  }

  @Mutation('updateCategory')
  @UseGuards(AuthGuard)
  async updateCategory(
    @Args('input') input: MutationUpdateCategoryArgs['input'],
    @Context() context
  ): Promise<MutationType['updateCategory']> {
    const user = context.req.auth

    const r = await this.prisma.category.update({
      where: {
        id: input.id,
        userId: user.userId,
      },
      data: {
        name: input.name,
        imageURL: input.imageURL,
        order: input.order,
      },
    })

    return format(r)
  }

  @Mutation('deleteCategory')
  @UseGuards(AuthGuard)
  async deleteCategory(
    @Args('id') id: number,
    @Context() context
  ): Promise<MutationType['deleteCategory']> {
    const user = context.req.auth

    const r = await this.prisma.category.delete({
      where: {
        id: id,
        userId: user.userId,
      },
    })

    return format(r)
  }
}

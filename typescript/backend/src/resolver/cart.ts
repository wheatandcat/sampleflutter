import { Resolver, Query, Mutation, Args, Context } from '@nestjs/graphql'
import { UseGuards } from '@nestjs/common'
import {
  Query as QueryType,
  Mutation as MutationType,
  MutationAddCartsArgs,
} from '@src/generated/graphql'
import { PrismaService } from '@src/modules/prisma/prisma.service'
import { format } from '@src/lib/graphql'
import { AuthGuard } from '@src/common/guards/auth/auth.guard'

@Resolver('')
export class CartResolver {
  constructor(private prisma: PrismaService) {}

  @Query('carts')
  @UseGuards(AuthGuard)
  async carts(@Context() context): Promise<QueryType['carts']> {
    const user = context.req.auth

    const r = await this.prisma.cart.findMany({
      where: {
        userId: user.userId,
      },
      include: {
        item: {
          include: {
            category: true,
          },
        },
      },
      orderBy: {
        item: {
          category: {
            order: 'asc',
          },
        },
      },
    })
    return r.map((c) => format(c))
  }
  @Mutation('addCarts')
  @UseGuards(AuthGuard)
  async addCarts(
    @Args('input') input: MutationAddCartsArgs['input'],
    @Context() context
  ): Promise<MutationType['addCarts']> {
    const user = context.req.auth

    await this.prisma.cart.createMany({
      data: input.map((v) => ({
        userId: user.userId,
        itemId: v.itemId,
        quantity: v.quantity,
      })),
    })

    return true
  }
  @Mutation('buying')
  @UseGuards(AuthGuard)
  async buying(@Context() context): Promise<MutationType['buying']> {
    const user = context.req.auth

    const carts = await this.prisma.cart.findMany({
      where: {
        userId: user.userId,
      },
      include: {
        item: {
          include: {
            category: true,
          },
        },
      },
      orderBy: {
        item: {
          category: {
            order: 'asc',
          },
        },
      },
    })

    return await this.prisma.$transaction(async (prisma) => {
      for (const c of carts) {
        await prisma.item.update({
          where: {
            id: c.itemId,
          },
          data: {
            stock: {
              increment: c.quantity,
            },
          },
        })
      }

      await prisma.cart.deleteMany({
        where: {
          userId: user.userId,
        },
      })

      return true
    })
  }
}

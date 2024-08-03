import { Resolver, Query, Mutation, Args, Context } from '@nestjs/graphql'
import { UseGuards } from '@nestjs/common'
import type {
  Query as QueryType,
  Mutation as MutationType,
} from '@src/generated/graphql'
import { PrismaService } from '@src/modules/prisma/prisma.service'
import { format } from '@src/lib/graphql'
import { AuthGuard } from '@src/common/guards/auth/auth.guard'
import { v4 as uuidv4 } from 'uuid'

@Resolver('')
export class InviteResolver {
  constructor(private prisma: PrismaService) {}

  @Query('invite')
  @UseGuards(AuthGuard)
  async invite(@Context() context): Promise<QueryType['invite']> {
    const user = context.req.auth

    const r = await this.prisma.invite.findFirst({
      where: {
        userId: user.userId,
      },
    })
    return format(r)
  }

  @Mutation('createInvite')
  @UseGuards(AuthGuard)
  async createInvite(
    @Context() context
  ): Promise<MutationType['createInvite']> {
    const user = context.req.auth

    const r = await this.prisma.invite.create({
      data: {
        userId: user.userId,
        code: uuidv4(),
      },
    })

    return format(r)
  }

  @Mutation('updateInviteCode')
  @UseGuards(AuthGuard)
  async updateInviteCode(
    @Context() context
  ): Promise<MutationType['updateInviteCode']> {
    const user = context.req.auth

    const r = await this.prisma.invite.update({
      where: {
        userId: user.userId,
      },
      data: {
        code: uuidv4(),
      },
    })

    return format(r)
  }

  @Mutation('deleteInvite')
  @UseGuards(AuthGuard)
  async deleteInvite(
    @Context() context
  ): Promise<MutationType['deleteInvite']> {
    const user = context.req.auth

    await this.prisma.invite.delete({
      where: {
        userId: user.userId,
      },
    })

    return true
  }
}

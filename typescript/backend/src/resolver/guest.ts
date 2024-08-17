import { Resolver, Mutation, Args, Context } from '@nestjs/graphql'
import { UseGuards } from '@nestjs/common'
import type {
  Mutation as MutationType,
  MutationCreateGuestArgs,
} from '@src/generated/graphql'
import { PrismaService } from '@src/modules/prisma/prisma.service'
import { format } from '@src/lib/graphql'
import { AuthGuard } from '@src/common/guards/auth/auth.guard'
import { v4 as uuidv4 } from 'uuid'

@Resolver('')
export class GuestResolver {
  constructor(private prisma: PrismaService) {}

  @Mutation('createGuest')
  async createGuest(
    @Args('input') input: MutationCreateGuestArgs['input']
  ): Promise<MutationType['createGuest']> {
    const invite = await this.prisma.invite.findFirst({
      where: {
        code: input.code,
      },
    })

    if (!invite) {
      throw new Error('Invalid code')
    }

    const r = await this.prisma.guest.create({
      data: {
        uid: uuidv4(),
        userId: invite.userId,
      },
    })

    return format(r)
  }

  @Mutation('deleteGuest')
  @UseGuards(AuthGuard)
  async deleteGuest(@Context() context): Promise<MutationType['deleteGuest']> {
    const user = context.req.auth

    await this.prisma.guest.deleteMany({
      where: {
        userId: user.userId,
      },
    })

    return true
  }
}

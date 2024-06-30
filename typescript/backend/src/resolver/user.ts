import { Resolver, Query, Mutation, Context } from '@nestjs/graphql'
import { UseGuards } from '@nestjs/common'
import {
  Query as QueryType,
  Mutation as MutationType,
} from '@src/generated/graphql'
import { PrismaService } from '@src/modules/prisma/prisma.service'
import { format } from '@src/lib/graphql'
import { AuthGuard } from '@src/common/guards/auth/auth.guard'
import admin from 'firebase-admin'
import { Prisma } from '@prisma/client'

@Resolver('')
export class UserResolver {
  constructor(private prisma: PrismaService) {}

  @Query('me')
  @UseGuards(AuthGuard)
  async me(@Context() context): Promise<QueryType['me']> {
    const user = context.req.auth

    const r = await this.prisma.user.findFirst({
      where: {
        uid: user.uid,
      },
    })
    return format(r)
  }

  @Mutation('createUser')
  async createUser(@Context() context): Promise<MutationType['createUser']> {
    const token = context.reply.request.headers['authorization']
    const result = await admin.auth().verifyIdToken(token)
    try {
      const r = await this.prisma.user.create({
        data: {
          uid: result.uid,
        },
      })
      return format(r)
    } catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        if (e.code === 'P2002') {
          throw new Error('User already exists')
        }
      }
      throw e
    }
  }
}

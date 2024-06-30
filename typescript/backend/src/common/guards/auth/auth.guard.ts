import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common'
import { GqlExecutionContext } from '@nestjs/graphql'
import { PrismaService } from '@src/modules/prisma/prisma.service'
import admin from 'firebase-admin'
import { type User } from '@prisma/client'

export type Auth = {
  uid: string
  userId: number
  user: User
}

@Injectable()
export class AuthGuard implements CanActivate {
  constructor(private prisma: PrismaService) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const ctx = GqlExecutionContext.create(context)
    const request = ctx.getContext().req

    const token = request.headers['authorization']
    const result = await admin.auth().verifyIdToken(token)

    const user = await this.prisma.user.findFirst({
      where: {
        uid: result.uid,
      },
    })

    if (!user) {
      throw new Error('User not found')
    }

    request.auth = {
      uid: result.uid,
      userId: user.id,
      user: user,
    } as Auth

    return true
  }
}

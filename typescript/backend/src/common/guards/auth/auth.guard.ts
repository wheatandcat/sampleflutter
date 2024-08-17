import {
  type CanActivate,
  type ExecutionContext,
  Injectable,
} from '@nestjs/common'
import { GqlExecutionContext } from '@nestjs/graphql'
import { PrismaService } from '@src/modules/prisma/prisma.service'
import admin from 'firebase-admin'
import type { User } from '@prisma/client'

export type Auth = {
  guest: boolean
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

    const authorization = request.headers.authorization
    if (!authorization) {
      throw new Error('Unauthorized')
    }

    if (authorization?.startsWith('Bearer ')) {
      const token = authorization.split('Bearer ')[1]
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
        guest: false,
        uid: user.uid,
        userId: user.id,
        user: user,
      } as Auth
    } else if (authorization?.startsWith('Guest ')) {
      const guestUid = authorization.split('Guest ')[1]
      const guest = await this.prisma.guest.findFirst({
        where: {
          uid: guestUid,
        },
      })

      if (!guest) {
        throw new Error('Guest not found')
      }

      const user = await this.prisma.user.findFirst({
        where: {
          id: guest.userId,
        },
      })

      if (!user) {
        throw new Error('User not found')
      }

      request.auth = {
        guest: true,
        uid: user.uid,
        userId: user.id,
        user: user,
      } as Auth
    }

    return true
  }
}

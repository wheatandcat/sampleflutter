import {
  type CanActivate,
  type ExecutionContext,
  Injectable,
} from '@nestjs/common'
import { getAppCheck } from 'firebase-admin/app-check'
import { GqlExecutionContext } from '@nestjs/graphql'
import { PrismaService } from '@src/modules/prisma/prisma.service'
import admin from 'firebase-admin'
import type { User } from '@prisma/client'
import { ConfigService } from '@nestjs/config'

export type Auth = {
  guest: boolean
  uid: string
  userId: number
  guestUId?: string
  user: User
}

@Injectable()
export class AuthGuard implements CanActivate {
  constructor(
    private prisma: PrismaService,
    private readonly configService: ConfigService
  ) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const ctx = GqlExecutionContext.create(context)
    const request = ctx.getContext().req
    if (this.configService.get('NODE_ENV') === 'production') {
      const appCheckToken = request.headers['x-firebase-appcheck']
      if (!appCheckToken) {
        throw new Error('App Check token not found')
      }

      try {
        await getAppCheck().verifyToken(appCheckToken)
      } catch (e) {
        console.log('error', e)
        throw new Error('Unauthorized (App Check)')
      }
    }

    const authorization = request.headers.authorization
    if (!authorization) {
      throw new Error('Authorization header not found')
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
        guestUId: guestUid,
        uid: user.uid,
        userId: user.id,
        user: user,
      } as Auth
    }

    return true
  }
}

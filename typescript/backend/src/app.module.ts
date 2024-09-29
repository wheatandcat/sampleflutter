import { Module } from '@nestjs/common'
import { GraphQLModule } from '@nestjs/graphql'
import { MercuriusDriver, type MercuriusDriverConfig } from '@nestjs/mercurius'
import { AppController } from '@src/app.controller'
import { AppService } from '@src/app.service'
import { HelloResolver } from './hello.resolver'
import { CategoryResolver } from '@src/resolver/category'
import { ItemResolver } from '@src/resolver/item'
import { ItemFromQRResolver } from '@src/resolver/itemFromQR'
import { UserResolver } from '@src/resolver/user'
import { CartResolver } from '@src/resolver/cart'
import { InviteResolver } from '@src/resolver/invite'
import { GuestResolver } from '@src/resolver/guest'
import { PrismaService } from '@src/modules/prisma/prisma.service'
import { ConfigModule } from '@nestjs/config'

@Module({
  controllers: [AppController],
  providers: [
    AppService,
    HelloResolver,
    UserResolver,
    CategoryResolver,
    ItemResolver,
    ItemFromQRResolver,
    CartResolver,
    InviteResolver,
    GuestResolver,
    PrismaService,
  ],
  imports: [
    ConfigModule.forRoot({
      envFilePath: `.env.${process.env.NODE_ENV}`, // 環境に応じて.envファイルを読み込む
    }),
    GraphQLModule.forRoot<MercuriusDriverConfig>({
      driver: MercuriusDriver,
      graphiql: true,
      typePaths: ['./**/schema.graphql'],
    }),
  ],
})
export class AppModule {}

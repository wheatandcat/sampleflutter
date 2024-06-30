import { NestFactory } from '@nestjs/core'
import {
  FastifyAdapter,
  NestFastifyApplication,
} from '@nestjs/platform-fastify'
import admin from 'firebase-admin'
import * as serviceAccount from './firebase.json'
import { AppModule } from './app.module'

async function bootstrap() {
  const app = await NestFactory.create<NestFastifyApplication>(
    AppModule,
    new FastifyAdapter({ logger: true })
  )

  admin.initializeApp({
    credential: admin.credential.cert(serviceAccount as admin.ServiceAccount),
  })
  app.enableCors({
    origin: ['http://localhost:5000', 'http://localhost:5001'], // 許可するドメインの配列
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    credentials: true,
  })

  const port = Number(process.env.PORT) || 8080
  console.log(`Listening on port ${port}`)
  await app.listen(port, '0.0.0.0')
}

bootstrap()

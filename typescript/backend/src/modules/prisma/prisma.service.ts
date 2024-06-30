import {
  INestApplication,
  Injectable,
  OnModuleInit,
  Logger,
} from '@nestjs/common'
import { PrismaClient, Prisma } from '@prisma/client'

@Injectable()
export class PrismaService
  extends PrismaClient<Prisma.PrismaClientOptions, Prisma.LogLevel>
  implements OnModuleInit
{
  constructor() {
    super({ log: ['query', 'info', 'warn', 'error'] })
  }

  async onModuleInit() {
    this.$on('query', (event) => {
      console.log(
        `Query: ${event.query}`,
        `Params: ${event.params}`,
        `Duration: ${event.duration} ms`
      )
    })
    this.$on('info', (e) => {
      console.log(`Info: ${e.message}`)
    })

    this.$on('warn', (e) => {
      console.log(`Warning: ${e.message}`)
    })

    this.$on('error', (e) => {
      console.log(`Error: ${e.message}`)
    })

    await this.$connect()
  }

  async enableShutdownHooks(app: INestApplication) {
    const exitHandler = () => {
      app.close()
    }
    process.on('exit', exitHandler)
    process.on('beforeExit', exitHandler)
    process.on('SIGINT', exitHandler)
    process.on('SIGTERM', exitHandler)
    process.on('SIGUSR2', exitHandler)
  }
}

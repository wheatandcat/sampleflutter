import { Resolver, Query } from '@nestjs/graphql'

@Resolver('Hello')
export class HelloResolver {
  private message = 'Hello World!'

  @Query(() => String)
  hello() {
    return this.message
  }
}

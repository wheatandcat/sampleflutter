import { LanguageServiceClient } from '@google-cloud/language'

export const analyzeText = async (text: string) => {
  const client = new LanguageServiceClient()

  const document = {
    content: text,
    type: 'PLAIN_TEXT' as const,
  }

  const [result] = await client.analyzeEntities({ document })
  const { entities } = result

  console.log('抽出されたエンティティ:')

  for (const entity of entities) {
    if (entity.type === 'CONSUMER_GOOD') {
      console.log(
        `名前: ${entity.name}, 種類: ${entity.type}, スコア: ${entity.salience}`
      )
    }
  }
}

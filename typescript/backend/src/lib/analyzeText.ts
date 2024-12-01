import { LanguageServiceClient } from '@google-cloud/language'

export const analyzeText = async (text: string) => {
  const client = new LanguageServiceClient()

  const document = {
    content: text,
    type: 'PLAIN_TEXT' as const,
  }

  const [result] = await client.analyzeEntities({ document })
  const { entities } = result

  const entityList = entities.filter(
    (entity) => entity.type === 'CONSUMER_GOOD'
  )

  const topEntities = entityList
    .sort((a, b) => b.salience - a.salience)
    .slice(0, 3)
    .map((entity) => entity.name)

  // 抽出して単語を全て取得
  const extractedWords = entities
    .map((entity) => entity.name)
    .filter((name) => !topEntities.includes(name))

  return {
    productNames: topEntities,
    extractedWords,
  }
}

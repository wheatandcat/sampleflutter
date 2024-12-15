type Hit = {
  index: number
  name: string
  headLine: string
  exImage: {
    url: string
  }
}

export type SearchResult = {
  totalResultsAvailable: number
  totalResultsReturned: number
  firstResultsPosition: number
  request: Request
  hits: Hit[]
}

const IMAGE_SIZE = 300

type ShoppingItem = {
  name: string
  imageURL: string
  images: string[]
}

type SearchShoppingItemRequest = {
  janCode?: string
  query?: string
}

export const searchShoppingItem = async (
  request: SearchShoppingItemRequest
): Promise<SearchResult | null> => {
  const params = new URLSearchParams({
    appid: process.env.YAHOO_APP_ID || '',
    image_size: IMAGE_SIZE.toString(),
  })

  if (request.janCode) {
    params.append('jan_code', request.janCode)
  }
  if (request.query) {
    console.log('query:', request.query)
    params.append('query', request.query)
  }

  const response = await fetch(
    `https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch?${params.toString()}`
  )
  if (!response.ok) {
    return null
  }
  const data: SearchResult = await response.json()

  if (data.totalResultsReturned === 0) {
    return null
  }

  return data
}

export const getShoppingItem = async (
  janCode: string
): Promise<ShoppingItem | null> => {
  const data = await searchShoppingItem({ janCode })

  if (!data) {
    return null
  }

  const hit = data.hits[0]
  const images = data.hits.map((hit) => hit.exImage.url)

  const shoppingItem: ShoppingItem = {
    name: hit.name,
    imageURL: hit.exImage.url,
    images,
  }

  return shoppingItem
}

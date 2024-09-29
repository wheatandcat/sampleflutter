type Hit = {
  index: number
  name: string
  exImage: {
    url: string
  }
}

type SearchResult = {
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

export const getShoppingItem = async (
  janCode: string
): Promise<ShoppingItem | null> => {
  const response = await fetch(
    `https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch?appid=${process.env.YAHOO_APP_ID}&jan_code=${janCode}&image_size=${IMAGE_SIZE}`
  )
  if (!response.ok) {
    return null
  }
  const data: SearchResult = await response.json()

  if (data.totalResultsReturned === 0) {
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

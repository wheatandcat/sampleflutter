export const format = <T>(item: T) => {
  const { id, ...rest } = item as any

  return {
    id: String(item['id']),
    ...rest,
  }
}

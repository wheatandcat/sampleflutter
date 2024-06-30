export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] };
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> };
export type MakeEmpty<T extends { [key: string]: unknown }, K extends keyof T> = { [_ in K]?: never };
export type Incremental<T> = T | { [P in keyof T]?: P extends ' $fragmentName' | '__typename' ? T[P] : never };
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: { input: string; output: string; }
  String: { input: string; output: string; }
  Boolean: { input: boolean; output: boolean; }
  Int: { input: number; output: number; }
  Float: { input: number; output: number; }
  Time: { input: any; output: any; }
};

export type Cart = {
  __typename?: 'Cart';
  /** カートID */
  id: Scalars['ID']['output'];
  /** アイテム */
  item?: Maybe<Item>;
  /** アイテムID */
  itemId: Scalars['ID']['output'];
  /** 数量 */
  quantity: Scalars['Int']['output'];
  /** ユーザーID */
  userId: Scalars['ID']['output'];
};

export type Category = {
  __typename?: 'Category';
  /** カテゴリーID */
  id: Scalars['ID']['output'];
  /** 画像URL */
  imageURL?: Maybe<Scalars['String']['output']>;
  /** アイテム数 */
  itemCount?: Maybe<Scalars['Int']['output']>;
  /** カテゴリー名 */
  name: Scalars['String']['output'];
  /** 順番 */
  order: Scalars['Int']['output'];
};

export type Item = {
  __typename?: 'Item';
  /** カテゴリー */
  category?: Maybe<Category>;
  /** カテゴリーID */
  categoryId: Scalars['ID']['output'];
  /** 消費期限 */
  expirationDate?: Maybe<Scalars['Time']['output']>;
  /** アイテムID */
  id: Scalars['ID']['output'];
  /** 画像URL */
  imageURL?: Maybe<Scalars['String']['output']>;
  /** アイテム名 */
  name: Scalars['String']['output'];
  /** 順番 */
  order: Scalars['Int']['output'];
  /** 在庫数 */
  stock: Scalars['Int']['output'];
};

export type Mutation = {
  __typename?: 'Mutation';
  addCarts: Scalars['Boolean']['output'];
  buying: Scalars['Boolean']['output'];
  createCategory: Category;
  createItem: Item;
  createUser: User;
  deleteCategory: Category;
  deleteItem: Item;
  updateCategory: Category;
  updateItem: Item;
};


export type MutationAddCartsArgs = {
  input: Array<InputMaybe<NewCart>>;
};


export type MutationCreateCategoryArgs = {
  input: NewCategory;
};


export type MutationCreateItemArgs = {
  input: NewItem;
};


export type MutationDeleteCategoryArgs = {
  id: Scalars['Int']['input'];
};


export type MutationDeleteItemArgs = {
  id: Scalars['Int']['input'];
};


export type MutationUpdateCategoryArgs = {
  input: UpdateCategory;
};


export type MutationUpdateItemArgs = {
  input: UpdateItem;
};

export type NewCart = {
  /** アイテムID */
  itemId: Scalars['Int']['input'];
  /** 数量 */
  quantity: Scalars['Int']['input'];
};

export type NewCategory = {
  /** 画像URL */
  imageURL?: InputMaybe<Scalars['String']['input']>;
  /** カテゴリー名 */
  name: Scalars['String']['input'];
  /** 順番 */
  order: Scalars['Int']['input'];
};

export type NewItem = {
  /** カテゴリーID */
  categoryId: Scalars['Int']['input'];
  /** 消費期限 */
  expirationDate?: InputMaybe<Scalars['Time']['input']>;
  /** 画像URL */
  imageURL?: InputMaybe<Scalars['String']['input']>;
  /** アイテム名 */
  name: Scalars['String']['input'];
  /** 順番 */
  order: Scalars['Int']['input'];
  /** 在庫数 */
  stock: Scalars['Int']['input'];
};

export type Query = {
  __typename?: 'Query';
  carts?: Maybe<Array<Maybe<Cart>>>;
  categories?: Maybe<Array<Maybe<Category>>>;
  category?: Maybe<Category>;
  hello?: Maybe<Scalars['String']['output']>;
  item?: Maybe<Item>;
  itemAll?: Maybe<Array<Maybe<Item>>>;
  items?: Maybe<Array<Maybe<Item>>>;
  me?: Maybe<User>;
};


export type QueryCategoryArgs = {
  id: Scalars['Int']['input'];
};


export type QueryItemArgs = {
  id: Scalars['Int']['input'];
};


export type QueryItemsArgs = {
  categoryId: Scalars['Int']['input'];
};

export type UpdateCategory = {
  /** アイテムID */
  id: Scalars['Int']['input'];
  /** 画像URL */
  imageURL?: InputMaybe<Scalars['String']['input']>;
  /** カテゴリー名 */
  name: Scalars['String']['input'];
  /** 順番 */
  order: Scalars['Int']['input'];
};

export type UpdateItem = {
  /** カテゴリーID */
  categoryId: Scalars['Int']['input'];
  /** 消費期限 */
  expirationDate?: InputMaybe<Scalars['Time']['input']>;
  /** アイテムID */
  id: Scalars['Int']['input'];
  /** 画像URL */
  imageURL?: InputMaybe<Scalars['String']['input']>;
  /** アイテム名 */
  name: Scalars['String']['input'];
  /** 順番 */
  order: Scalars['Int']['input'];
  /** 在庫数 */
  stock: Scalars['Int']['input'];
};

export type User = {
  __typename?: 'User';
  /** ユーザーID */
  id: Scalars['ID']['output'];
  /** UID */
  uid: Scalars['String']['output'];
};

export default {
  introspection: {
    type: 'sdl', // スキーマをファイルから読み込む場合は "sdl" を指定する
    paths: ['src/schema.graphql'], // スキーマファイルのパスを指定する
  },
  website: {
    // テンプレートを指定する
    // v6.1.0 時点でデフォルトで用意されてるのは "carbon-multi-page" のみ
    template: 'carbon-multi-page',

    // Web サイトのルートパスを指定する
    // Public な GitHub Pages の URL は https://<オーナー名>.github.io/<リポジトリ名>/ のようになるので、
    // ここには "/<リポジトリ名>" を指定する必要がある
    siteRoot: '/stock-keeper',
    options: {
      queryGenerationFactories: {
        Time: '2023-11-03T10:15:30Z', // 例としてISO 8601形式の日時
      },
    },
  },
}

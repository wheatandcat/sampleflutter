# stock-keeper

## ローカル起動

```bash
$ flutter run
```

ホットリロードを有効にする場合は VSCode のデバッグ機能から起動する

## GraphQL のスキーマを更新

```bash

$ flutter pub run build_runner build

```

## web ビルド

```bash
$ flutter build web
$ cd build/web
$ http-server -p 5000
```

## android のフィンガープリント取得

```bash
$ cd android
$ ./gradlew signingReport
```

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

## アプリ icon 作り直し

```bash
$ flutter pub run flutter_launcher_icons
```

## アプリ スプラッシュスクリーン 作り直し

```bash
$ flutter pub run flutter_native_splash:create
```

## iOS

### 開発ビルド

```bash
$ flutter build ipa  --export-method ad-hoc
```

## Android

### 開発ビルド

```bash
$ flutter build apk
```

## 環境変数

### 開発

```bash
$ base64 -i keeper_review.p12 | pbcopy
$ base64 -i keeper_adhok.mobileprovision | pbcopy
$ base64 -i ./ios/GoogleService-Info.plist | pbcopy
```

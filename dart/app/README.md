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
$ base64 -i keeper.p12 | pbcopy
$ base64 -i keeper_adhok.mobileprovision | pbcopy
$ base64 -i ./ios/GoogleService-Info.plist | pbcopy
$ base64 -i ./lib/firebase_options.dart | pbcopy
$ base64 -i ./ios/Runner/Info.plist | pbcopy
$ base64 -i ./android/app/google-services.json | pbcopy
$ base64 -i ./android/key.jks | pbcopy
$ base64 -i ./android/local.properties | pbcopy
```

## Deep Link の検証

### iOS

```bash
$ xcrun simctl openurl booted stockkeeper://stock-keeper-review.web.app/cart
```

### Android

```bash
$ adb shell 'am start -a android.intent.action.VIEW \
    -c android.intent.category.BROWSABLE \
    -d "https://stock-keeper-review.web.app/cart"' \
    com.unicorn.stockkeeper
```

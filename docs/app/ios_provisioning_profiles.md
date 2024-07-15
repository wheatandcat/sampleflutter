# iOS デプロイの証明書作成手順

## Apple Developer で証明書を作成

以下のコマンドで証明書を作成

```bash
$ openssl genrsa -out private.key 2048
$ openssl req -new -key private.key -out csr.pem
```

入力例

```bash
Country Name (2 letter code) [AU]:JP
State or Province Name (full name) [Some-State]:Tokyo
Locality Name (eg, city) []:Tokyo
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Your Company Name
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:Your Name
Email Address []:your-email@example.com

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
```

Apple Developer にログインし、証明書を作成

- Certificates にアクセスして、`+`をクリック
- **Apple Distribution**を選択
- 作成した`csr.pem`をアップロード
- 証明書をダウンロード

## p12 ファイルを作成

以下のコマンドを実行

```bash
$ openssl x509 -in distribution.cer -inform der -out distribution.pem
$ openssl pkcs12 -legacy -export -out distribution.p12 -inkey private.key -in distribution.pem
```

以下の記事の通り、`legacy`のオプションを付けないと mac でパスワード認証ができないので注意

- [OpenSSL 3 系で発行された p12 形式の証明書が macOS にインポートできない | MSeeeeN](https://mseeeen.msen.jp/p12-format-certificate-issued-by-openssl3-fails-to-import-to-macos/)

以下でパスワードを入力

```bash
Enter Export Password:
Verifying - Enter Export Password:
```

作成された`distribution.p12`をダブルクリックし、mac のキーチェーンにインストール
パスワードを求められるので、上記で入力したパスワードを入力、これで証明書をインポートできる

## 配信用の証明書をプロビジョニングプロファイルを作成

Apple Developer にログインし、配信用の証明書をプロビジョニングプロファイルを作成

- Profiles にアクセスして、`+`をクリック
- **Ad Hoc**を選択
- App ID を選択
- Certificates で上記で作成した証明書を選択
- プロビジョニングプロファイルをダウンロード

## Xcode で証明書を選択して認証できているか

- Xcode でプロジェクトを開き、`Signing & Capabilities`を選択
- 先ほどダウンロードしたプロビジョニングプロファイルを選択して、エラーが表示されないか確認
- これで各ファイルが問題なく作成できているかの確認が完了

## GitHub Actions の secrets に設定

以下のコマンドで base64 に変換し、GitHub Actions の secrets に設定

```bash
$ base64 -i keeper.p12 | pbcopy
$ base64 -i keeper_adhok.mobileprovision | pbcopy
```

以下の secrets を設定

- CERTIFICATES
- REVIEW_PROVISIONING_PROFILE

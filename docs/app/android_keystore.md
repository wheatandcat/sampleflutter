# Android のキーストア作成手順 & SHA-1 フィンガープリント取得

## Android keystore 作成

以下のコマンドで keystore を作成

```bash
$ keytool -genkey -v -keystore key.jks -alias *** -keyalg RSA -validity 10000
```

入力例

```bash
Enter keystore password:
Re-enter new password:
What is your first and last name?
  [Unknown]:  Your Name
What is the name of your organizational unit?
  [Unknown]:  Development
What is the name of your organization?
  [Unknown]:  Your Company Name
What is the name of your City or Locality?
  [Unknown]:  Shinjuku
What is the name of your State or Province?
  [Unknown]:  Tokyo
What is the two-letter country code for this unit?
  [Unknown]:  JP
Is CN=John Doe, OU=Development, O=MyCompany, L=Tokyo, ST=Tokyo, C=JP correct?
  [no]:  yes
```

上記で key.jks ファイルが作成されるので`android/key.jks`に配置

## android/app/build.gradle に keystore の設定を追加

`local.properties`に keystore を設定を追加

■ android/local.properties

```
storeFile=*.jks
storePassword=****  // 上記で入力したパスワード
keyPassword=****    // 上記で入力したパスワード
keyAlias=***        // 上記で入力した alias
```

`android/app/build.gradle`に以下の設定を追加

■ android/app/build.gradle

```gradle
def localProperties = new Properties()
def localPropertiesFile = rootProject.file('local.properties')
if (localPropertiesFile.exists()) {
    localPropertiesFile.withReader('UTF-8') { reader ->
        localProperties.load(reader)
    }
}

(略)

android {
(略)
    signingConfigs {
      release {
          keyAlias localProperties['keyAlias']
          keyPassword localProperties['keyPassword']
          storeFile rootProject.file(localProperties['storeFile'])
          storePassword localProperties['storePassword']
      }
    }
}
```

## SHA-1 フィンガープリント取得

以下のコマンドで SHA-1 フィンガープリントを取得

```bash
$ cd android
$ ./gradlew signingReport
```

出力の中から`Config: release`の値を確認して、`SHA1`の値を確認

```bash
Variant: release
Config: release
Store: ***/android/key.jks
Alias: ***
MD5: ***
SHA1:  ***
SHA-256:  ***
Valid  ****
```

## GitHub Actions の secrets に設定

以下のコマンドで base64 に変換し、GitHub Actions の secrets に設定

```bash
$ base64 -i ./android/key.jks | pbcopy
$ base64 -i ./android/local.properties | pbcopy
```

以下の secrets を設定

- REVIEW_JKS
- REVIEW_ANDROID_PROPERTIES

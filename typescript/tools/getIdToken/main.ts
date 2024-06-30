import admin from 'firebase-admin'
import { initializeApp } from 'firebase/app'
import { getAuth, signInWithEmailAndPassword } from 'firebase/auth'
import clipboardy from 'clipboardy'
import * as dotenv from 'dotenv'

// 環境変数の読み込み
dotenv.config()

// Firebaseプロジェクトの設定
import serviceAccount from './firebase.json' assert { type: 'json' }

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount as admin.ServiceAccount),
})

// Firebase Admin SDKの初期化
const app = initializeApp({
  apiKey: process.env.FIREBASE_API_KEY,
  authDomain: process.env.FIREBASE_AUTH_DOMAIN,
})

// コマンドライン引数からメールアドレスとパスワードを取得
const email = process.env.USER_EMAIL as string
const password = process.env.USER_PASSWORD as string

// Firebase Authentication にログイン
const auth = getAuth(app)
signInWithEmailAndPassword(auth, email, password)
  .then((userCredential) => {
    return userCredential.user.getIdToken()
  })
  .then((idToken) => {
    console.log('ID Token:', idToken)
    clipboardy.writeSync(idToken)
  })
  .catch((error) => {
    console.error('認証エラー:', error.message)
  })

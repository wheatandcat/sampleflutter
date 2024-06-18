import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  // トークンを取得して安全に保存する
  Future<void> refreshAndStoreToken() async {
    User? user = _auth.currentUser;
    if (user != null) {
      String? token = await user.getIdToken(true);

      await secureStorage.write(key: 'token', value: token);
      await secureStorage.write(
          key: 'tokenDate', value: DateTime.now().toIso8601String());
    }
  }

  // トークンの有効性をチェックし、必要に応じて更新
  Future<String?> getToken() async {
    User? user = _auth.currentUser;
    try {
      String? token = await secureStorage.read(key: 'token');
      if (token == null && user != null) {
        // もしログイン済みでトークンが取得できない場合は、トークンを再設定
        await refreshAndStoreToken();
        token = await secureStorage.read(key: 'token');
      }
      if (token == null) {
        return null;
      }

      String? storedDate = await secureStorage.read(key: 'tokenDate');
      if (storedDate == null) {
        return null;
      }

      DateTime tokenDate = DateTime.parse(storedDate);
      DateTime now = DateTime.now();

      // トークンの有効期限を設定（Firebaseのデフォルトは約1時間）
      if (now.difference(tokenDate).inHours >= 1) {
        await refreshAndStoreToken();
        token = await secureStorage.read(key: 'token'); // 更新されたトークンを取得
      }
      debugPrint('token: $token');

      return token;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteToken() async {
    await secureStorage.delete(key: 'token');
    await secureStorage.delete(key: 'tokenDate');
  }
}

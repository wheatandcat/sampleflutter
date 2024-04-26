import 'package:firebase_auth/firebase_auth.dart';
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
    String? token = await secureStorage.read(key: 'token');
    String? storedDate = await secureStorage.read(key: 'tokenDate');
    if (token != null && storedDate != null) {
      DateTime tokenDate = DateTime.parse(storedDate);
      DateTime now = DateTime.now();

      // トークンの有効期限を設定（Firebaseのデフォルトは約1時間）
      if (now.difference(tokenDate).inHours >= 1) {
        await refreshAndStoreToken();
        token = await secureStorage.read(key: 'token'); // 更新されたトークンを取得
      }
    }

    return token;
  }

  Future<void> deleteToken() async {
    await secureStorage.delete(key: 'token');
    await secureStorage.delete(key: 'tokenDate');
  }
}

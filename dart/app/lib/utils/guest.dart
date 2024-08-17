import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Guest {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> storeUid(String uid) async {
    await secureStorage.write(key: "guest", value: uid);
  }

  Future<String?> getUid() async {
    return await secureStorage.read(key: "guest");
  }
}

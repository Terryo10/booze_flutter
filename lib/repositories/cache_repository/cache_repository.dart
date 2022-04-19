import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheRepository {
  final FlutterSecureStorage storage;

  CacheRepository({required this.storage});

  Future getAuthToken() async {
    var token = storage.read(key: 'token');
    return token;
  }
}

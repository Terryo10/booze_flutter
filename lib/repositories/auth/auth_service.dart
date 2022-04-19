import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService{
  void addDataToStorage({required FlutterSecureStorage storage, required String ? token}){
    storage.write(key: 'token', value: token);
  }
}
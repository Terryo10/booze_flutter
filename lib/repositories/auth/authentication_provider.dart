import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../../constants/app_strings/strings.dart';

class AuthenticationProvider {
  final FlutterSecureStorage storage;

  AuthenticationProvider({required this.storage});

  Future login({required String email, required String password}) async {
    String url = '${Strings.baseUrl}${Strings.api}${Strings.login}';

    var body =
        jsonEncode(<String, String>{'email': email, 'password': password});
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    try {
      var response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

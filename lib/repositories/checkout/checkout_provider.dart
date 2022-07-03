import 'dart:io';

import '../../constants/app_strings/strings.dart';
import 'package:http/http.dart' as http;

class CheckoutProvider{
   Future getCheckoutDetails() async {
    try {
      String url = '${Strings.baseUrl}${Strings.api}${Strings.checkoutDetailsurl}';
      var headers = <String, String>{"content-type": "application/json"};
      var response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Oops! Something went wrong..");
      }
    } on SocketException {
      throw Exception('We cannot connect, check your connection');
    } catch (e) {
      throw Exception("Oops! Something went wrong...");
    }
  }
}
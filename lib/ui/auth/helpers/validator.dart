import 'package:booze_flutter/constants/regex/regex.dart';

class Validator{

  bool validateEmail(String email){
    return RegExp(RegexStrings.emailRegex).hasMatch(email);
  }
}
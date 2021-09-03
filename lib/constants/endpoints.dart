import 'package:flutter_todo_app/constants/strings.dart';
import 'dart:io' show Platform;

class Endpoints {
  Endpoints._();
  static String baseUrl = Platform.isAndroid ? BASE_URL_AND : BASE_URL_IOS;

  static String todos = baseUrl + "/todos";
}

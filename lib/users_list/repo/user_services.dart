import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter_mvvm/utils/constants.dart';
import 'package:flutter_mvvm/users_list/repo/api_status.dart';
import 'package:flutter_mvvm/users_list/models/users_list_model.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USERS_LIST);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(
            code: SUCCESS, response: UserModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } on SocketException {
      return Failure(code: NO_INTERNET, errorResponse: 'Connection Failed');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}

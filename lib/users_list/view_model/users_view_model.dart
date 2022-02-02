import 'package:flutter/material.dart';

import 'package:flutter_mvvm/users_list/repo/api_status.dart';
import 'package:flutter_mvvm/users_list/models/user_error.dart';
import 'package:flutter_mvvm/users_list/repo/user_services.dart';
import 'package:flutter_mvvm/users_list/models/users_list_model.dart';

class UserViewModel extends ChangeNotifier {
  bool _isLoading = false;
  List<UserModel> _userListModel = [];
  late UserError _userError;

  bool get loading => _isLoading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError;

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse,
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_mvvm/users_list/view_model/users_view_model.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(userViewModel.selectedUser!.name),
      ),
      body: Container(),
    );
  }
}

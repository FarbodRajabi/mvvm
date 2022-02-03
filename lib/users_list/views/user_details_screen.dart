import 'package:flutter/material.dart';
import 'package:flutter_mvvm/components/item_text_widget.dart';
import 'package:flutter_mvvm/users_list/models/users_list_model.dart';

import 'package:provider/provider.dart';

import 'package:flutter_mvvm/users_list/view_model/users_view_model.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    final user = userViewModel.selectedUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(user!.name),
      ),
      body: Center(
        child: Container(
          height: 140,
          width: 240,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Column(
            children: [
              ItemText(title: 'name', value: user.name),
              ItemText(title: 'username', value: user.username),
              ItemText(title: 'email', value: user.email),
              ItemText(title: 'phone', value: user.phone),
              ItemText(title: 'id', value: user.id.toString()),
              ItemText(title: 'website', value: user.website),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_mvvm/utils/navigation_utils.dart';
import 'package:flutter_mvvm/components/user_card_widget.dart';
import 'package:flutter_mvvm/users_list/models/users_list_model.dart';
import 'package:flutter_mvvm/users_list/view_model/users_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text('Users')),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            _ui(userViewModel),
          ],
        ),
      ),
    );
  }

  _ui(UserViewModel userViewModel) {
    if (userViewModel.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (userViewModel.userError != null) {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userViewModel.userError!.message.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    userViewModel.clearUserError();
                    userViewModel.getUsers();
                  },
                  child: const Text('Retry')),
            ],
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            UserModel user = userViewModel.userListModel[index];
            return UserCard(
              user: user,
              onTap: () {
                userViewModel.setSelectedUser(user);
                openUserDetails(context);
              },
            );
          },
          separatorBuilder: (context, indext) {
            return const Divider();
          },
          itemCount: userViewModel.userListModel.length),
    );
  }
}

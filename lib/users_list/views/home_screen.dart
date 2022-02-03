import 'package:flutter/material.dart';
import 'package:flutter_mvvm/users_list/models/users_list_model.dart';
import 'package:flutter_mvvm/users_list/view_model/users_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Container(
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
      return CircularProgressIndicator();
    }

    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            UserModel user = userViewModel.userListModel[index];
            return Container(
              child: Text(user.name),
            );
          },
          separatorBuilder: (context, indext) {
            return Divider();
          },
          itemCount: userViewModel.userListModel.length),
    );
  }
}

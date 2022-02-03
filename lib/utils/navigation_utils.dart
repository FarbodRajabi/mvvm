import 'package:flutter/material.dart';
import 'package:flutter_mvvm/users_list/views/user_details_screen.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UserDetailsScreen(),
    ),
  );
}

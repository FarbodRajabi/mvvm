import 'package:flutter/material.dart';

import 'package:flutter_mvvm/users_list/models/users_list_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  final UserModel user;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            user.email,
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}

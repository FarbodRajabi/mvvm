import 'package:flutter/material.dart';

class ItemText extends StatelessWidget {
  const ItemText({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title + ' : ', style: TextStyle(color: Colors.grey[600])),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

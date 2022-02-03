import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_mvvm/users_list/views/home_screen.dart';
import 'package:flutter_mvvm/users_list/view_model/users_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter MVVM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lime,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

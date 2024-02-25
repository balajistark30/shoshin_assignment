import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoshin_tech_assignment/screens/home_page.dart';
import 'package:shoshin_tech_assignment/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: BAppTheme.lightTheme,
      darkTheme: BAppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}



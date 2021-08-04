import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wallpaper_app/views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: 'Wallpaper App',
      theme: ThemeData(
      primaryColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}

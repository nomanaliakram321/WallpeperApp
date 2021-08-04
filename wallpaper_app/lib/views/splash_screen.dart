import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:wallpaper_app/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  Container(
        child: Column(
          children: [

          ],
        ),
    ));
    //SplashScreen(
      // seconds: 14,
      // navigateAfterSeconds: new HomeScreen(),
      // title: new Text(
      //   'Welcome In SplashScreen',
      //   style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      // ),
      // image: new Image.network(
      //     'https://flutter.io/images/catalog-widget-placeholder.png'),
      // backgroundColor: Colors.white,
      // loaderColor: Colors.red,
    //);
  }
}
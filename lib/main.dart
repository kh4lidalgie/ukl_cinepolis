import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'login_page.dart';
import 'navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinepolis',
      theme: ThemeData(),
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => NavBar(),
      },
    );
  }
}

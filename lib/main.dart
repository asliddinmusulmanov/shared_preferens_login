import 'package:flutter/material.dart';
import 'package:shared_preferans_login/pages/login_page.dart';
import 'package:shared_preferans_login/theme/dark.dart';
import 'package:shared_preferans_login/theme/light.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      // darkTheme: darkTheme,
      home: const LoginPage(),
    );
  }
}

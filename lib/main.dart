import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/features/app_section/screens/app_section.dart';
import 'package:e_commerce/features/auth/presentation/view/screens/hello_screen.dart';
import 'package:e_commerce/features/auth/presentation/view/screens/login_screen.dart';
import 'package:e_commerce/features/auth/presentation/view/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     
      initialRoute: AppRoutes.helloScreen,
      routes: {
        AppRoutes.helloScreen: (context) => const HelloScreen(),
        AppRoutes.loginScreen: (context) => const LoginScreen(),
        AppRoutes.signupScreen: (context) => const SignUpScreen(),
        AppRoutes.appSection: (context) => const AppSection(),
      },
     
    );
  }
}
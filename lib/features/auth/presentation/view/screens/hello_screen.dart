import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/themes/app_color.dart';
import 'package:e_commerce/core/widgets/orange_button_widget.dart';
import 'package:e_commerce/core/widgets/white_button_widget.dart';
import 'package:flutter/material.dart';


class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Image.asset(
                    'assets/images/hello.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              
              const SizedBox(height: 20),

              const Text(
                'Hello!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppColors.charcoal,
                ),
              ),

              const Spacer(flex: 2),

              const SizedBox(
                width: double.infinity,
              ),
              
              const SizedBox(height: 20),

              OrangeButtonWidget(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.signupScreen);
                },
              ),
              const SizedBox(height: 20),
              WhiteButtonWidget(text: 'Login', onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.loginScreen);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

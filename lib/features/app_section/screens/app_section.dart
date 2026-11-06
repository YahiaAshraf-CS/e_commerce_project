import 'package:flutter/material.dart';

class AppSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to the App Section!',
          style: TextStyle(fontSize: 24),
        ),
      )
    );
  }
}
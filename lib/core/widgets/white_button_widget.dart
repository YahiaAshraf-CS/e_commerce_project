 
 import 'package:e_commerce/core/themes/app_color.dart';
import 'package:flutter/material.dart';
class WhiteButtonWidget extends StatelessWidget {
  const new({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.offWhite,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: AppColors.orangeLight, width: 1),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: AppColors.orangeLight, fontSize: 20),
      ),
    );
  }
}

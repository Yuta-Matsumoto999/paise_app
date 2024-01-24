import 'package:flutter/material.dart';
import 'package:praise_app_flutter/core/constants/custom_color.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 26), 
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(CustomColor.authFormBoxShadow),
            offset: Offset(5, 5),
            blurRadius: 7.0, 
            spreadRadius: 1,
          )
        ]
      ),
      child: Center(
        child: IconButton(
          onPressed: () {}, 
          icon: Container(
            padding: const EdgeInsets.all(16),
            child: Image.asset('images/google_logo.png'),
          )
        )
      )
    );
  }
}
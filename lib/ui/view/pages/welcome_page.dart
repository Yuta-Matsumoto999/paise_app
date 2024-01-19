import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "WELCOME!!!", 
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      )
    );
  }
}
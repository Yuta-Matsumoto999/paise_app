import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class CompleteSendPasswordResetLinkPage extends StatelessWidget {
  const CompleteSendPasswordResetLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Complete Send Password Reset Link Page", 
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      )
    );
  }
}
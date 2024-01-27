import 'package:flutter/material.dart';

class CustomPageRouteAnimation {
  static AnimatedBuilder Function(dynamic, dynamic, dynamic, dynamic) animate() {
    return (context, animation, secondaryAnimation, child) {
      final color = ColorTween(
        begin: Colors.transparent,
        end: Colors.white,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: const Interval(0, 0.5, curve: Curves.easeInOut),
        ),
      );
      final opacity = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: const Interval(0.5, 1, curve: Curves.easeInOut),
        ),
      );
      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            color: color.value,
            child: Opacity(
              opacity: opacity.value,
              child: child,
            ),
          );
        },
        child: child,
      );
    };
  }
}
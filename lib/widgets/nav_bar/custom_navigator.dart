import 'package:flutter/material.dart';

class CustomNavigator {
  static void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        maintainState: true,
        pageBuilder: (context, animation1, animation2) => page,
        transitionDuration: Duration(milliseconds: 200),
        opaque: false,
        reverseTransitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  static void replace(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        maintainState: true,
        pageBuilder: (context, animation1, animation2) => page,
        transitionDuration: Duration(milliseconds: 200),
        opaque: false,
        reverseTransitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}
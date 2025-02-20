import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../store/common_store.dart';
import 'nav_bar.dart';

class NavBarWrapper extends StatelessWidget {
  final Widget child;
  
  const NavBarWrapper({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            child,
            NavBar(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../pages/profile/setting_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/myImage.png"),
            ),
            SizedBox(width: 12),
            Text(
              "Good evening",
              style: TextStyle(
                fontFamily: "AB",
                color: MyColors.whiteColor,
                fontSize: 19,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/icon_bell.png'),
              Image.asset("assets/images/icon_recent.png"),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingScreen(),
                    ),
                  );
                },
                child: Image.asset("assets/images/icon_settings.png"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

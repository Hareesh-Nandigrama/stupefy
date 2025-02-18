import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class OnboardingHeader extends StatelessWidget {
  final String title;
  OnboardingHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return title == "Create Account"
        ? Padding(
            padding: const EdgeInsets.only(bottom: 35, top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.blackColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/icon_arrow_left.png",
                        height: 16,
                        width: 16,
                      ),
                    ),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "AB",
                    fontSize: 16,
                    color: MyColors.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 32,
                  width: 32,
                ),
              ],
            ),
          )
        : SliverPadding(
            padding: EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 5),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  SizedBox(
                    height: 75,
                    width: 245,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: "AB",
                        fontSize: 26,
                        color: MyColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

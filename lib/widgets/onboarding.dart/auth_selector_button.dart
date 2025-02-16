import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class OnboardingButton extends StatelessWidget {
  final String authMtd;
  const OnboardingButton({super.key, required this.authMtd});

  @override
  Widget build(BuildContext context) {
    String imagePath;
    String buttonText;

    switch (authMtd) {
      case 'google':
        imagePath = "images/icon_google.png";
        buttonText = "Continue with Google";
        break;
      case 'facebook':
        imagePath = "images/icon_facebook.png";
        buttonText = "Continue with Facebook";
        break;
      case 'apple':
        imagePath = "images/icon_apple.png";
        buttonText = "Continue with Apple";
        break;
      default:
        imagePath = "";
        buttonText = "Continue";
    }

    return OutlinedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width, 49),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        side: const BorderSide(
          width: 1,
          color: MyColors.lightGrey,
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imagePath),
          Text(
            buttonText,
            style: const TextStyle(
              fontFamily: "AB",
              fontSize: 16,
              color: MyColors.whiteColor,
            ),
          ),
          const SizedBox(
            height: 18,
            width: 18,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../widgets/onboarding.dart/auth_selector_button.dart';
import 'request_user_details.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                "images/onboarding_background.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Millions of songs.",
              style: TextStyle(
                fontFamily: "AB",
                fontSize: 28,
                color: MyColors.whiteColor,
              ),
            ),
            const Text(
              "Free on Spotify.",
              style: TextStyle(
                fontFamily: "AB",
                fontSize: 28,
                color: MyColors.whiteColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 49),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      backgroundColor: MyColors.greenColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RequestUserDetails(requiredDetails: "email"),
                        ),
                      );
                    },
                    child: const Text(
                      "ُSign up free",
                      style: TextStyle(
                        fontFamily: "AB",
                        fontSize: 16,
                        color: MyColors.blackColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  OnboardingButton(
                    authMtd: "google",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  OnboardingButton(
                    authMtd: "facebook",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  OnboardingButton(
                    authMtd: "apple",
                  ),
                  SafeArea(
                    minimum: const EdgeInsets.only(bottom: 10),
                    child: Text(
                            "Log in", // Log in functionality during backend implementation
                            style: TextStyle(
                              fontFamily: "AB",
                              fontSize: 16,
                              color: MyColors.whiteColor,
                            ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


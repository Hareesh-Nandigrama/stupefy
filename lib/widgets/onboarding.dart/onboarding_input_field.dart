import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../pages/auth/choose_artist_screen.dart';
import '../../pages/auth/request_user_details.dart';
import 'gender_dropdown.dart';
import 'privacy_policy.dart';

class OnboardingInputField extends StatefulWidget {
  final String inputType;
  const OnboardingInputField({super.key, required this.inputType});

  @override
  State<OnboardingInputField> createState() => _OnboardingInputFieldState();
}

class _OnboardingInputFieldState extends State<OnboardingInputField> {
  String text = "";
  bool newsCheck = false;
  bool marketPurposeCheck = false;

  @override
  Widget build(BuildContext context) {
    String inputQuestion = "What's your ";
    String supportingText = "";
    Widget nextPage = RequestUserDetails(requiredDetails: 'password');
    switch (widget.inputType) {
      case 'email':
        inputQuestion += "email?";
        supportingText = "You'll need to confirm this email later.";
        break;
      case 'gender':
        inputQuestion += "gender?";
        text = "Male";
        nextPage = RequestUserDetails(requiredDetails: 'name');
        break;
      case 'name':
        inputQuestion += "name?";
        supportingText = "This appears on your stupefy profile";
        break;
      default:
        inputQuestion = "Create your password";
        supportingText = "Use at least 8 characters.";
        nextPage = const RequestUserDetails(requiredDetails: 'gender');
    }

    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 3),
            Text(
              inputQuestion,
              style: TextStyle(
                fontFamily: "AB",
                fontSize: 20,
                color: MyColors.whiteColor,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          height: 51,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color(0xff777777),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child:
              widget.inputType == "gender"
                  ? GenderDropdown(
                    value: text,
                    onChanged: (newValue) {
                      setState(() {
                        text = newValue!;
                      });
                    },
                  )
                  : TextField(
                    onChanged: (value) {
                      setState(() {
                        text = value;
                      });
                    },
                    style: const TextStyle(
                      fontFamily: "AM",
                      fontSize: 14,
                      color: MyColors.whiteColor,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.none,
                          width: 0,
                        ),
                      ),
                    ),
                  ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              supportingText,
              style: TextStyle(
                fontFamily: "AM",
                fontSize: 10,
                color: MyColors.whiteColor,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        const SizedBox(height: 35),
        widget.inputType != "name"
            ? GestureDetector(
              onTap: () {
                if (text.length >= 6 || widget.inputType == "gender") {
                  // print("yes");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nextPage),
                  );
                }
              },
              child: Container(
                height: 45,
                width: 90,
                decoration: BoxDecoration(
                  color:
                      (text.length >= 6 || widget.inputType == "gender")
                          ? MyColors.whiteColor
                          : MyColors.lightGrey,
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                child: const Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontFamily: "AB",
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            )
            : PrivacyPolicy(
              text: text, // Pass the current text value
              newsCheck: newsCheck, // Pass the current newsCheck value
              marketPurposeCheck:
                  marketPurposeCheck, // Pass the current marketPurposeCheck value
              onNewsCheckChanged: (newValue) {
                setState(() {
                  newsCheck = newValue;
                });
              },
              onMarketPurposeCheckChanged: (newValue) {
                setState(() {
                  marketPurposeCheck = newValue;
                });
              },
              onCreateAccountPressed: () {
                if (text.length > 6) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ChooseArtistScreen(),
                    ),
                  );
                }
              },
            ),
      ],
    );
  }
}

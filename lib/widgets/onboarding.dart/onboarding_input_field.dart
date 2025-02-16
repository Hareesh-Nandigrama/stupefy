import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../pages/auth/choose_artist_screen.dart';
import '../../pages/auth/request_user_details.dart';

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
    switch (this.widget.inputType) {
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
        supportingText = "This appears on your spotify profile";
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
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: widget.inputType == "gender"
              ? Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: DropdownButton(
                    dropdownColor: MyColors.lightGrey,
                    itemHeight: 50.0,
                    isExpanded: true,
                    icon: Image.asset("images/icon_tic.png"),
                    underline: Container(),
                    items: const [
                      DropdownMenuItem<String>(
                        value: "Male",
                        child: Text(
                          "Male",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "AM",
                          ),
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: "Female",
                        child: Text(
                          "Female",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "AM",
                          ),
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: "Prefres not to say",
                        child: Text(
                          "Prefer not to say",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "AM",
                          ),
                        ),
                      ),
                    ],
                    onChanged: (onChanged) {
                      setState(() {
                        print(onChanged);
                        text = onChanged!;
                      });
                    },
                    value: text,
                  ),
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
        const SizedBox(
          height: 8,
        ),
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
        const SizedBox(
          height: 35,
        ),
        widget.inputType != "name"
            ? GestureDetector(
                onTap: () {
                  if (text.length >= 6 || widget.inputType == "gender") {
                    print("yes");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => nextPage,
                      ),
                    );
                  }
                },
                child: Container(
                  height: 45,
                  width: 90,
                  decoration: BoxDecoration(
                    color: (text.length >= 6 || widget.inputType == "gender")
                        ? MyColors.whiteColor
                        : MyColors.lightGrey,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
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
            : Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Divider(
                    thickness: 1.3,
                    color: MyColors.lightGrey,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'By tapping on "Create account" you agree to the spotify Terms of Use.',
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 12,
                      color: MyColors.whiteColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Terms of Use',
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 12,
                      color: MyColors.greenColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'To learn more about how spotify collect, uses, shares and portects your personal data, Please see the spotify Privacy Policy.',
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 12,
                      color: MyColors.whiteColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 12,
                      color: MyColors.greenColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Please send me news and offers from spotify.",
                        style: TextStyle(
                          fontFamily: "AM",
                          fontSize: 12,
                          color: MyColors.whiteColor,
                        ),
                      ),
                      const Spacer(),
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          shape: const CircleBorder(),
                          activeColor: MyColors.greenColor,
                          checkColor: MyColors.whiteColor,
                          value: newsCheck,
                          onChanged: (onChanged) {
                            setState(() {
                              newsCheck = onChanged!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 260,
                        child: Text(
                          "Share my registration data with Spotify's content providers for marketing purposes.",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 12,
                            color: MyColors.whiteColor,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          shape: const CircleBorder(),
                          activeColor: MyColors.greenColor,
                          checkColor: MyColors.whiteColor,
                          value: marketPurposeCheck,
                          onChanged: (onChanged) {
                            setState(() {
                              marketPurposeCheck = onChanged!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (text.length > 6) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ChooseArtistScreen(),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 35),
                        child: Container(
                          height: 42,
                          width: 179,
                          decoration: BoxDecoration(
                            color: (text.length > 6)
                                ? MyColors.whiteColor
                                : MyColors.lightGrey,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Create an account",
                              style: TextStyle(
                                fontFamily: "AB",
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}

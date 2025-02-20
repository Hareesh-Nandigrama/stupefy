import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/onboarding.dart/onboarding_header.dart';
import '../../widgets/onboarding.dart/onboarding_input_field.dart';

class RequestUserDetails extends StatefulWidget {
  final String requiredDetails;
  const RequestUserDetails({super.key, required this.requiredDetails});

  @override
  State<RequestUserDetails> createState() => _RequestUserDetailsState();
}

class _RequestUserDetailsState extends State<RequestUserDetails> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard on tap outside
      },
      child: Scaffold(
        backgroundColor: MyColors.darGreyColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                OnboardingHeader(title: "Create Account"),
                OnboardingInputField(inputType: widget.requiredDetails),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
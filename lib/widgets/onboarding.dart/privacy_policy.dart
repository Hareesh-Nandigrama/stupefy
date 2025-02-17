import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../pages/auth/choose_artist_screen.dart';


class PrivacyPolicy extends StatefulWidget {
  final String text;
  final bool newsCheck;
  final bool marketPurposeCheck;
  final Function(bool) onNewsCheckChanged;
  final Function(bool) onMarketPurposeCheckChanged;
  final VoidCallback onCreateAccountPressed;

  const PrivacyPolicy({
    Key? key,
    required this.text,
    required this.newsCheck,
    required this.marketPurposeCheck,
    required this.onNewsCheckChanged,
    required this.onMarketPurposeCheckChanged,
    required this.onCreateAccountPressed,
  }) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
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
            'To learn more about how spotify collect, uses, shares and protects your personal data, Please see the spotify Privacy Policy.',
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
                  value: widget.newsCheck,
                  onChanged: (onChanged) {
                    setState(() {
                      widget.onNewsCheckChanged(onChanged!);
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
                  value: widget.marketPurposeCheck,
                  onChanged: (onChanged) {
                    setState(() {
                      widget.onMarketPurposeCheckChanged(onChanged!);
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
                if (widget.text.length > 6) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ChooseArtistScreen(),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: 42,
                  width: 179,
                  decoration: BoxDecoration(
                    color: (widget.text.length > 6)
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
        ]
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:stupefy/pages/dashboard/home_screen.dart';

import '../../constants/colors.dart';
import '../../pages/auth/choose_podcast_screen.dart';
import '../nav_bar/nav_bar_wrapper.dart';

class ChooseDoneButton extends StatelessWidget {
  final bool isArtist;

  const ChooseDoneButton({super.key, required this.isArtist});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 55),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          backgroundColor: MyColors.whiteColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                      isArtist ? ChoosePodcastScreen() : HomeScreen(),
            ),
          );
        },
        child: const Text(
          "Done",
          style: TextStyle(fontFamily: "AB", color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/media_player/bottom_player.dart';
import 'profile_screen.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.blackColor,
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 65,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontFamily: "AB",
            fontSize: 16,
            color: MyColors.whiteColor,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("assets/images/icon_arrow_left.png"),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              _ProfileSection(),
              _SettingsOptionChip(title: "Account"),
              _SettingsOptionChip(title: "Data Saver"),
              _SettingsOptionChip(title: "Langugages"),
              _SettingsOptionChip(title: "Playback"),
              _SettingsOptionChip(title: "Explicit Content"),
              _SettingsOptionChip(title: "Devices"),
              _SettingsOptionChip(title: "Car"),
              _SettingsOptionChip(title: "Social"),
              _SettingsOptionChip(title: "Voice Assistant & Apps"),
              _SettingsOptionChip(title: "Audio Quality"),
              _SettingsOptionChip(title: "Storage"),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsOptionChip extends StatelessWidget {
  const _SettingsOptionChip({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                 
                fontSize: 16,
                color: MyColors.whiteColor,
              ),
            ),
            Image.asset("assets/images/icon_arrow_right.png"),
          ],
        ),
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 45),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage("assets/images/myImage.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Mohammad",
                          style: TextStyle(
                            fontFamily: "AB",
                            fontSize: 18,
                            color: MyColors.whiteColor,
                          ),
                        ),
                        Text(
                          "View Profile",
                          style: TextStyle(
                             
                            fontSize: 13,
                            color: MyColors.lightGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset("assets/images/icon_arrow_right.png"),
            ],
          ),
        ),
      ),
    );
  }
}

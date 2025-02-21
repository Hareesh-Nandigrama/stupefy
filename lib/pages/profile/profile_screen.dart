import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/media_player/bottom_player.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff101010),
                        width: 0,
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff00667B),
                          Color(0xff002F38),
                          Color(0xff101010),
                        ],
                      ),
                    ),
                    child: const _ProfileHeader(),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff101010),
                        width: 0,
                      ),
                      color: const Color(0xff101010),
                    ),
                    child: const _ProfilePlaylists(),
                  ),
                ),
              ],
            ),
            const BottomPlayer(),
          ],
        ),
      ),
    );
  }
}

class _ProfilePlaylists extends StatelessWidget {
  const _ProfilePlaylists();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10,
        ),
        Image.asset("assets/images/shazam_playlist.png"),
        const SizedBox(
          height: 5,
        ),
        Image.asset("assets/images/roadtrip_playlist.png"),
        const SizedBox(
          height: 5,
        ),
        Image.asset("assets/images/study_playlist.png"),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "See all playlists",
                style: TextStyle(
                   
                  fontSize: 15,
                  color: MyColors.whiteColor,
                ),
              ),
              Image.asset("assets/images/icon_arrow_right.png"),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/images/icon_arrow_left.png"),
              ),
              Image.asset(
                "assets/images/icon_more.png",
                color: MyColors.whiteColor,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage("assets/images/myImage.png"),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: 31,
                  width: 105,
                  decoration: BoxDecoration(
                    color: const Color(0xff3E3F3F),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontFamily: "AB",
                        color: MyColors.whiteColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusted for better spacing
                  children: [
                    _buildStatColumn("23", "PlayLists"),
                    _buildStatColumn("58", "Followers"),
                    _buildStatColumn("43", "Following"),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30), // Keep the desired padding
            child: Text(
              "Playlists",
              overflow: TextOverflow.ellipsis, // Handle overflow
              maxLines: 1, // Ensure single line
              style: const TextStyle(
                 
                fontWeight: FontWeight.w800,
                color: MyColors.whiteColor,
                fontSize: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
             
            fontSize: 12,
            color: MyColors.whiteColor,
          ),
        ),
        const SizedBox(height: 4), // Added spacing for better readability
        Text(
          label,
          style: const TextStyle(
             
            fontSize: 10,
            color: MyColors.lightGrey,
          ),
        ),
      ],
    );
  }
}

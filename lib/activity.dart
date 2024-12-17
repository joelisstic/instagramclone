import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          buildSectionTitle("New"),
          buildNotificationTile(
            icon: Icons.movie_creation_outlined,
            title:
            "22.8K people created reels using audio that you saved, Panthalchant by Mu.Ri, Dabzee, baby jean, Jok...",
            time: "13h",
            onTap: () {},
          ),

          buildSectionTitle("Yesterday"),
          buildNotificationTile(
            avatarPath: "assets/images/pic1.jpg",
            title:
            "Tom, _kannan_k21 and 250 others liked your post.",
            time: "18h",
            onTap: () {},
          ),
          buildNotificationTile(
            avatarPath: "assets/images/pic4.jpg",
            title:
            "Jayce posted a thread that you might like: A quiet moment, where beauty meets serenity✨",
            time: "24h",
            onTap: () {},
          ),
          buildSectionTitle("Last 7 days"),
          buildNotificationTile(
            avatarPath: "assets/images/pic5.jpg",
            title:
            "jeffry posted a thread that you might like: ❤️",
            time: "2d",
            onTap: () {},
          ),
          buildNotificationTile(
            avatarPath: "assets/images/pic6.jpg",
            title:
            "Stephy mentioned you in a comment: @joelisstic 👏",
            time: "2d",
            onTap: () {},
          ),
          buildNotificationTile(
            icon: Icons.poll,
            title: "Take a look at the latest results of iamharshvikas's poll.",
            time: "6d",
            onTap: () {},
          ),
          buildNotificationTile(
            avatarPath: "assets/images/pic7.jpg",
            title: "Mickey, who you might know, is on Instagram.",
            trailingButton: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text("Follow",
                  style: TextStyle(color: Colors.white)),
            ),
            time: "1w",
            onTap: () {},
          ),
          buildNotificationTile(
            avatarPath: "assets/images/pic8.jpg",
            title:
            "Martii also commented on d_o_n_a_'s post: 'Rider mwuth🔥🔥🔥'",
            time: "1w",
            onTap: () {},
          ),
          buildSectionTitle("Last 30 days"),
          buildNotificationTile(
            avatarPath: "assets/images/pic9.jpg",
            title: "Kurian_thoma, _aswin_subhash and 220 others liked your photo.",
            time: "1w",
            onTap: () {},
          ),
          buildNotificationTile(
            icon: Icons.music_note,
            title:
            "755 people created reels using audio that you saved, Thaaragayae (From 'Halal Shawarma') by Barath D...",
            time: "1w",
            onTap: () {},
          ),
          buildNotificationTile(
            avatarPath: "assets/images/pic3.jpg",
            title: "Renju, who you might know, is on Instagram.",
            trailingButton: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text("Follow",
                  style: TextStyle(color: Colors.white)),
            ),
            time: "1w",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildNotificationTile({
    String? avatarPath,
    IconData? icon,
    required String title,
    String? subtitle,
    String time = "",
    Widget? trailingButton,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: avatarPath != null
          ? CircleAvatar(
        backgroundImage: AssetImage(avatarPath),
        radius: 20,
      )
          : Icon(icon, color: Colors.grey, size: 24),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      subtitle: subtitle != null
          ? Text(
        subtitle,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      )
          : time.isNotEmpty
          ? Text(
        time,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      )
          : null,
      trailing: trailingButton,
      onTap: onTap,
    );
  }
}


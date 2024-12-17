import 'package:flutter/material.dart';

class InstagramSettingsPage extends StatelessWidget {
  const InstagramSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color(0xff1c1c1c),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          buildSectionTitle("Your account"),
          buildListTile(
            title: "Accounts Centre",
            subtitle: "Password, security, personal details, ad preferences",
            onTap: () {},
          ),
          const Divider(color: Colors.grey),
          buildSectionTitle("How you use Instagram"),
          buildListTile(title: "Saved", onTap: () {}),
          buildListTile(title: "Archive", onTap: () {}),
          buildListTile(title: "Your activity", onTap: () {}),
          buildListTile(title: "Notifications", onTap: () {}),
          buildListTile(title: "Time management", onTap: () {}),
          const Divider(color: Colors.grey),
          buildSectionTitle("For professionals"),
          buildListTile(title: "Insights", onTap: () {}),
          buildListTile(title: "Meta Verified", subtitle: "Not subscribed", onTap: () {}),
          buildListTile(title: "Scheduled content", onTap: () {}),
          buildListTile(title: "Creator tools and controls", onTap: () {}),
          const Divider(color: Colors.grey),
          buildSectionTitle("Who can see your content"),
          buildListTile(title: "Account privacy", subtitle: "Public", onTap: () {}),
          buildListTile(title: "Close friends", subtitle: "130", onTap: () {}),
          buildListTile(title: "Crossposting", onTap: () {}),
          buildListTile(title: "Blocked", subtitle: "4", onTap: () {}),
          buildListTile(title: "Hide story and live", onTap: () {}),
          const Divider(color: Colors.grey),
          buildSectionTitle("How others can interact with you"),
          buildListTile(title: "Messages and story replies", onTap: () {}),
          buildListTile(title: "Tags and mentions", onTap: () {}),
          buildListTile(title: "Comments", onTap: () {}),
          buildListTile(title: "Sharing and reuse", onTap: () {}),
          buildListTile(title: "Restricted", subtitle: "1", onTap: () {}),
          buildListTile(title: "Limit interactions", onTap: () {}),
          buildListTile(title: "Hidden words", onTap: () {}),
          buildListTile(title: "Follow and invite friends", onTap: () {}),
          const Divider(color: Colors.grey),
          buildSectionTitle("What you see"),
          buildListTile(title: "Favourites", subtitle: "0", onTap: () {}),
          buildListTile(title: "Muted accounts", subtitle: "0", onTap: () {}),
          buildListTile(title: "Suggested content", onTap: () {}),
          buildListTile(title: "Like and share counts", onTap: () {}),
          const Divider(color: Colors.grey),
          buildSectionTitle("Your app and media"),
          buildListTile(title: "Device permissions", onTap: () {}),
          buildListTile(title: "Archiving and downloading", onTap: () {}),
          buildListTile(title: "Accessibility and translations", onTap: () {}),
          buildListTile(title: "Language", onTap: () {}),
          buildListTile(title: "Data usage and media quality", onTap: () {}),
          buildListTile(title: "App website permissions", onTap: () {}),
          const Divider(color: Colors.grey),
          buildSectionTitle("For families"),
          buildListTile(title: "Family Centre", onTap: () {}),
          const Divider(color: Colors.grey),
          buildSectionTitle("Your orders and fundraisers"),
          buildListTile(title: "Orders and payments", onTap: () {}),
          const Divider(color: Colors.grey),
          buildSectionTitle("More info and support"),
          buildListTile(title: "Help", onTap: () {}),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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

  Widget buildListTile({
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: subtitle != null
          ? Text(
        subtitle,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      )
          : null,
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: onTap,
    );
  }
}

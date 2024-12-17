import 'package:clonetaskinstagram/profile.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        backgroundColor: Colors.black,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),color: Colors.white,),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context,);

            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture and Avatar
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: const AssetImage('assets/images/sampledp.jpg'),

                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                      },
                      child: const Text(
                        "Edit picture or avatar",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Name Field
              _buildInputField("Name", "Alice"),
              // Username Field
              _buildInputField("Username", "alice"),
              // Pronouns Field
              _buildInputField("Pronouns", ""),
              // Bio Field
              _buildInputField("Bio", ""),
              const SizedBox(height: 10),
              // Add Link and Add Banners
              _buildClickableField("Add Link", ),
              const SizedBox(height: 10),
              _buildClickableField("Add Banners", ),
              const SizedBox(height: 20),
              // Gender Dropdown
              _buildDropdownField("Gender", "Male"),
              const Divider(color: Colors.grey),
              // Profile Information Section
              _buildClickableField("Profile information"),
              _buildClickableField("Page", subtitle: "Connect or create"),
              _buildClickableField("Category", subtitle: "Artist"),
              _buildClickableField("Contact options"),
              _buildClickableField("Action buttons", subtitle: "None active"),
              _buildClickableField("Profile display", subtitle: "All hidden"),
              _buildClickableField("Music", subtitle: "Add music to your profile"),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              // Personal Information and Verified Profile
              const Text(
                "Personal information settings",
                style: TextStyle(color: Colors.blue),
              ),
              const SizedBox(height: 10),
              const Text(
                "Show that your profile is verified",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget to Build Input Fields
  Widget _buildInputField(String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 5),
        TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[900],
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  // Helper Widget to Build Dropdown Field
  Widget _buildDropdownField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: value,
            dropdownColor: Colors.black,
            isExpanded: true,
            underline: const SizedBox(),
            style: const TextStyle(color: Colors.white),
            items: const [
              DropdownMenuItem(value: "Male", child: Text("Male")),
              DropdownMenuItem(value: "Female", child: Text("Female")),
              DropdownMenuItem(value: "Other", child: Text("Other")),
            ],
            onChanged: (newValue) {
            },
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  // Helper Widget to Build Clickable Fields
  Widget _buildClickableField(String title, {String? subtitle}) {
    return ListTile(
      onTap: () {
      },
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: subtitle != null
          ? Text(
        subtitle,
        style: const TextStyle(color: Colors.grey),
      )
          : null,
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
    );
  }
}

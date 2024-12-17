import 'package:clonetaskinstagram/camm.dart';
import 'package:clonetaskinstagram/profilemenu.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'editprofile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text(
              "alicee",
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ))
          ],
        ),
        leadingWidth: 190,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return Camm();
              }));
            },
            icon: const Icon(
              MdiIcons.plusBoxOutline,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return InstagramSettingsPage();
              }));
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/images/sampledp.jpg'),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Alice",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                SizedBox(width: 50),
                Column(
                  children: [
                    Text(
                      "3",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "posts",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                SizedBox(width: 50),
                Column(
                  children: [
                    Text(
                      "630",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "followers",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                SizedBox(width: 50),
                Column(
                  children: [
                    Text(
                      "631",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "following",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff302f2f),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: InkWell(
                          child: const Text(
                            "Edit profile",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditProfilePage()),
                            );
                          },
                        ),

                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff302f2f),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          "Share profile",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff302f2f),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person_add,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  icon: Icon(
                    Icons.grid_on_sharp,
                    color: selectedIndex == 0 ? Colors.white : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  icon: Icon(
                    MdiIcons.playBoxOutline,
                    color: selectedIndex == 1 ? Colors.white : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  icon: Icon(
                    Icons.person_pin_outlined,
                    color: selectedIndex == 2 ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
            const Divider(thickness: 0.1, color: Colors.white),
            Expanded(
              child: selectedIndex == 0
                  ? GridView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  final images = [
                    "assets/images/samplepost.jpg",
                    "assets/images/pic0.jpg",
                    "assets/images/sampledp.jpg",
                  ];
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: const EdgeInsets.all(2.0),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
              )
                  : selectedIndex == 1
                  ? const Center(
                child: Text(
                  "Reels not posted yet",
                  style: TextStyle(color: Colors.white),
                ),
              )
                  : GridView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  final taggedImages = [
                    "assets/images/pic1.jpg",
                    "assets/images/pic2.jpg",
                    "assets/images/pic3.jpg",
                  ];
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(taggedImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: const EdgeInsets.all(2.0),
                  );
                },
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

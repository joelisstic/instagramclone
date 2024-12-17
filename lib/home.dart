import 'package:clonetaskinstagram/activity.dart';
import 'package:clonetaskinstagram/messeges.dart';
import 'package:clonetaskinstagram/storiespage.dart';
import 'package:clonetaskinstagram/users.dart';
import 'package:flutter/material.dart';

import 'camm.dart';

class Home extends StatefulWidget {
  final Users? selectedUser;

  const Home({super.key, this.selectedUser});

  @override
  State<Home> createState() => _HomeState();
}

List<Users> myusers = [
  Users(
    url: "pic0",
    names: "Alice",
  ),
  Users(
    url: "pic1",
    names: "Tom",
  ),
  Users(
    url: "pic2",
    names: "Mathew",
  ),
  Users(
    url: "pic3",
    names: "Ronald",
  ),
  Users(
    url: "pic4",
    names: "John",
  ),
  Users(
    url: "pic5",
    names: "Jacob",
  ),
  Users(
    url: "pic6",
    names: "Stephy",
  ),
  Users(
    url: "pic7",
    names: "Michael",
  ),
  Users(
    url: "pic8",
    names: "Martin",
  ),
  Users(
    url: "pic9",
    names: "Karen",
  ),
];

class _HomeState extends State<Home> {
  late List<Users> usersList;

  @override
  void initState() {
    super.initState();
    // Make the selected user the first post if passed
    if (widget.selectedUser != null) {
      usersList = [widget.selectedUser!, ...myusers.where((user) => user != widget.selectedUser)];
    } else {
      usersList = myusers;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Instagram",
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: "Fontspring"),
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
          Stack(children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return NotificationsPage();
                }));
              },
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
            const Positioned(
              top: 12,
              right: 10,
              child: Icon(
                Icons.circle,
                color: Colors.red,
                size: 10,
              ),
            )
          ]),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return MessengerScreen();
              }));
            },
            icon: const Icon(
              Icons.messenger_outline,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Container(
                          child: Stack(children: [
                            InkWell(
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(
                                    'assets/images/${myusers[index].url}.jpg'),
                              ),
                              onTap: (){
                                if (index == 0) {
                                  // Navigate to the StoriesPage for the first user
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Camm(),
                                    ),
                                  );
                                }
                                else{

                                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StoriesPage(users: myusers),
                              ),
                            );}}
                              ,
                            ),
                            if (myusers[index].names == "Alice")
                              const Positioned(
                                bottom: 0,
                                right: 0,
                                child: Stack(children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.add_circle,
                                    color: Colors.blue,
                                  ),
                                ]),
                              ),
                          ]),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          myusers[index].names == "joelisstic"
                              ? "Your Story"
                              : myusers[index].names,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 3);
                },
                itemCount: 10,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  final bool isFirstPost = index == 0;
                  final String dpImage = isFirstPost ? "sampledp.jpg" : "${usersList[index].url}.jpg";
                  final String postImage = isFirstPost ? "sampledp.jpg" : "${usersList[index].url}.jpg";

                  return Column(
                    children: [
                      // Post Header
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/$dpImage"),
                        ),
                        title: Text(
                          usersList[index].names,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: const Text("Mysore", style: TextStyle(color: Colors.white54)),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert, color: Colors.white),
                        ),
                        contentPadding: const EdgeInsets.only(
                            right: 0, left: 10),
                      ),

                      // Post Image
                      Container(
                        height: 500,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/$postImage"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_border, color: Colors.white)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.chat_bubble_outline, color: Colors.white)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.send_sharp, color: Colors.white)),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_border, color: Colors.white)),
                        ],
                      ),

                      // Likes and Comments Section
                      SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            const Positioned(
                              left: 30,
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/images/pic1.jpg"),
                                maxRadius: 10,
                              ),
                            ),
                            const Positioned(
                              left: 25,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                maxRadius: 10,
                              ),
                            ),
                            const Positioned(
                              left: 20,
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/images/pic4.jpg"),
                                maxRadius: 10,
                              ),
                            ),
                            const Positioned(
                              left: 15,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                maxRadius: 10,
                              ),
                            ),
                            const Positioned(
                              left: 10,
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/images/pic8.jpg"),
                                maxRadius: 10,
                              ),
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 60),
                                Text(
                                  "Liked by ${myusers[8].names} and others",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            "${myusers[index].names} 😎",
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Expanded(child: SizedBox())
                        ],
                      ),
                      const Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "View all comments",
                            style: TextStyle(color: Colors.white54),
                          ),
                          Expanded(child: SizedBox())
                        ],
                      ),
                      const Row(
                        children: [
                          SizedBox(width: 10),
                          CircleAvatar(
                            maxRadius: 15,
                            backgroundImage: AssetImage("assets/images/pic0.jpg"),
                          ),
                          SizedBox(width: 5),
                          Text("Add a comment", style: TextStyle(color: Colors.white54)),
                        ],
                      ),
                      const Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "2 days ago",
                            style: TextStyle(color: Colors.white54),
                          ),
                          Expanded(child: SizedBox())
                        ],
                      ),

                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

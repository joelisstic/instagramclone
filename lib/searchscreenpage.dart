import 'package:flutter/material.dart';
import 'users.dart';

class Searchscreenpage extends StatelessWidget {
  final List<Users> users;
  final Users initialUser;

  const Searchscreenpage(
      {Key? key, required this.users, required this.initialUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Reorder the list to make the initialUser's post the first post
    final reorderedUsers = [
      initialUser,
      ...users.where((user) => user != initialUser)
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "Exlpore",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: reorderedUsers.length,
        itemBuilder: (context, index) {
          final user = reorderedUsers[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Post Header
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/${user.url}.jpg"),
                ),
                title: Text(
                  user.names,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Mysore", // Example location
                  style: TextStyle(color: Colors.white54),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                ),
              ),

              // Post Image
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/${user.url}.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Post Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat_bubble_outline,
                            color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send_sharp, color: Colors.white),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.bookmark_border, color: Colors.white),
                  ),
                ],
              ),

              // Likes Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Liked by someone and others", // Example text
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              // Post Caption
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "${user.names} 😎",
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              // View Comments
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  "View all comments",
                  style: TextStyle(color: Colors.white54),
                ),
              ),

              // Add a Comment
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    const CircleAvatar(
                      maxRadius: 15,
                      backgroundImage: AssetImage("assets/images/pic0.jpg"),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Add a comment...",
                      style: TextStyle(color: Colors.white54),
                    ),
                  ],
                ),
              ),

              // Post Timestamp
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  "2 days ago",
                  style: TextStyle(color: Colors.white54),
                ),
              ),

              const Divider(color: Colors.grey, thickness: 0.5),
            ],
          );
        },
      ),
    );
  }
}

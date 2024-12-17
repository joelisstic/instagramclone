import 'package:clonetaskinstagram/users.dart';
import 'package:flutter/material.dart';

class StoriesPage extends StatefulWidget {
  final List<Users> users;

  const StoriesPage({Key? key, required this.users}) : super(key: key);

  @override
  _StoriesPageState createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  late PageController _pageController;
  int currentUserIndex = 0;
  int currentStoryIndex = 0;

  List<List<String>> userStories = [
    ["pic0.jpg", "pic1.jpg", "pic2.jpg"], // Stories for user 1
    ["pic3.jpg", "pic4.jpg"],              // Stories for user 2
    ["pic5.jpg", "pic6.jpg", "pic7.jpg"],// Stories for user 3
    ["pic0.jpg", "pic1.jpg", ], // Stories for user 4
    ["pic3.jpg", "pic4.jpg","pic2.jpg"],              // Stories for user 5
    ["pic5.jpg", "pic6.jpg","pic2.jpg", "pic7.jpg"],// Stories for user 6
    ["pic3.jpg", "pic4.jpg","pic8.jpg"],              // Stories for user 7
    ["pic5.jpg","pic4.jpg", "pic6.jpg","pic2.jpg", "pic7.jpg"],// Stories for user 8
    ["pic8.jpg", "pic6.jpg"],// Stories for user 9
    ["pic1.jpg", "pic6.jpg","pic0.jpg", "pic7.jpg"],// Stories for user 10


  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void _onStoryTap(bool isNext) {
    setState(() {
      if (isNext) {
        if (currentStoryIndex < userStories[currentUserIndex].length - 1) {
          currentStoryIndex++;
        } else if (currentUserIndex < widget.users.length - 1) {
          currentUserIndex++;
          currentStoryIndex = 0;
        }
      } else {
        if (currentStoryIndex > 0) {
          currentStoryIndex--;
        } else if (currentUserIndex > 0) {
          currentUserIndex--;
          currentStoryIndex = userStories[currentUserIndex].length - 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.users[currentUserIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapUp: (details) {
          final screenWidth = MediaQuery.of(context).size.width;
          if (details.globalPosition.dx < screenWidth / 2) {
            _onStoryTap(false); // Previous story
          } else {
            _onStoryTap(true); // Next story
          }
        },
        child: Stack(
          children: [
            // Story Image
            Positioned.fill(
              child: Image.asset(
                "assets/images/${userStories[currentUserIndex][currentStoryIndex]}",
                fit: BoxFit.cover,
              ),
            ),
            // Story Progress Indicators
            Positioned(
              top: 50,
              left: 10,
              right: 10,
              child: Row(
                children: userStories[currentUserIndex]
                    .asMap()
                    .entries
                    .map((entry) {
                  int index = entry.key;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: LinearProgressIndicator(
                        value: index <= currentStoryIndex ? 1 : 0,
                        color: Colors.white,
                        backgroundColor: Colors.white24,
                        minHeight: 2,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // User Info and Close Button
            Positioned(
              top: 60,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                        AssetImage("assets/images/${user.url}.jpg"),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        user.names,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

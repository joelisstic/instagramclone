import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'searchscreenpage.dart';
import 'users.dart';

class Search extends StatelessWidget {
  final List<Users> users = [
    Users(names: "Alice", url: "pic0"),
    Users(names: "Tom", url: "pic1"),
    Users(names: "Mathew", url: "pic2"),
    Users(names: "Ronald", url: "pic3"),
    Users(names: "John", url: "pic4"),
    Users(names: "Jacob", url: "pic5"),
    Users(names: "Stephy", url: "pic6"),
    Users(names: "Michael", url: "pic7"),
    Users(names: "Martin", url: "pic8"),
    Users(names: "Karen", url: "pic9"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20),
                hintText: 'Search...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          crossAxisCount: 3, // 3 columns
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemCount: users.length * 2,
          itemBuilder: (context, index) {
            final user = users[index % users.length];

            final isTall =index  ==2 || index == 5 || index == 12||index == 15;

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Searchscreenpage(users: users, initialUser: user),
                  ),
                );
              },
              child: Container(
                height: isTall ? 250 : 123,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/images/${user.url}.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

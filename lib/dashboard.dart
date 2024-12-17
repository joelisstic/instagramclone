import 'package:clonetaskinstagram/profile.dart';
import 'package:clonetaskinstagram/reels.dart';
import 'package:clonetaskinstagram/search.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'camm.dart';
import 'home.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentindex=0;
  List<Widget>pages=[
    const Home(),
     Search(),
    const Camm(),
    const Reels(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],


      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: currentindex,
        onTap: (int i){
          setState(() {
            currentindex=i;
          });
        },items: [
        BottomNavigationBarItem(
          icon: Icon(
            currentindex == 0 ? MdiIcons.home: MdiIcons.homeOutline,
            color: currentindex == 0 ? Colors.white : Colors.grey,
            size: currentindex==0? 30:24,


          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentindex == 1 ? Icons.search: Icons.search_outlined,
            color: currentindex == 1 ? Colors.white : Colors.grey,
            size: currentindex==1? 30:24,

          ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentindex == 2 ? MdiIcons.plusBox: MdiIcons.plusBoxOutline,
            color: currentindex == 2? Colors.white : Colors.grey,
            size: currentindex==2? 30:24,

          ),
          label: "Post",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentindex == 3 ? MdiIcons.playBox : MdiIcons.playBoxOutline,
            color: currentindex == 3 ? Colors.white : Colors.grey,
            size: currentindex==3? 30:24,

          ),
          label: "Reels",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentindex == 4 ? MdiIcons.account : MdiIcons.accountOutline,
            color: currentindex == 4 ? Colors.white : Colors.grey,
            size: currentindex==4? 30:24,


          ),
          label: "Profile",
        ),


      ],
        backgroundColor: const Color(0xff000000),

      ),
    );
  }
}

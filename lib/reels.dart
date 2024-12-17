import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Reels extends StatefulWidget {
  const Reels({super.key});

  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
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
              "Reels",
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold

                  // fontFamily: "Fontspring"
                  ),
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
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Stack(children: [
        Container(
          // height: 100,
          decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: AssetImage("assets/images/samplereel.jpg"),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    MdiIcons.commentOutline,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    MdiIcons.sendOutline,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.music_video,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        Positioned(
          left: 0,
          bottom: 10,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/pic1.jpg"),
                    ),
                    const SizedBox(width: 10,),
                    const Text("Tommy",style: TextStyle(color: Colors.white),),
                    const SizedBox(width: 10,),
                
                    Container(
                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 15,right: 15),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text("Follow",style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
                const SizedBox(height: 5,),
                const Text("🤩🥵"),
                Container(
                  decoration: BoxDecoration(color: Colors.black45,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:const Padding(
                    padding: EdgeInsets.only(left: 10.0,right: 10,top: 2,bottom: 2),
                    child: Row(
                      children: [
                        Icon(MdiIcons.music,color: Colors.white54,),
                        SizedBox(width: 10,),
                        Text("Name of the audio",style: TextStyle(color: Colors.white54
                        )),
                      ],
                    ),
                  ) ,)
              ],
            ),
          ),
        )
      ]),
    );
  }
}

import 'package:clonetaskinstagram/instalogin.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Instalogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}


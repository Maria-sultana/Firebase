import 'dart:ui';

import 'package:firebase_app/pages/details.dart';
import 'package:firebase_app/pages/gallery.dart';
import 'package:firebase_app/pages/popular.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final mypage = [
    Details(),
    Gallery(),
    Popular(),
  ];
  int _indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Blog App",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        ),
      ),
      body: mypage[_indexPage],
      bottomNavigationBar: CurvedNavigationBar(items: [
      Icon(Icons.add, size: 30),
      Icon(Icons.list, size: 30),
      Icon(Icons.compare_arrows, size: 30),
    ],onTap: (index) {
      _indexPage =index;
    },)
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uniconverter/bookmark.dart';
import 'package:uniconverter/home_page.dart';
import 'package:uniconverter/live.dart';
import 'package:uniconverter/recents.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  List<Widget> navList = const [
    Homepage(),
    Live(),
    Recents(),
    Bookmark(),
  ];

  int selectedIndex = 0;
  static const List<Destination> allDestinations = <Destination>[
    Destination(0, 'Home', Icons.home, Colors.cyan),
    Destination(1, 'Live', Icons.online_prediction, Colors.orange),
    Destination(2, 'Recents', Icons.history, Colors.cyan),
    Destination(3, 'Bookmarks', Icons.bookmark, Colors.cyan),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: navList[selectedIndex],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: allDestinations.map<NavigationDestination>(
          (Destination destination) {
            return NavigationDestination(
              icon: Icon(destination.icon, color: destination.color),
              label: destination.title,
            );
          },
        ).toList(),
      ),
    );
  }
}

class Destination {
  const Destination(this.index, this.title, this.icon, this.color);
  final int index;
  final String title;
  final IconData icon;
  final MaterialColor color;
}

import 'package:flutter/material.dart';

class Recents extends StatelessWidget {
  const Recents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Image.asset("assets/soon.png"),
        ),
      ),
    );
  }
}

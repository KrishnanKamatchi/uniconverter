import 'package:flutter/material.dart';

class Live extends StatelessWidget {
  const Live({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
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

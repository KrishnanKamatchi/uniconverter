import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var db = Hive.box("converterStore");

  Widget card(
      String imgpath,
      String title,
      String subtitle,
      String buttontextinit,
      String buttontextaction,
      String locationRedirect,
      BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // Set the clip behavior of the card
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // Define the child widgets of the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
          Image.asset(
            imgpath,
            height: 80,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Add a container with padding that contains the card's title, text, and buttons
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Display the card's title using a font size of 24 and a dark grey color
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold),
                ),
                // Add a space between the title and the text
                Container(height: 10),
                // Display the card's text using a font size of 15 and a light grey color
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
                // Add a row with two buttons spaced apart and aligned to the right side of the card
                Row(
                  children: <Widget>[
                    // Add a spacer to push the buttons to the right side of the card
                    const Spacer(),
                    // Add a text button labeled "SHARE" with transparent foreground color and an accent color for the text
                    // TextButton(
                    //   style: TextButton.styleFrom(
                    //     foregroundColor: Colors.transparent,
                    //   ),
                    //   child: Text(
                    //     buttontextinit,
                    //     style:
                    //         const TextStyle(color: Colors.black, fontSize: 17),
                    //   ),
                    //   onPressed: () {},
                    // ),
                    // Add a text button labeled "EXPLORE" with transparent foreground color and an accent color for the text
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent,
                      ),
                      child: Text(
                        buttontextaction,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, locationRedirect);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Add a small space between the card and the next widget
          Container(height: 5),
        ],
      ),
    );
  }

  List<Customcards> cards = const <Customcards>[
    Customcards("assets/dollar.png", "Money 💱", "Convert International Money",
        "Share", "Convert", "/currencyConversion"),
    Customcards("assets/weight.png", "Weight ⚖️", "Convert Weight Units",
        "Share", "Convert", "/currencyConversion"),
    Customcards("assets/power.png", "Power 🔌", "Convert Power Units", "Share",
        "Convert", "/currencyConversion"),
    Customcards("assets/time.png", "Time 🗓️", "Convert Time Units", "Share",
        "Convert", "/currencyConversion"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: GridView.builder(
          itemCount: 4,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return card(
                cards[index].imgpath,
                cards[index].title,
                cards[index].subtitle,
                cards[index].buttontextinit,
                cards[index].buttontextaction,
                cards[index].locationRedirect,
                context);
          },
        ));
  }
}

class Customcards {
  const Customcards(this.imgpath, this.title, this.subtitle,
      this.buttontextinit, this.buttontextaction, this.locationRedirect);
  final String imgpath;
  final String title;
  final String subtitle;
  final String buttontextinit;
  final String buttontextaction;
  final String locationRedirect;
}

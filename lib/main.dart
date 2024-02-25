import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniconverter/currencyconverter.dart';
import 'package:uniconverter/home_page.dart';
import 'package:uniconverter/landing_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("recentsStore");
  await Hive.openBox("converterStore");

  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: "Uniconverter",
          channelName: "Uniconverter",
          channelDescription: "Uniconverter proprietary of CS"),
    ],
    debug: false,
  );

  runApp(const uniconverter());
}

// ignore: camel_case_types
class uniconverter extends StatelessWidget {
  const uniconverter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.teal,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: FlutterSplashScreen.gif(
        useImmersiveMode: true,
        gifPath: 'assets/loading.gif',
        gifWidth: 269,
        gifHeight: 474,
        duration: const Duration(milliseconds: 7000),
        nextScreen: Landing(),
      ),
      routes: {
        "/landing": (context) => const Homepage(),
        "/currencyConversion": (context) => const Currencyconverter(),
      },
    );
  }
}

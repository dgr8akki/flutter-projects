import 'package:calc/calculator.dart';
import 'package:calc/homepage.dart';
import 'package:calc/neu_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic Widgets',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: kDarkBackgroundColour,
      ),
      theme: ThemeData(
        canvasColor: kBackgroundColour,
        backgroundColor: Color.fromRGBO(231, 240, 247, 1),
        scaffoldBackgroundColor: Color.fromRGBO(231, 240, 247, 1),
        textTheme: TextTheme(
          headline1: GoogleFonts.dmSans(
            textStyle: TextStyle(
              fontSize: 43,
              fontWeight: FontWeight.w900,
              color: Color.fromRGBO(49, 68, 105, 1),
            ),
          ),
          headline4: GoogleFonts.dmSans(
            textStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(49, 68, 105, 1),
            ),
          ),
        ),
      ),
      home: Builder(
        builder: (BuildContext context) {
          final brightnessValue = MediaQuery.of(context).platformBrightness;
          // bool isDark = brightnessValue == Brightness.dark;
          bool isDark = brightnessValue == Brightness.dark;

          final theme = isDark ? darkNeumorphicTheme : lightNeumorphicTheme;
          // Intro, need to show the first use case: 1+1 = 2 (iphone case)
          // part of -1 Since got 2 providers, use multiprovider
          return MultiProvider(
            providers: [
              ProxyProvider0<NeumorphicTheme>(update: (_, __) => theme),
              // part of -1. Explain wanted to do on mobx and did not pursue
              // and how it is not relevant. However, very good async stuff,
              // to the non-async part. Yeah. So, use what's availabe, which
              // is change notifier and change notifier provider
              ChangeNotifierProvider<Calculator>(create: (_) => Calculator())
            ],
            child: HomePage(),
          );
        },
      ),
    );
  }
}

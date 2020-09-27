import 'package:flutter/material.dart';
import 'package:solsys/constants/styling.dart';
import 'package:solsys/pages/homepage.dart';
import 'package:solsys/responsive/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'Solar System',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              home: HomePage(),
            );
          },
        );
      },
    );
  }
}

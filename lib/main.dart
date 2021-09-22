import 'package:flutter/material.dart';
import 'package:space/widget_ui/sign_up.dart';
import 'package:space/widget_ui/space_x.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SingUp(),
      routes: {
        "sing_up" : (context) =>  SingUp() ,
        "spaceX" : (context) =>  Spacex() ,
      },
    );
  }
}

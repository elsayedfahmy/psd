import 'package:flutter/material.dart';
import 'HomePage.dart';
//import 'package:device_preview/device_preview.dart';

void main() {
//  runApp(
//    //for DevicePreview
//      DevicePreview(
//        builder: (context) => MyApp(),
//      ));
  runApp(MyApp(),);

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //  builder:DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
   //   title: 'Flutter Demo',
//      theme: ThemeData(
//
//        primarySwatch: Colors.blue,
//        // This makes the visual density adapt to the platform that you run
//        // the app on. For desktop platforms, the controls will be smaller and
//        // closer together (more dense) than on mobile platforms.
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
      home: HomePage(),
    );
  }
}


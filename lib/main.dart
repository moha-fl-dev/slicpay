import 'package:flutte/screens/Inspiration.dart';
import 'package:flutte/screens/app_page.dart';
import 'package:flutte/screens/contracts_screen.dart';
import 'package:flutte/screens/home.dart';
import 'package:flutte/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
    //statusBarBrightness: Brightness.light, //status bar brigtness
    statusBarIconBrightness: Brightness.light, //status barIcon Brightness
    //systemNavigationBarDividerColor:
    //Colors.greenAccent, //Navigation bar divider color
    systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
  ));

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Menu(),
        //'/second': (context) => InspirationPage()
      },
    );
  }
}

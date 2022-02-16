import 'package:fingerprint_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BiometricNotes',
      // theme: ThemeData(
      //   scaffoldBackgroundColor: Color(0xffff4757),
      //   primaryColor: Color(0xfff9ca24),
      //   appBarTheme: AppBarTheme(
      //       color: Color(0xfff9ca24),
      //       brightness: Brightness.dark,
      //       systemOverlayStyle:
      //           SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
      // ),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff485460),
        primaryColor: Color(0xff1e272e),
        appBarTheme: AppBarTheme(
            color: Color(0xff1e272e),
            brightness: Brightness.dark,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
      ),
      home: SplashScreen(),
    );
  }
}

import 'package:provider/provider.dart';
import 'package:sujashoei/constants/global_variables.dart';
import 'package:sujashoei/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sujashoei/provider/global_provider.dart';
import 'package:sujashoei/screens/splashscreen/splash_screen.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TabProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Pane',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor
      ),
      home: SplashScreen(),

    );
  }
}

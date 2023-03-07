import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homeScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/logo.png', height: 200,),
      title: Text(
        "Let AI design for you!",
        style: GoogleFonts.poppins(fontSize: 18, color: Colors.white)
      ),
      backgroundColor: Colors.black,
      showLoader: true,
      loadingText: Text(
          "Preparing materials",
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.teal)
      ),
      navigator: HomeScreen(),
      durationInSeconds: 5,
      loaderColor: Colors.white,
    );
  }
}
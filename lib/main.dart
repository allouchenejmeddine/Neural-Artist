import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:neural_artist/views/splashScreen.dart';
import 'package:dart_openai/openai.dart';

import 'env/env.dart';


void main() {
  OpenAI.apiKey = Env.key;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
    );
  }
}

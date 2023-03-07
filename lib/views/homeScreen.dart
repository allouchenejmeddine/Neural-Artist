import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neural_artist/views/funnyImagesGeneratorScreen.dart';
import 'package:neural_artist/views/logoGeneratorScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Color(0xff152238),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('Imagine a cat riding a car!', style : GoogleFonts.poppins(color: Color(0xff152238), fontSize: 18))
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: InkWell(
                          onTap: (){
                            Get.to(const FunnyImagesGenerator());
                          },
                          child: Container(
                            height: 80,
                            width: width-100,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Center(
                                child: Text('Funny images generator', style : GoogleFonts.poppins(color: Colors.black45, fontSize: 18,)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                        child: Divider(
                          color: Colors.blueGrey,
                          endIndent: 10,
                          indent: 10,
                          thickness: 3.0,
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child: Text('Want to generate a logo idea for your business ?', style : GoogleFonts.poppins(color: Color(0xff152238), fontSize: 18))
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: InkWell(
                          onTap: (){
                            Get.to(const LogoGenerator());
                          },
                          child: Container(
                            height: 80,
                            width: width-100,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Center(
                                child: Text('Logo generator', style : GoogleFonts.poppins(color: Colors.black45, fontSize: 18)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

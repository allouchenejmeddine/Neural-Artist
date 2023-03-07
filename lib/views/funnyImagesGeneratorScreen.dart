import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neural_artist/controllers/imageGeneratorController.dart';

class FunnyImagesGenerator extends StatefulWidget {
  const FunnyImagesGenerator({Key? key}) : super(key: key);

  @override
  State<FunnyImagesGenerator> createState() => _FunnyImagesGeneratorState();
}

class _FunnyImagesGeneratorState extends State<FunnyImagesGenerator> {
  String? dropdownvalue ;
  bool _keyboardVisible = false;
  TextEditingController requestController = TextEditingController();
  final _imageGeneratorController = ImageGeneratorController();
  String imageLink = "";


  @override
  Widget build(BuildContext context) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool imageIsGenerated = false;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xff152238),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex:  !_keyboardVisible ? 2 : 1,
                  child: SizedBox(
                    width: width,
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              !_keyboardVisible ? Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child:
                                _imageGeneratorController.generatedImage==false ?
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Your generated image will appear here',
                                        style: GoogleFonts.poppins(color: Colors.black45, fontSize: 18, ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 30,),
                                    _imageGeneratorController.isLoading== false ?
                                    const Icon(Icons.tag_faces, size: 60, color: Colors.teal,) :
                                    const CircularProgressIndicator(),
                                  ],
                                ) : Image.network(imageLink, width: 150, height: 150,),
                              ) : Container(),
                              GestureDetector(
                                onTap: () async {
                                  if(_imageGeneratorController.generatedImage == true){
                                    await _imageGeneratorController.downloadImage(imageLink);
                                  }
                                },
                                  child: _imageGeneratorController.generatedImage == true ? const Icon(Icons.arrow_circle_down_rounded, size: 40,) : const Icon(Icons.arrow_circle_down_rounded, size: 40, color: Colors.grey,)
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: width,
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: Color(0xff152238),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: requestController,
                              maxLines: 1,
                              maxLength: 50,
                              style: GoogleFonts.poppins(color: Colors.black),
                              enableSuggestions : false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                counter: const SizedBox.shrink(),
                                icon: const Icon(Icons.arrow_forward_ios, color: Colors.teal,),
                                iconColor: Colors.white,
                                fillColor: Colors.white,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    requestController.clear();
                                  },
                                  child: const Icon(Icons.delete_forever),
                                ),
                                filled: true,
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "Example : A cow riding a car",
                                hintStyle: GoogleFonts.poppins(color: Colors.black45, ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                )
                              ),
                            ),
                            DropdownButton(
                              hint: Text("Generated image size",
                                style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, ),
                              ),
                              style: GoogleFonts.poppins(color: Colors.teal, fontSize: 16),
                              focusColor: Colors.white,
                              dropdownColor: Colors.white,
                              value : dropdownvalue,
                              items: const [
                                DropdownMenuItem(
                                    value : "256",
                                    child: Text("Image of 256*256")
                                ),
                                DropdownMenuItem(
                                    value : "512",
                                    child: Text("Image of 512*512")
                                ),
                                DropdownMenuItem(
                                    value : "1024",
                                    child: Text("Image of 1024*1024")
                                ),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue;
                                });
                              },
                              isExpanded: true,
                            ),
                            SizedBox(height: 20,),
                          ],
                        )
                      ),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () async {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        if(dropdownvalue != null){
                          imageLink = await _imageGeneratorController.getFunImage(requestController.text.trim(), dropdownvalue!.trim());
                          setState(()  {
                          });
                        }else{
                          Get.snackbar(
                              'Select image size',
                              'before generating',
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.deepOrange,
                              colorText: Colors.white
                          );
                        }

                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.teal),
                      ),
                      child: Text(
                        "Generate",
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

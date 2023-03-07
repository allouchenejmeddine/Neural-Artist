import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';


class ImageGeneratorController extends GetxController{
  dynamic generatedImage = false.obs ;
  dynamic isLoading = false.obs;

  Future getFunImage(String prompt, String size) async {
    try{
      isLoading(true);
      OpenAIImageSize sizeToSubmit = OpenAIImageSize.size256;
      print(size);
      switch(size){
        case "256" : sizeToSubmit = OpenAIImageSize.size256;
        break;
        case "512" : sizeToSubmit = OpenAIImageSize.size512;
        break;
        case "1024" : sizeToSubmit = OpenAIImageSize.size1024;
        break;
      }

      OpenAIImageModel image = await OpenAI.instance.image.create(
        prompt: prompt,
        n: 1,
        size: sizeToSubmit,
        responseFormat: OpenAIResponseFormat.url,
      );
      generatedImage(true);
      isLoading(false);
      return image.data.first.url;
    }catch(e){
      isLoading(false);
      Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.deepOrange,
          colorText: Colors.white
      );
    }
  }

  Future downloadImage(String link) async {
    try{
      var imageId = await ImageDownloader.downloadImage(link);
    }catch(e){
      print(e.toString());
      Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.deepOrange,
          colorText: Colors.white
      );
    }
  }
}
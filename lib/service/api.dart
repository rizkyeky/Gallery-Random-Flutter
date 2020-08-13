import 'dart:async';
import 'dart:convert';
import 'dart:io' show InternetAddress, SocketException;
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../model/Image.dart';

class Api {
  Api() {
    print("run API");
    checkConnection();    
  }

  Future<void> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
    }
  }

  StreamController<ImageGallery> imageController = StreamController<ImageGallery>();
  
  String url = "https://picsum.photos";

  http.Client client = http.Client();

  Future<List<ImageGallery>> fetchImagesGallery(int limit) async {
    // final response = await client.get("$url/v2/list?limit=$limit");
    
    await Future.delayed(const Duration(seconds: 2));

    final List<ImageGallery> images = [
      ImageGallery.fromJson({
        "id": "1",
        "author": "Eky",
        "width": 200,
        "height": 200,
        "url": url
      }),
      ImageGallery.fromJson({
        "id": "2",
        "author": "Sese",
        "width": 200,
        "height": 200,
        "url": url
      }),
    ];

    // final images = <ImageGallery>[];
    // final parsed = json.decode(response.body) as List<dynamic>;

    // for (final img in parsed) {
    //   images.add(ImageGallery.fromJson(img as Map<String, dynamic>));
    // }

    return images;
  }

  Future<Uint8List> getImageGallery(int id, int width, int height) async {
    // print("get image from url");
    final response = await client.get("$url/id/$id/$width/$height");
    // print("get image from url success");
    return response.bodyBytes;
  }
}
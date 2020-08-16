// import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../model/Image.dart';

class Api {

  final Dio _dio = Dio();
  final String _host = "api.unsplash.com";
  final Map<String, dynamic> _header = {
    "Authorization": "Client-ID " + "1DZ0aLedKkebo2tH8RJ2I0psQ2qfmclGZ9YLq7eixDI",
    "Accept-Version": "v1"
  };
  
  Api() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options) => options.headers = _header,
    ));
  }

  Future<void> testGET() async {
    final uri = Uri.https(_host, "photos");
    final response = await _dio.get(uri.path);
    
    print(uri.toString());
    // print(response.body);

    List data = json.decode(response.body);
    Map image = data[0] as Map;
    print(data.length);
    print(image.keys);
    print(image);
  }

  Future<Uint8List> getImageGallery(int id, int width, int height) async {
    // final uri = Uri.https(_host, "photos");
    // final response = await client.get(uri, headers: _header);
    
    // print(response.body);
    
    // return response.bodyBytes;
  }
}
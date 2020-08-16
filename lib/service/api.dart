import 'dart:convert' show json;
import 'dart:typed_data';
import 'package:http/http.dart' show Client;
import '../model/Image.dart';

class Api {
  final _host = "api.unsplash.com";

  Map<String, String> _header = {
    "Authorization": "Client-ID " + "1DZ0aLedKkebo2tH8RJ2I0psQ2qfmclGZ9YLq7eixDI",
    "Accept-Version": "v1"
  };

  Client _client = Client();

  Future<List<ImageGallery>> imageGETs() async {
    final uri = Uri.https(_host, "photos");
    final response = await _client.get(uri, headers: _header);
    
    print(uri.toString());

    var data = json.decode(response.body);
    List<ImageGallery> images = [];

    for (var map in data) {
      images.add(ImageGallery.fromJson(map as Map<String, dynamic>)); 
    }

    // images.forEach((element) {print(element.toString());});

    return images;
  }

  Future<Uint8List> getImageGallery(int id, int width, int height) async {
    // final uri = Uri.https(_host, "photos");
    // final response = await _client.get("$url/id/$id/$width/$height");
    // final response = await _client.get(uri, headers: _header);
    
    // print(response.body);
    
    // return response.bodyBytes;
  }
}
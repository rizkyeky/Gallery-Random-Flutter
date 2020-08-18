import 'dart:convert' show json;
import 'dart:typed_data' show Uint8List;
import 'package:http/http.dart' show Client;
import '../model/Image.dart';
import 'token.dart';

class Api {
  final _host = "api.unsplash.com";

  Map<String, String> _header = {
    "Authorization": "Client-ID " + token,
    "Accept-Version": "v1"
  };

  Client _client = Client();

  Future<List<ImageGallery>> getImages({int page = 1, int perPage = 10}) async {
    final uri = Uri.https(_host, "photos", {
      "page": page.toString(),
      "per_page": perPage.toString()
    });
    final response = await _client.get(uri, headers: _header);
    
    // print(uri.toString());

    var data = json.decode(response.body);
    List<ImageGallery> images = [];

    for (var map in data) {
      images.add(ImageGallery.fromJson(map as Map<String, dynamic>)); 
    }

    // images.forEach((element) {print(element.toString());});

    return images;
  }

  Future<Uint8List> getImageBytes(String url) async {
    final response = await _client.get(url, headers: _header);
    return response.bodyBytes;
  }
}
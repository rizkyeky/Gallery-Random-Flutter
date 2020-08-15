import 'dart:async';
import 'dart:io' show InternetAddress, SocketException;
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../model/Image.dart';

class Api {
  String url = "https://picsum.photos";
  final _host = "api.unsplash.com";

  Map<String, String> _header = {
    "Authorization": "Client-ID " + "1DZ0aLedKkebo2tH8RJ2I0psQ2qfmclGZ9YLq7eixDI",
    "Accept-Version": "v1"
  };

  http.Client client = http.Client();

  Future<void> testGET() async {
    final uri = Uri.https(_host, "photos");
    final response = await client.get(uri, headers: _header);
    
    print(response.body);
  }

  Future<Uint8List> getImageGallery(int id, int width, int height) async {
    // final uri = Uri.https(_host, "photos");
    final response = await client.get("$url/id/$id/$width/$height");
    // final response = await client.get(uri, headers: _header);
    
    // print(response.body);
    
    return response.bodyBytes;
  }
}
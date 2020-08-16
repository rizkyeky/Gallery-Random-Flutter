// import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:gallery/model/Image.dart';
import 'package:rxdart/rxdart.dart';

import '../locator.dart';
// import '../model/Image.dart';
import '../service/api.dart';

import 'Controller.dart';

class HomeController extends Controller {

  final Api _api = locator<Api>();
  final Random random = Random();
  
  final BehaviorSubject<List<Uint8List>> _carouselController = BehaviorSubject();
  Stream<List<Uint8List>> get carouselStream => _carouselController.stream;

  // final BehaviorSubject<List<Uint8List>> _gridController = BehaviorSubject();
  // Stream<List<Uint8List>> get gridStream => _gridController.stream;

  static const _carouselLen = 4;
  int get carouselLen => _carouselLen;
  static const _gridLen = 4;
  int get gridlLen => _gridLen;

  List<ImageGallery> _imagesList = [];
  List<ImageGallery> get imagesList => _imagesList;
  
  final _carouselImages = <Uint8List>[];
  // final _gridImages = <Uint8List>[];
  
  List<int> _randIndex = [];
 
  @override
  void init() {
    _getCarouselImages(_carouselLen);
    // _getGridImages(_gridLen);
  }

  @override
  void dispose() {
    _carouselController.close();
    // _gridController.close();
  }


  Future<void> fetchImages() async {
    if (_imagesList.isEmpty)
      _imagesList = await _api.getImages();
  }

  Future<void> _getCarouselImages(int limit) async {

    await fetchImages();
    // print(_imagesList);

    try {
      for (int i = 0; i < limit; i++) {
        final bytes = await _api.getImageBytes(_imagesList[i].urls["thumb"]);
        _carouselImages.add(bytes);
      }
      _carouselController.sink.add(_carouselImages);

    } catch (e) {
      print("Assert Error in _getCarouselImages");
    }

  }

  // Future<void> _getGridImages(int limit) async {

  //   await fetchImages();

  //   try {
  //     for (int i = 0; i < limit; i++) {
  //       final bytes = await _api.getImageBytes(_imagesList[i].urls["thumb"]);
  //       _carouselImages.add(bytes);
  //     }
  //     _gridController.sink.add(_gridImages);
      
  //   } catch (e) {
  //     print("Assert Error in _getGridImages");
  //   }
  // }

  Stream<Map<String, dynamic>> getRandImage() async* {

    await fetchImages();
    // print(_imagesList);

    int indexRand = random.nextInt(_imagesList.length);


    final image = await _api.getImageBytes(_imagesList[indexRand].urls["thumb"]);

    Map data = <String, dynamic>{
      "authorName": _imagesList[indexRand].author["name"],
      "link": _imagesList[indexRand].urls["html"],
      "likes": _imagesList[indexRand].likes,
      "bytes": image,
    };

    yield data;
  }
}
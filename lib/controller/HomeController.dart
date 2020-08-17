import 'dart:math';
import 'dart:typed_data';

import 'package:rxdart/rxdart.dart';

import '../locator.dart';
import '../model/Image.dart';
import '../service/api.dart';

import 'Controller.dart';

class HomeController extends Controller {

  final Api _api = locator<Api>();
  final Random random = Random();
  
  final BehaviorSubject<List<Uint8List>> _carouselController = BehaviorSubject();
  Stream<List<Uint8List>> get carouselStream => _carouselController.stream;

  static const _carouselLen = 3;
  int get carouselLen => _carouselLen;
  static const _gridLen = 4;
  int get gridlLen => _gridLen;

  List<ImageGallery> _imagesList = [];
  List<ImageGallery> get imagesList => _imagesList;
  
  final _carouselImages = <Uint8List>[];
  
  List<int> _randIndexGrid = [];
  List<int> _randIndexCarousel = [];
 
  @override
  void init() {
    _randIndexGrid = [4,5,6,7];
    _randIndexCarousel = [1,2,3];

    if (_carouselController.isClosed)
      _carouselController.onListen;

    _getCarouselImages(_carouselLen);
  }

  @override
  void dispose() {
    _carouselController.close();
  }


  Future<void> fetchImages() async {
    if (_imagesList.isEmpty) {
      _imagesList = await _api.getImages();
    }
  }

  Future<void> _getCarouselImages(int limit) async {

    await fetchImages();
    // print(_imagesList);

    try {
      for (int index in _randIndexCarousel) {
        // print(index);
        final bytes = await _api.getImageBytes(_imagesList[index].urls["thumb"]);
        
        _carouselImages.add(bytes);
      }
      
      if (!_carouselController.isClosed)
        _carouselController.sink.add(_carouselImages);

    } catch (e) {
      print("Assert Error in _getCarouselImages ($e)");
    }
  }

  Stream<Map<String, dynamic>> getRandImage() async* {

    await fetchImages();
    // print(_imagesList);

    int indexRand  = _randIndexGrid[random.nextInt(_randIndexGrid.length)];
    _randIndexGrid.remove(indexRand);
    
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
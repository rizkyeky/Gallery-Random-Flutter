// import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

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

  final BehaviorSubject<List<Uint8List>> _gridController = BehaviorSubject();
  Stream<List<Uint8List>> get gridStream => _gridController.stream;

  static const carouselLen = 4;
  static const gridLen = 2;
 
  @override
  void init() {
    // _carouselController.onListen;
    _getCarouselImages(carouselLen);
    _getGridImages(gridLen);
  }

  @override
  void dispose() {
    // _carouselController.close();
  }

  final _carouselImages = <Uint8List>[];
  final _gridImages = <Uint8List>[];

  Future<void> _getCarouselImages(int limit) async {
    final count = random.nextInt(10);
    for (int i = count; i < count+limit; i++) {
      final image = await _api.getImageGallery(i, 300, 200);
      _carouselImages.add(image);
    }

    _carouselController.sink.add(_carouselImages);
  }

  Future<void> _getGridImages(int limit) async {
    final count = random.nextInt(20);
    for (int i = count; i < count+limit; i++) {
      final image = await _api.getImageGallery(i, 300, 200);
      _gridImages.add(image);
    }

    _gridController.sink.add(_gridImages);
  }

  Stream<Uint8List> getImages(limit) async* {
    final count = random.nextInt(20);
    
    for (int i = count; i < count+limit; i++) {
      final image = await _api.getImageGallery(i, 300, 200);
      yield image;
    }
  }
}
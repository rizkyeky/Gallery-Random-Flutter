import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gallery/view/ui/XCard.dart';

class CardImage extends StatelessWidget {

  // final ImageGallery image;

  const CardImage({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Material(
        clipBehavior: Clip.antiAlias,
        type: MaterialType.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 1)),
          builder: (context, snapshot) => (snapshot.hasData) 
          ? XCard()
          : Container(
            alignment: Alignment.center, 
            width: double.infinity, 
            height: 200, 
            child: const CircularProgressIndicator(),
          ),
        ),
      ), 
    );
  }
}
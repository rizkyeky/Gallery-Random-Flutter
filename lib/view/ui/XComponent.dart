import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gallery/model/Image.dart';

import '../../controller/Controller.dart';

import 'CardImage.dart';
import 'XCard.dart';
import 'XGrid.dart';

class XContentBar extends StatelessWidget {
  
  final List<Uint8List> images;
  
  const XContentBar({
    Key key,
    this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      color: Theme.of(context).cardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 40,
            margin: const EdgeInsets.only(left: 12),
            alignment: Alignment.centerLeft,
            child: Text("Animals", style: Theme.of(context).textTheme.headline6,),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            height: 200,
            alignment: Alignment.center,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: CardImage()
              )
            ),
          )
        ],
      ),
    );
  }
}

class XGridList extends StatelessWidget {

  // final Stream<List<Uint8List>> blocStream;
  final Stream<Map<String, dynamic>> Function() streamImage;
  
  XGridList(this.streamImage, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XGrid(
      verCount: 1, 
      horiCount: 2,
      padding: EdgeInsets.only(left: 6, right: 6, top: 0, bottom: 12),
      builder: (context, index) => StreamBuilder<Map<String, dynamic>>(
        stream: streamImage(),
        builder: (context, snapshot) => (snapshot.hasData) 
        ? XCard(
          child: Column(
            children: <Widget>[
             Ink.image(
                fit: BoxFit.cover,
                image: MemoryImage(snapshot.data["bytes"]),
                child: Container(height: 120,),
              ),
              ListTile(
                title: Text(snapshot.data["authorName"]),
                subtitle: Text("${snapshot.data["likes"].toString()} likes"), 
                trailing: IconButton(icon: Icon(Icons.favorite), onPressed: () {},),
              )
            ],
          ),
        )
        : Container(
          height: 200,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
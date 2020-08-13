import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../controller/HomeController.dart';
import 'View.dart';
import 'ui/CarouselImage.dart';
import 'ui/XComponent.dart';
import 'ui/XCard.dart';
import 'ui/XGrid.dart';

class HomeView extends View<HomeController> {

  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print("build homeView");
      
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder<List<Uint8List>>(
              stream: bloc.carouselStream,
              builder: (context, stream) => (stream.hasData) ? CarouselImage(
                itemCount: stream.data.length,
                itemBuilder: (context, index) => XCard(
                  backgroundImage: MemoryImage(stream.data[index]),
                  radiusBorder: 0,
                )
              )
              : Container(
                height: 200,
                alignment: Alignment.center,
                color: Colors.white,
                child: const CircularProgressIndicator()
              ),
            ),
            ListTile(title: Text("Gallery", style: Theme.of(context).textTheme.headline6)),
            XGridList(bloc.getImages),
            // XGridList(bloc.getImages),
            // XGridList(bloc.getImages),
            // XGridList(bloc.gridStream),
            // XGridList(bloc.gridStream),
            XCard(
              height: 300,
              padding: EdgeInsets.all(6),
            )
          ],
        )
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }
}
import 'package:flutter/material.dart';

import 'XCard.dart';
import 'XGrid.dart';

class XGridList extends StatelessWidget {

  // final Stream<List<Uint8List>> blocStream;
  final Stream<Map<String, dynamic>> Function() streamImage;
  
  XGridList(this.streamImage, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XGrid(
      verCount: 2, 
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

class XCardImage extends StatelessWidget {
  
  final Stream<Map<String, dynamic>> Function() streamImage;
  
  const XCardImage(this.streamImage, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<Map<String, dynamic>>(
        stream: streamImage(),
        builder: (context, snapshot) => 
        XCard(
          radiusBorder: 6,
          height: 200,
          padding: EdgeInsets.all(12),
          backgroundImage: (snapshot.hasData) ? MemoryImage(snapshot.data["bytes"]) : null,
          child: (!snapshot.hasData) ? Container(
            alignment: Alignment.center,
            height: 200,
            color: Colors.white,
            child: CircularProgressIndicator(),
          ) : null,
        )
      ),
    );
  }
}
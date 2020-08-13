import 'package:flutter/material.dart';

class XGrid extends StatelessWidget {

  final Widget Function(BuildContext, int) builder;
  final int verCount;
  final int horiCount;
  final EdgeInsets padding;

  const XGrid({
    Key key,
    this.builder,
    this.padding = const EdgeInsets.all(6),
    @required this.verCount,
    @required this.horiCount
  }) : super(key: key);

  List<Widget> _buildChildren(BuildContext context) {
    final list = <Widget>[];
    int index = -1;
    
    for (int i = 0; i < verCount; i++) {
      list.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            for (int j = 0; j < horiCount; j++) Builder(
              builder: (context) {
                index++;
                return Container(
                  padding: padding,
                  width: MediaQuery.of(context).size.width/horiCount,
                  child: builder(context, index)
                );
              },
            ),
          ]
        )
      );
    } 

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildChildren(context)
    );
  }
}
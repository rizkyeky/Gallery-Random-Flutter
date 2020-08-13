import 'package:flutter/material.dart';

class XCard extends StatelessWidget {

  final Widget child;
  final GestureTapCallback onTap;
  final ImageProvider backgroundImage;
  final double radiusBorder;
  final double height;
  final double width;
  final Color color;
  final bool isBorder;
  final EdgeInsets padding;

  const XCard({
    Key key,
    this.child,
    this.onTap,
    this.backgroundImage,
    this.isBorder = false,
    this.radiusBorder = 6,
    this.height = 100,
    this.width = double.infinity,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(0)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        color: color,
        clipBehavior: Clip.antiAlias,
        type: MaterialType.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusBorder),
          side: isBorder ? BorderSide(color: Theme.of(context).dividerColor) : BorderSide.none
        ),
        child: InkWell(
          onTap: onTap ?? () {},
          child: (backgroundImage != null) 
          ? Ink.image(
            fit: BoxFit.cover,
            image: backgroundImage,
            child: child ?? Container(height: height, width: width,),
          ) 
          : child ?? Container(height: height, width: width,),
        ),
      ),
    );
  }
}
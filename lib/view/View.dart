import 'package:flutter/material.dart';
import '../controller/Controller.dart';
import '../locator.dart';

abstract class View<T extends Controller> extends StatefulWidget {

  final T bloc = locator<T>();
  
  View({
    Key key
  }) : super(key: key);

  @override
  _ViewState<T> createState() => _ViewState<T>();

  @protected
  void init();

  @protected
  void dispose();

  @protected
  Widget build(BuildContext context);
}

class _ViewState<T extends Controller> extends State<View<T>> {
  
  @override
  void initState() {
    if (widget.init != null)
      widget.init();
      widget.bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    if (widget.dispose != null)
      widget.dispose();
      widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}
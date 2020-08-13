// import 'package:flutter/foundation.dart';

enum ControllerState {idle, busy}

abstract class Controller {

  void init();
  void dispose();

  // Controller() {
  //   _state = ControllerState.idle;
  // }

  // ControllerState _state;
  // ControllerState get state => _state;

  // set state(ControllerState viewState) {
  //   _state = viewState;
  //   notifyListeners();
  // }
}
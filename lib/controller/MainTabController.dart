// import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'Controller.dart';

enum SwitchTab {home, search, cart, profile}

class MainTabController extends Controller {

  @override
  void init() {
    _tab = SwitchTab.home;
    _tabController.sink.add(_tab);
  }

  @override
  void dispose() {
    _tabController.close();
  }

  final BehaviorSubject<SwitchTab> _tabController = BehaviorSubject();
  Stream<SwitchTab> get tabStream => _tabController.stream;

  SwitchTab _tab;
  SwitchTab get tab => _tab;

  bool _activeIcon;
  bool get activeIcon => _activeIcon;

  void switchIcon() {
    if (_activeIcon) _activeIcon = false;
    else _activeIcon = true; 
  }
  
  void setTab(SwitchTab val) {
    if (val != _tab) {
      _tab = val;
      _tabController.sink.add(_tab);

      switch(val) {
        case SwitchTab.home: print("tab home");
        break;
        case SwitchTab.cart: print("tab cart");
        break;
        case SwitchTab.search: print("tab search");
        break;
        case SwitchTab.profile: print("tab profile");
      }
    }
  } 
}
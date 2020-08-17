import 'package:flutter/material.dart';
import '../controller/MainTabController.dart';
import '../theme.dart';
import 'HomeView.dart';

import 'SearchView.dart';
import 'View.dart';

class MainTabView extends View<MainTabController> {

  final HomeView homeView = HomeView();
  final SearchView searchView = SearchView();

  MainTabView({Key key}) : super(key: key);

  @override
  void init() {
  }

  @override
  void dispose() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<SwitchTab>(
          stream: bloc.tabStream,
          builder: (context, snap) {
            switch (snap.data) {
              case SwitchTab.home: 
                return FutureBuilder(
                  future: Future.delayed(const Duration(seconds: 1)),
                  builder: (context, future) => homeView
                );
                break;
              case SwitchTab.search: 
                return searchView;
                break;
              case SwitchTab.cart: 
                return const Center(child: Icon(Icons.shopping_cart),);
                break;
              case SwitchTab.profile: 
                return const Center(child: Icon(Icons.account_circle),);
                break;
              default:
                return const Center(child: CircularProgressIndicator(),);
            }
          }
        ),
      ),
      bottomNavigationBar: XBottomNavigator(bloc)
    );
  }
}

class XBottomNavigator extends StatelessWidget {

  final MainTabController bloc;

  const XBottomNavigator(this.bloc, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      height: 48,
      child: Material(
        color: xprimaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: StreamBuilder<SwitchTab>(
                stream: bloc.tabStream,
                builder: (context, stream) => AnimatedSwitcher(
                  duration: Duration(milliseconds: 800),
                  child: (stream.data == SwitchTab.home) 
                    ? Icon( Icons.home, key: Key("active"), color: Colors.white,)
                    : Icon(Icons.home, key: Key("notactive")),
                )
              ), 
              onPressed: () {
                bloc.setTab(SwitchTab.home);
              },
            ),
            IconButton(
              icon:StreamBuilder<SwitchTab>(
                stream: bloc.tabStream,
                builder: (context, stream) => AnimatedSwitcher(
                  duration: Duration(milliseconds: 800),
                  child: (stream.data == SwitchTab.search) 
                    ? Icon( Icons.search, key: Key("active"), color: Colors.white,)
                    : Icon(Icons.search, key: Key("notactive")),
                )
              ), 
              onPressed: () {
                bloc.setTab(SwitchTab.search);
              },
            ),
            IconButton(
              icon:StreamBuilder<SwitchTab>(
                stream: bloc.tabStream,
                builder: (context, stream) => AnimatedSwitcher(
                  duration: Duration(milliseconds: 800),
                  child: (stream.data == SwitchTab.cart) 
                    ? Icon( Icons.shopping_cart, key: Key("active"), color: Colors.white,)
                    : Icon(Icons.shopping_cart, key: Key("notactive")),
                )
              ),  
              onPressed: () {
                bloc.setTab(SwitchTab.cart);
              },
            ),
            IconButton(
              icon:StreamBuilder<SwitchTab>(
                stream: bloc.tabStream,
                builder: (context, stream) => AnimatedSwitcher(
                  duration: Duration(milliseconds: 800),
                  child: (stream.data == SwitchTab.profile) 
                    ? Icon( Icons.account_circle, key: Key("active"), color: Colors.white,)
                    : Icon(Icons.account_circle, key: Key("notactive")),
                )
              ), 
              onPressed: () {
                bloc.setTab(SwitchTab.profile);
              },
            ),
          ],
        ),
      ),
    );
  }
}
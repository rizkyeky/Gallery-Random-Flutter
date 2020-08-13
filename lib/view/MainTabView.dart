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
                builder: (context, stream) {
                  if (stream.data == SwitchTab.home)
                  return const Icon(Icons.home, color: Colors.white);
                  else return const Icon(Icons.home);
                }
              ), 
              onPressed: () {
                bloc.setTab(SwitchTab.home);
              },
            ),
            IconButton(
              icon:StreamBuilder<SwitchTab>(
                stream: bloc.tabStream,
                builder: (context, stream) {
                  if (stream.data == SwitchTab.search)
                  return const Icon(Icons.search, color: Colors.white);
                  else return const Icon(Icons.search);
                }
              ), 
              onPressed: () {
                bloc.setTab(SwitchTab.search);
              },
            ),
            IconButton(
              icon:StreamBuilder<SwitchTab>(
                stream: bloc.tabStream,
                builder: (context, stream) {
                  if (stream.data == SwitchTab.cart)
                  return const Icon(Icons.shopping_cart, color: Colors.white);
                  else return const Icon(Icons.shopping_cart);
                }
              ),  
              onPressed: () {
                bloc.setTab(SwitchTab.cart);
              },
            ),
            IconButton(
              icon:StreamBuilder<SwitchTab>(
                stream: bloc.tabStream,
                builder: (context, stream) {
                  if (stream.data == SwitchTab.profile)
                  return const Icon(Icons.account_circle, color: Colors.white);
                  else return const Icon(Icons.account_circle);
                }
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
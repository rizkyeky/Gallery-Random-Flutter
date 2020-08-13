import 'package:flutter/material.dart';
import 'locator.dart';
import 'router.dart';
import 'theme.dart';

Future<void> main() async {
  // debugRepaintRainbowEnabled = true;
  setupLocator();
  // await setupDB();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build app");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: xprimaryColor,
        accentColor: xsecondaryColor,
        canvasColor: xcanvasColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // textTheme: TextTheme(
        //   headline6: TextStyle(
        //     color: Colors.white,
        //   )
        // )
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: "/",
    );
  }
}



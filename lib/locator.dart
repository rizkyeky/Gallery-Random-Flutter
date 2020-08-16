import 'package:get_it/get_it.dart';
import 'controller/HomeController.dart';
import 'controller/MainTabController.dart';
import 'controller/SearchBloc.dart';
import 'service/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => HomeController());
  locator.registerLazySingleton(() => MainTabController());
  locator.registerLazySingleton(() => SearchBloc());
  print("setup locator");
}

// Future<void> setupDB() async {
//   print("setup DB");

//   HomeController homeBloc = locator<HomeController>();
  
//   await homeBloc.fetchImages();
// }
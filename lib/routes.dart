import 'package:stupefy/pages/auth/welcome.dart';
import 'package:stupefy/pages/dashboard/home_screen.dart';
import 'package:stupefy/pages/dashboard/library_screen.dart';
import 'package:stupefy/pages/dashboard/search/search_screen.dart';
import 'package:stupefy/pages/splash_screen.dart';

final routes = {
  HomeScreen.id: (context) => HomeScreen(),
  LibraryScreen.id: (context) => LibraryScreen(),
  SearchScreen.id: (context) => SearchScreen(),
  SplashScreen.id: (context) => SplashScreen(),
  WelcomeScreen.id: (context) => WelcomeScreen(),
};
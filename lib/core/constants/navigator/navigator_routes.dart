import 'package:flutterproject/core/constants/enums/navigate_routes_enum.dart';
import 'package:flutterproject/core/init/extensions/navigate_routes_extension.dart';
import 'package:flutterproject/ui/screens/home/home_page.dart';
import 'package:flutterproject/ui/screens/language/language_page.dart';
import 'package:flutterproject/ui/screens/splash_screen.dart';
import 'package:flutterproject/ui/screens/test/test1.dart';
import 'package:flutterproject/ui/screens/test/test2.dart';
import 'package:flutterproject/ui/screens/test/test3.dart';
import 'package:flutterproject/ui/screens/test/test4.dart';

class NavigatorRoutes{
  static const _paraph = "/";

final items ={
        _paraph:(context) => SplashScreenPage(),
        NavigateRoutes.home.withParaph:(context) => HomePage(),
        NavigateRoutes.test1.withParaph:(context) => test1(),
        NavigateRoutes.test2.withParaph:(context) => test2(),
        NavigateRoutes.test3.withParaph:(context) => test3(),
        NavigateRoutes.test4.withParaph:(context) => test4(),
        NavigateRoutes.language.withParaph:(context) => LanguagePage(),
        
      };

}
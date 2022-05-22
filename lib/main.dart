

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/core/constants/app/constants.dart';
import 'package:flutterproject/core/constants/app/locale_constants.dart';
import 'package:flutterproject/core/constants/navigator/navigator_routes.dart';
import 'package:flutterproject/core/init/notifier/bottom_menu_notifier.dart';
import 'package:flutterproject/core/init/notifier/language_notifier.dart';
import 'package:flutterproject/core/init/notifier/theme_notifier.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['assets/google_fonts'], license);
  });

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        LocaleConstants.trLocale,
        LocaleConstants.enLocale
      ],
      saveLocale: true,
      fallbackLocale: LocaleConstants.trLocale,
      path: LocaleConstants.localePath,
      child: MultiProvider(providers: [
        ChangeNotifierProvider(create: ((context) => ThemeNotifier())),
        ChangeNotifierProvider(create: ((context) => LanguageNotifier())),
        ChangeNotifierProvider(create: ((context) => BottomMenuNotifier()))
        
      ], builder: ((context, child) => const MyApp())),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


 
  @override
  Widget build(BuildContext context) {
    
    context.read<ThemeNotifier>().loadTheme();
    context.watch<LanguageNotifier>();
    
 
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      initialRoute: '/',
      routes: NavigatorRoutes().items,
  
    );
  }
}

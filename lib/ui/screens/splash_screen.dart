import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/core/constants/app/constants.dart';
import 'package:flutterproject/ui/screens/home/home_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Timer? _timer;
  int _second = 3; // set timer for 3 second and then direct to next page

  void _startTimer() {
    const period = Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      setState(() {
        _second--;
      });
      if (_second == 0) {
        _cancelFlashsaleTimer();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false);
      }
    });
  }

  void _cancelFlashsaleTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  @override
  void initState() {
    // set status bar color to transparent and navigation bottom color to black21
    SystemChrome.setSystemUIOverlayStyle(
      // ignore: prefer_const_constructors
      Platform.isIOS
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: BLACK21,
              systemNavigationBarIconBrightness: Brightness.light),
    );

    if (_second != 0) {
      _startTimer();
    }
    super.initState();
  }

  @override
  void dispose() {
    _cancelFlashsaleTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Container(
        color: BLACK21,
        child: Center(
          child: Image.asset('assets/images/logo_dark.png', height: 200),
        ),
      ),
    ));
  }
}

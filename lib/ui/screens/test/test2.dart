import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/core/constants/enums/navigate_routes_enum.dart';
import 'package:flutterproject/core/init/extensions/navigate_routes_extension.dart';
import 'package:flutterproject/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

import '../../widgets/bottom_navigation.dart';

class test2 extends StatelessWidget {
  const test2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationWidget(
                isDarkValue: context.watch<ThemeNotifier>().getIsLightTheme,
              ),
    appBar: AppBar(
                  centerTitle: true,
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  bottom: PreferredSize(
                      // ignore: sort_child_properties_last
                      child: Container(
                        color: Colors.grey[100],
                        height: 1.0,
                      ),
                      preferredSize: Size.fromHeight(1.0)),
                  title: Image.asset('assets/images/logo_horizontal.png',
                      height: 24),
                  // backgroundColor: Colors.white,
                  // leading: IconButton(
                  //     icon: Icon(Icons.account_circle, color: _color1),
                  //     onPressed: () {
                  //       Fluttertoast.showToast(
                  //           msg: 'Click account',
                  //           toastLength: Toast.LENGTH_SHORT);
                  //     }),
                  actions: <Widget>[
                    // IconButton(
                    //     icon: _globalWidget.customNotifIcon(
                    //         count: 9, notifColor: _color1, labelColor: _color3),
                    //     onPressed: () {
                    //       Fluttertoast.showToast(
                    //           msg: 'Click notification',
                    //           toastLength: Toast.LENGTH_SHORT);
                    //     })
                    PopupMenuButton<int>(
                      onSelected: (value) {
                          if(value==1){
                            Navigator.of(context).pushNamed(NavigateRoutes.language.withParaph);
                          }

                      },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text('diller'.tr().toString()),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text('Option 2'),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Text('Option 3'),
                    ),
                  ],
                ),
                 
                  ]),
      body: Center(child: Text("test2")),

    );
  }
}
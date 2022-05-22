import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/core/constants/enums/navigate_routes_enum.dart';
import 'package:flutterproject/core/init/extensions/navigate_routes_extension.dart';
import 'package:flutterproject/core/init/notifier/bottom_menu_notifier.dart';
import 'package:provider/provider.dart';

import '../../core/init/notifier/language_notifier.dart';

class BottomNavigationWidget extends StatefulWidget {
  final bool isDarkValue;
  BottomNavigationWidget({ required this.isDarkValue});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color _color1 = Color(0xFF0181cc);
    Color _color2 =
        widget.isDarkValue == true ? Color(0xFF515151) : Colors.white70;

    Color _color3 = Color(0xFFe75f3f);
     context.watch<LanguageNotifier>();
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: context.read<BottomMenuNotifier>().getValue,
      onTap: (value) {

      
      
          _currentIndex = value;
            context.read<BottomMenuNotifier>().setValue(_currentIndex);
          if(_currentIndex ==0){
            Navigator.of(context).pushNamed(NavigateRoutes.home.withParaph);
          }
          if(_currentIndex ==1){
            Navigator.of(context).pushNamed(NavigateRoutes.test2.withParaph);
          }
          if(_currentIndex ==2){
            Navigator.of(context).pushNamed(NavigateRoutes.test3.withParaph);
          }
          if(_currentIndex ==3){
            Navigator.of(context).pushNamed(NavigateRoutes.test4.withParaph);
          }
      

        // _pageController.jumpToPage(value);

        // this unfocus is to prevent show keyboard in the text field
        // FocusScope.of(context).unfocus();
      },
      selectedFontSize: 8,
      unselectedFontSize: 8,
      iconSize: 28,
      selectedLabelStyle: TextStyle(
          color: context.read<BottomMenuNotifier>().getValue == 1 ? _color3 : _color1,
          fontWeight: FontWeight.bold),
      unselectedLabelStyle:
          TextStyle(color: _color2, fontWeight: FontWeight.bold),
      selectedItemColor: context.read<BottomMenuNotifier>().getValue == 1 ? _color3 : _color1,
      unselectedItemColor: _color2,
      items: [
        BottomNavigationBarItem(
          label: 'anaSayfa'.tr().toString(),
          icon: Icon(Icons.home, color: context.read<BottomMenuNotifier>().getValue == 0 ? _color1 : _color2),
        ),
        BottomNavigationBarItem(
            label: 'tumPsikologlar'.tr().toString(),
            icon: Icon(Icons.list_alt_outlined,
                color: context.read<BottomMenuNotifier>().getValue == 1 ? _color3 : _color2)),
        BottomNavigationBarItem(
            label: 'bildirimler'.tr().toString(),
            icon: Icon(Icons.notifications,
                color: context.read<BottomMenuNotifier>().getValue == 2 ? _color1 : _color2)),
        BottomNavigationBarItem(
            label: "kullanici".tr().toString(),
            icon: Icon(Icons.person_outline,
                color: context.read<BottomMenuNotifier>().getValue == 3 ? _color1 : _color2)),
      ],
    );
  }
}

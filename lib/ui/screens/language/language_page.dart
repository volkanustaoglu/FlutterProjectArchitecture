import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/core/constants/app/locale_constants.dart';
import 'package:flutterproject/core/constants/enums/navigate_routes_enum.dart';
import 'package:flutterproject/core/constants/enums/shared_keys_enum.dart';
import 'package:flutterproject/core/init/extensions/navigate_routes_extension.dart';
import 'package:flutterproject/core/init/notifier/language_notifier.dart';
import 'package:flutterproject/core/init/notifier/theme_notifier.dart';
import 'package:flutterproject/core/init/shared_preferences/shared_manager.dart';
import 'package:flutterproject/ui/reusable/global_widget.dart';
import 'package:flutterproject/ui/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final _globalWidget = GlobalWidget();

   Color _color1 = Color(0xff777777);
  Color _color2 = Color(0xff01aed6);

  String defaultLang = 'en';

  List<String> _localeList = ['en', 'tr'];
  List<String> _languageList = [
    'ingilizce'.tr().toString(),
    'turkce'.tr().toString()
  ];

  void changeLocale(String locale){
   
      defaultLang = locale;
      
       _manager.saveString(SharedKeys.language,defaultLang);
      
      defaultLang =="tr" ? context.setLocale(LocaleConstants.trLocale) : context.setLocale(LocaleConstants.enLocale);

      
      

    
  }


  late final SharedManager _manager;

  @override
  void initState() {
   
    _manager =SharedManager();
    _manager.init();
 
  }

  @override
  Widget build(BuildContext context) {



    
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      builder: (context, child){
       defaultLang= _manager.getSaveString(SharedKeys.language).toString();

       LanguageNotifier changedLanguage = context.read<LanguageNotifier>();
       return Scaffold(
         bottomNavigationBar: BottomNavigationWidget(
                isDarkValue: context.watch<ThemeNotifier>().getIsLightTheme,
              ),
       appBar: AppBar(
                  centerTitle: true,
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                  elevation: 0,
                  bottom: PreferredSize(
                      // ignore: sort_child_properties_last
                      child: Container(
                        color: Colors.grey[100],
                        height: 1.0,
                      ),
                      preferredSize: Size.fromHeight(1.0)),
                  title: Image.asset('assets/images/logo_horizontal.png',
                      height: 24),
                
                  actions: <Widget>[
                 
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
        body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                
                ListView(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  children: List.generate(_localeList.length, (index) {
                    return Card(
                      margin: EdgeInsets.only(top: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      elevation: 2,
                      color: Colors.white,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          _showPopupChangeLanguage(index,changedLanguage);
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  child: Image.asset('assets/images/lang/' + _localeList[index] + '.png')),
                              Expanded(
                                child: Container(
                                    padding: EdgeInsets.all(16),
                                    child: Text(_languageList[index], style: TextStyle(fontSize: 14))),
                              ),
                              (defaultLang == _localeList[index])
                                  ? Container(child: _globalWidget.createDefaultLabel(context))
                                  : Wrap(),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
      );
      },
     
    );
  }
  void _showPopupChangeLanguage(index,changedLanguage) {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('hayir'.tr().toString(), style: TextStyle(color: _color2))
    );
    Widget continueButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          setState(() {
             changedLanguage.onLanguageChanged();
             changeLocale(_localeList[index].toString());
            
          });
         
        
       
        },
        child: Text('evet'.tr().toString(), style: TextStyle(color: _color2))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('dilDegistirme'.tr().toString(), style: TextStyle(fontSize: 18),),
      content: Text('eminMisinDegistirmek'.tr().toString(), style: TextStyle(fontSize: 13, color: _color1)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  
}
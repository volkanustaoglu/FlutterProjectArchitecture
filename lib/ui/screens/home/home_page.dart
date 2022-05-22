import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/core/constants/app/constants.dart';
import 'package:flutterproject/core/constants/enums/navigate_routes_enum.dart';
import 'package:flutterproject/core/constants/enums/shared_keys_enum.dart';
import 'package:flutterproject/core/init/extensions/navigate_routes_extension.dart';
import 'package:flutterproject/core/init/notifier/language_notifier.dart';
import 'package:flutterproject/core/init/notifier/theme_notifier.dart';
import 'package:flutterproject/core/init/shared_preferences/shared_manager.dart';
import 'package:flutterproject/core/models/user.dart';
import 'package:flutterproject/core/services/concrete/api/api_user_repository.dart';
import 'package:flutterproject/ui/reusable/global_function.dart';
import 'package:flutterproject/ui/reusable/global_widget.dart';
import 'package:flutterproject/ui/theme/feature/banner_slider_model.dart';
import 'package:flutterproject/ui/view_models/user_view_model_provider.dart';
import 'package:flutterproject/ui/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color1 = Color(0xFF005288);
  Color _color2 = Color(0xFF37474f);
  Color _color3 = Color(0xFFf7941e);

  List<BannerSliderModel> bannerData = [];
  int _currentImageSlider = 0;
  Color _bulletColor = Color(0xff01aed6);

  late final SharedManager _manager;

  @override
  void initState() {
    bannerData.add(
        BannerSliderModel(id: 1, image: GLOBAL_URL + '/home_banner/1.jpg'));
    bannerData.add(
        BannerSliderModel(id: 2, image: GLOBAL_URL + '/home_banner/2.jpg'));
    bannerData.add(
        BannerSliderModel(id: 3, image: GLOBAL_URL + '/home_banner/3.jpg'));
    bannerData.add(
        BannerSliderModel(id: 3, image: GLOBAL_URL + '/home_banner/4.jpg'));
    bannerData.add(
        BannerSliderModel(id: 3, image: GLOBAL_URL + '/home_banner/5.jpg'));
    super.initState();
    _manager =SharedManager();
    _manager.init();

  
    
  
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) =>
            UserViewModelProvider(userRepository: ApiUserRepository()),
        builder: (context, child) {
          final double boxImageSize = (MediaQuery.of(context).size.width / 4);
          context.watch<LanguageNotifier>();
          return Scaffold(
              bottomNavigationBar: BottomNavigationWidget(
                isDarkValue: context.watch<ThemeNotifier>().getIsLightTheme,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  context.read<ThemeNotifier>().changeTheme();

                   _manager.saveBool(SharedKeys.themeDark, context.read<ThemeNotifier>().getIsLightTheme);

             
                  
                },
                child: context.watch<ThemeNotifier>().getIsLightTheme == true
                    ? Icon(Icons.dark_mode_outlined)
                    : Icon(Icons.light_mode_outlined),
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          margin: EdgeInsets.all(16),
                        ),
                        Column(
                          children: [
                            CarouselSlider(
                              items: bannerData
                                  .map((item) => ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                            child: Image.network(item.image, width: 1000),
                                   
                                      ))
                                  .toList(),
                              options: CarouselOptions(
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 6),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 300),
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentImageSlider = index;
                                    });
                                  }),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: bannerData.map((item) {
                                int index = bannerData.indexOf(item);
                                return AnimatedContainer(
                                  duration: Duration(milliseconds: 150),
                                  width:
                                      _currentImageSlider == index ? 16.0 : 8.0,
                                  height: 8.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: _currentImageSlider == index
                                        ? _bulletColor
                                        : Colors.grey[300],
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text('kullaniciListesi'.tr().toString(),
                          style: TextStyle(
                              fontSize: 18,
                              color: context
                                          .watch<ThemeNotifier>()
                                          .getIsLightTheme ==
                                      true
                                  ? BLACK21
                                  : Colors.white70,
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      child: context.watch<UserViewModelProvider>().getIsLoading
                          ? const CircularProgressIndicator.adaptive()
                        :
                        
                          ListView.builder(
                              itemCount: context
                                  .watch<UserViewModelProvider>()
                                  .getData
                                  .length,
                              padding: EdgeInsets.symmetric(vertical: 0),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return _buildItem(
                                    index,
                                    boxImageSize,
                                    context
                                        .watch<UserViewModelProvider>()
                                        .getData,context);
                              },
                            ),
                    ),
                  ],
                ),
              ));
        },
        child: Container());
  }
}

final _globalFunction = GlobalFunction();
final _globalWidget = GlobalWidget();

Widget _buildItem(index, boxImageSize, List<Data> items,BuildContext context ) {
  Color _color = Color(0xFF515151);
  context.watch<LanguageNotifier>();
  return Column(
    children: [
      GestureDetector(
        onTap: () {

           final snackBar = SnackBar(
                            content: Text('tiklandi'.tr().toString() + ' ' +items[index].name.toString())
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                     
        //   Fluttertoast.showToast(
        //       msg: 'Click ' + items[index].name.toString(),
        //       toastLength: Toast.LENGTH_SHORT);
        }
        ,
        child: Container(
          margin: EdgeInsets.fromLTRB(12, 6, 12, 6),
          child: Container(
            margin: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: Image.network('https://s3-eu-west-1.amazonaws.com/doktortakvimi.com/doctor/e26133/e261333917eaf0504d86fac0a7c5d264_large.jpg',
                     width: boxImageSize,
                     height: boxImageSize,),
                    ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index].name.toString(),
                        style: TextStyle(fontSize: 13, color: _color),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                            '\$ ' +
                                _globalFunction.removeDecimalZeroFormat(32.3),
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: SOFT_GREY, size: 12),
                            Text(' ' + items[index].phone.toString(),
                                style:
                                    TextStyle(fontSize: 11, color: SOFT_GREY))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            _globalWidget.createRatingBar(
                                rating: 5.2, size: 12),
                            Text('(' + items[index].surname.toString() + ')',
                                style:
                                    TextStyle(fontSize: 11, color: SOFT_GREY))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                            items[index].username.toString() + ' ' + '',
                            style: TextStyle(fontSize: 11, color: SOFT_GREY)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      (index == items.length - 1)
          ? Wrap()
          : Divider(
              height: 0,
              color: Colors.grey[400],
            )
    ],
  );
}

ListView _userListView(BuildContext context, List<Data> items) {
  context.watch<LanguageNotifier>();
  return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _PostCard(model: items[index]);
      });
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required Data model,
  })  : _model = model,
        super(key: key);

  final Data _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model.username.toString()),
        subtitle: Text(_model.email ?? ''),
      ),
    );
  }
}

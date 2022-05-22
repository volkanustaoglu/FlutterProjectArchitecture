import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocaleConstants {
  static const trLocale = Locale("tr", "TR");
  static const enLocale = Locale("en", "US");
  static const localePath = "assets/lang";

  static String deneme = "deneme".myLocale;
  static String kullanici = "Kullanıcı".myLocale;
  static String kullaniciListesi ="Kullanıcı Listesi".myLocale;
}


extension LocalExtension on String {
  String get myLocale => this.tr().toString();
}

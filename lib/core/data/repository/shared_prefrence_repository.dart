import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/core/data/models/cart_model.dart';
import 'package:flutter_app/core/data/models/token_info.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum DataType {
  INT,
  STRING,
  BOOL,
  DOUBLE,
  LISTSTRING,
}

class SharedPrefrenceRepository {
  SharedPreferences pref = Get.find<SharedPreferences>();

  //!---- Keys  ------

  String PREF_FIRST_LUNCH = 'first_lunch';
  String LOGIN = 'login';
  String REMEMBER = 'remeber';
  String PREF_APP_LANG = 'app_language';
  String Token = "token";
  String PREF_CART_LIST = 'cart_list';
  String nameis = "name";
  String passis = "pass";
  String PREF_IMAGE_FILE = "FILE_PATH";
  void setFilePath(File file) {
    setPrefrenc(type: DataType.STRING, key: PREF_IMAGE_FILE, value: file.path);
  }

  File? getFilePath() {
    if (pref.containsKey(PREF_IMAGE_FILE)) {
      return File(getPrefrence(PREF_IMAGE_FILE));
    } else
      return null;
  }

  void setAppLanguage(String code) {
    setPrefrenc(type: DataType.STRING, key: PREF_APP_LANG, value: code);
  }

  String getAppLanguage() {
    if (pref.containsKey(PREF_APP_LANG)) {
      return getPrefrence(PREF_APP_LANG);
    } else {
      return 'en';
    }
  }

  void settoken(TokenInfo t) {
    setPrefrenc(
        type: DataType.STRING, key: Token, value: jsonEncode(t.toJson()));
  }

  TokenInfo gettoken() {
    return TokenInfo.fromJson(jsonDecode(getPrefrence(Token)));
  }

  void setname(String name) {
    setPrefrenc(type: DataType.STRING, key: nameis, value: name);
  }

  String getname() {
    if (pref.containsKey(nameis)) {
      return getPrefrence(nameis);
    } else {
      return "";
    }
  }

  void setpass(String pass) {
    setPrefrenc(type: DataType.STRING, key: passis, value: pass);
  }

  String getpass() {
    if (pref.containsKey(passis)) {
      return getPrefrence(passis);
    } else {
      return "";
    }
  }

  void setlogin(bool value) {
    setPrefrenc(type: DataType.BOOL, key: LOGIN, value: value);
  }

  bool getlogin() {
    if (pref.containsKey(LOGIN))
      return getPrefrence(LOGIN);
    else
      return false;
  }

  void setFirstLunch(bool value) {
    setPrefrenc(type: DataType.BOOL, key: PREF_FIRST_LUNCH, value: value);
  }

  bool getFirstLunch() {
    if (pref.containsKey(PREF_FIRST_LUNCH))
      return getPrefrence(PREF_FIRST_LUNCH);
    else
      return true;
  }

  void setCartList(List<CartModel> list) {
    setPrefrenc(
        type: DataType.STRING,
        key: PREF_CART_LIST,
        value: CartModel.encode(list));
  }

  List<CartModel> getCartList() {
    if (pref.containsKey(PREF_CART_LIST))
      return CartModel.decode(getPrefrence(PREF_CART_LIST));
    else
      return [];
  }

  //*====================================

  void setPrefrenc({
    required DataType type,
    required String key,
    required dynamic value,
  }) async {
    switch (type) {
      case DataType.INT:
        await pref.setInt(key, value);
        break;
      case DataType.STRING:
        await pref.setString(key, value);
        break;
      case DataType.BOOL:
        await pref.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await pref.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await pref.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrence(String key) {
    return pref.get(key);
  }
}

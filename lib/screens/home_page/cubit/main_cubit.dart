import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newstoday/models/api_news.dart';
import 'package:newstoday/screens/business_page/business.dart';
import 'package:newstoday/screens/fav_page/fav_page.dart';
import 'package:newstoday/screens/science_page/science.dart';
import 'package:newstoday/screens/settings_page/settings.dart';
import 'package:newstoday/screens/sports_page/sports.dart';
import 'package:newstoday/services/service_news.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../categores/tab_bar/categores_tabs.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial()) {
    getDarkMode();
  }

  static MainCubit get(context) => BlocProvider.of(context);

  int selected = 0;
  bool selectThame = false;
  List<Widget> screens = [
    const BusinessPage(),
    const SportsPage(),
    const SciencePage(),
    const CategoresTabBar(),
    const FavPage(),
    const SettingScreen()
  ];
  List<String> titles = [
    "Business News",
    "Sports News",
    "Science News",
    "Categories",
    "favorite",
    "Settings"
  ];

  NewsService service = NewsService();

  List<NewsModel> newsSports = [];
 
//عندما تكون الكاتيجورى متنوعه تكون الفانكشن هكذا
  void getNewsCategories(String categories) async {
    newsSports = await service.getProduts(
        url:
            "/api/v4/top-headlines?country=eg&category=$categories&apikey=a687074fa3eb0a1ead4683b12396bf7a");
    // print(newsSports);
    emit(GetSportsNews());
  }



  changeSelected(val) {
    selected = val;
    emit(ChangeSelected());
  }

  changeThame(val) {
    selectThame = val;
    saveDarkMode(val);
    emit(SetThame());
  }

  Future<void> launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
      // print("done");
    } else {
      throw "Couldn't launch $url";
    }
    emit(OpenUrl());
  }

  void saveDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', selectThame);
    // print(prefs.getBool("darkMode"));
  }

  Future<void> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectThame = prefs.getBool('darkMode') ?? false;
    emit(ChangeThemeApp());
  }
}

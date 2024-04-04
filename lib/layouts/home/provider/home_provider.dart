import 'package:flutter/material.dart';
import 'package:news_app/layouts/home/widgets/category_build.dart';

class HomeProvider extends ChangeNotifier {
  Widget selectedWidget = CategoryBuild();
  changeSelectedWidget(
    Widget newWidget,
  ) {
    if (newWidget == selectedWidget) return;
    selectedWidget = newWidget;
    notifyListeners();
  }

  String appBarTitle = "News App";
  changeAppBarTitle(String newTitle) {
    if (newTitle == appBarTitle) return;
    appBarTitle = newTitle;
    notifyListeners();
  }

  bool searchIcon = false;

  changeSearchIconVisabilty(bool newVal) {
    if (newVal == searchIcon) return;
    searchIcon = newVal;
    notifyListeners();
  }

  String searchValue = '';
  setSearchValue(String? newValue) {
    if (newValue == searchValue) return;
    searchValue = newValue??'';
    notifyListeners();
  }
}

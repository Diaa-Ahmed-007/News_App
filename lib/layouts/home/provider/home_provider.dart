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

  int selectedSource = 0;
  changeSelectedSource(int newValue) {
    if (newValue == selectedSource) return;
    selectedSource = newValue;
    notifyListeners();
  }
}

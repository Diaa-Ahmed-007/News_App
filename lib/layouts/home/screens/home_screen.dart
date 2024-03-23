import 'package:flutter/material.dart';
import 'package:news_app/layouts/home/provider/home_provider.dart';
import 'package:news_app/layouts/home/widgets/category_build.dart';
import 'package:news_app/layouts/home/widgets/home_drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "home";

  @override
  Widget build(BuildContext context) {
    // var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    HomeProvider provider = Provider.of<HomeProvider>(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/BG.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(provider.appBarTitle),
          leadingWidth: width * 0.2,
        ),
        drawer: HomeDrawerWidget(
          itemClick: (item) {
            provider.changeSelectedWidget(
              selectedWidget(item),
            );
            provider.changeAppBarTitle("News App");
            Navigator.pop(context);
          },
        ),
        body: provider.selectedWidget,
      ),
    );
  }

  Widget selectedWidget(MenuItem item) {
    if (item == MenuItem.categories) {
      return CategoryBuild();
    } else {
      return Container(
        color: Colors.redAccent,
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/layouts/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

typedef OnMenuItemClick = void Function(MenuItem item);

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({super.key, required this.itemClick});
  final OnMenuItemClick itemClick;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.primary,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 50,
            ),
            child: Text(
              "News App!",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              itemClick(MenuItem.categories);
              provider.changeSearchIconVisabilty(false);
            },
            child: Row(
              children: [
                const Icon(
                  Icons.list,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              itemClick(MenuItem.settings);
            },
            child: Row(
              children: [
                const Icon(
                  Icons.settings,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Settings",
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum MenuItem { categories, settings }

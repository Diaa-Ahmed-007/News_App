import 'package:flutter/material.dart';
import 'package:news_app/layouts/home/provider/home_provider.dart';
import 'package:news_app/layouts/home/screens/article_details_screen.dart';
import 'package:news_app/layouts/home/screens/home_screen.dart';
import 'package:news_app/style/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => ChangeNotifierProvider(
              create: (context) => HomeProvider(),
              builder: (context, child) => const HomeScreen(),
            ),
        ArticleDetailsScreen.routeName: (_) => ChangeNotifierProvider(
              create: (context) => HomeProvider(),
              builder: (context, child) => const ArticleDetailsScreen(),
            ),
      
      },
    );
  }
}
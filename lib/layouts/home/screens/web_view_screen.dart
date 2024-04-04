import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewScreen extends StatefulWidget {
  const NewsWebViewScreen({super.key, required this.urlView});
  final String urlView;
  @override
  State<NewsWebViewScreen> createState() => _NewsWebViewScreenState();
}

class _NewsWebViewScreenState extends State<NewsWebViewScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.urlView),
      );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var hight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/BG.jpg"), fit: BoxFit.cover),
        ),
        child: Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                toolbarHeight: hight * 0.1,
                excludeHeaderSemantics: true,
                floating: true,
                title: const Text("News App"),
                leadingWidth: width * 0.2,
              )
            ],
            body: WebViewWidget(
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}

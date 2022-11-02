import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;

  const ArticleView({Key? key, required this.blogUrl}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Text(
              "Flutter",
              style: TextStyle(color: Colors.black),
            ),
            const Text(
              "News",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          color: Colors.blue,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}

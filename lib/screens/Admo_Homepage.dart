import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../front_page.dart';

class Admo_Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FrontPage(),
              ),
            );
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Admo",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: "https://myadmo.com/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

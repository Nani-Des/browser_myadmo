import 'package:flutter/material.dart';
import 'package:browser_myadmo/models/browser_model.dart';
import 'package:browser_myadmo/models/webview_model.dart';
import 'package:browser_myadmo/util.dart';
import 'package:browser_myadmo/webview_tab.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import 'animated_flutter_browser_logo.dart';

class ProjectInfoPopup extends StatefulWidget {
  const ProjectInfoPopup({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectInfoPopupState();
}

class _ProjectInfoPopupState extends State<ProjectInfoPopup> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      RichText(
        text: const TextSpan(children: [
          TextSpan(
            text: "Do you like this Application( Admo)? Give a ",
            style: TextStyle(color: Colors.black),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Icon(
              Icons.star,
              size: 25,
              color: Colors.yellow,
            ),
          ),
          TextSpan(text: " to", style: TextStyle(color: Colors.black))
        ]),
      ),
      ElevatedButton.icon(
        icon: const Icon(
          MaterialCommunityIcons.github,
          size: 40.0,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => Colors.grey.shade300)),
        label: RichText(
          text: const TextSpan(children: [
            TextSpan(text: "Play Store: ", style: TextStyle(color: Colors.black)),
            TextSpan(
                text: "Play Store Rating",
                style: TextStyle(color: Colors.blue))
          ]),
        ),
        onPressed: () {
          var browserModel = Provider.of<BrowserModel>(context, listen: false);
          browserModel.addTab(WebViewTab(
            key: GlobalKey(),
            webViewModel: WebViewModel(
                url: WebUri(
                    "https:myadmo.com")),
          ));
          Navigator.pop(context);
        },
      ),
      RichText(
        text: const TextSpan(children: [
          TextSpan(text: "and to", style: TextStyle(color: Colors.black)),
        ]),
      ),
      ElevatedButton.icon(
        icon: const Icon(
          MaterialCommunityIcons.github,
          size: 40.0,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => Colors.grey.shade300)),
        label: RichText(
          text: const TextSpan(children: [
            TextSpan(text: "Github: ", style: TextStyle(color: Colors.black)),
            TextSpan(
                text: "Nani-Des/browser_myadmo",
                style: TextStyle(color: Colors.blue))
          ]),
        ),
        onPressed: () {
          var browserModel = Provider.of<BrowserModel>(context, listen: false);
          browserModel.addTab(WebViewTab(
            key: GlobalKey(),
            webViewModel: WebViewModel(
                url: WebUri(
                    "https://github.com/Nani-Des/browser_myadmo")),
          ));
          Navigator.pop(context);
        },
      ),
      const SizedBox(
        height: 20.0,
      ),
      SizedBox(
        width: 250.0,
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(children: [
            TextSpan(
              text:
                  "Enjoy this application and Let us know what you think of it. Thanks!",
              style: TextStyle(color: Colors.black),
            ),
          ]),
        ),
      ),
    ];

    if (Util.isIOS()) {
      children.addAll(<Widget>[
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton.icon(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30.0,
          ),
          label: const Text(
            "Go Back",
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ]);
    }

    return Scaffold(
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (Orientation.landscape == orientation) {
              var rowChildren = <Widget>[
                const AnimatedFlutterBrowserLogo(),
                const SizedBox(
                  width: 80.0,
                ),
              ];
              rowChildren.add(Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ));

              return Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: rowChildren,
              );
            }

            var columnChildren = <Widget>[
              const AnimatedFlutterBrowserLogo(),
              const SizedBox(
                height: 80.0,
              ),
            ];
            columnChildren.addAll(children);

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: columnChildren,
            );
          },
        ),
      ),
    );
  }
}

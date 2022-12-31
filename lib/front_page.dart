import 'package:browser_myadmo/screens/Admo_Homepage.dart';
import 'package:browser_myadmo/screens/login.dart';
import 'package:browser_myadmo/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'animated_flutter_browser_logo.dart';
import 'animated_search_icon.dart';
import 'browser.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  final List icons = [
    Icons.add_shopping_cart,
    Icons.account_circle_rounded,
    Icons.attach_file,
    Icons.add_a_photo_sharp,
  ];
  final categories = [
    'Store',
    'User',
    'Watch Ads',
    'All',
  ];

  @override
  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Admo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: 'Store',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.yellowAccent,
          onTap: (int index) {
            switch (index) {
              case 0:
                break;
              case 1:
                Alert(
                  context: context,
                  type: AlertType.none,
                  title: "ACCOUNT ACCESS",
                  style: AlertStyle(
                      titleStyle: TextStyle(fontWeight: FontWeight.w800),
                      descStyle:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
                  desc: "Account Sign Up or In?",
                  buttons: [
                    DialogButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())),
                      color: Colors.lightBlue,
                      child: const Text(
                        "SIGN IN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'DM-Sans'),
                      ),
                    ),
                    DialogButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())),
                      color: Colors.white,
                      border: Border.all(color: Colors.lightBlue),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 16,
                            fontFamily: 'DM-Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ).show();
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Register(),
                  ),
                );
                break;
            }
            setState(() {
              _selectedIndex = index;
            });
          }),
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.black,
          onPressed: () {},
        ),
        title: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.contain,
        ),
        toolbarHeight: 88,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Browser(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: icons.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        icons[index],
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  const AnimatedSearchIcon(
                    size: 80,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

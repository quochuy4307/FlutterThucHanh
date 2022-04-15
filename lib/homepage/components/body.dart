import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_foodnow_app/homepage/components/fragment/account_detail.dart';
import 'package:flutter_foodnow_app/homepage/components/fragment/favorite_fragment.dart';
import 'package:flutter_foodnow_app/homepage/components/fragment/home_fragment.dart';

import 'package:flutter_foodnow_app/homepage/components/homeheader.dart';
import 'package:flutter_foodnow_app/homepage/components/fragment/notification_fragment.dart';
import 'package:flutter_foodnow_app/model/utilities.dart';

import 'menuheader.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var selectIndex = 0;
  var flag = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeDetail(),
      FavoriteDetail(Utilities.data),
      // NotificationDetail(),
      AccountDetail()
    ];

    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: flag ? AppBar(
        automaticallyImplyLeading: false,
        title: HomeHeader()
      ) : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectIndex,
        onTap: (index){
          setState(() {
            selectIndex = index;
            if(selectIndex != 2){
              flag = true;
            }else{
              flag = false;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            screen[selectIndex]
          ],
        ),
      ),
    );
  }
}

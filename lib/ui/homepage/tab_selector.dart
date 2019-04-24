import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:secozy/bloc/tabs/tab.dart';

class TabSelector extends StatelessWidget {
  final int activeIndex;
  final Function(int) onTabSelected;

  final bottomNavigationItems = [
    new BottomNavigationItem("Dashboard", MdiIcons.accountAlert),
    new BottomNavigationItem("Bookmarked", MdiIcons.bookmark),
  ];

  TabSelector({
    Key key,
    @required this.activeIndex,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBarItems = <BottomNavigationBarItem>[];
    for (var i = 0; i < bottomNavigationItems.length; i++) {
      var d = bottomNavigationItems[i];
      bottomNavigationBarItems.add(
        new BottomNavigationBarItem(
          icon: Icon(d.icon),
          title: new Text(
            d.title,
            style: TextStyle(color: Colors.black38),
          ),
        ),
      );
    }

    return Platform.isAndroid ? CupertinoTabBar(
        currentIndex: activeIndex,
        activeColor : Colors.black87,
        onTap: (index) => onTabSelected(index),
        items: bottomNavigationBarItems
    ) : BottomNavigationBar(
      currentIndex: activeIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) => onTabSelected(index),
      items: bottomNavigationBarItems
    );
  }
}

class BottomNavigationItem {
  String title;
  IconData icon;
  BottomNavigationItem(this.title, this.icon);
}
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_listview_app/model/Item.dart';
import 'package:flutter_listview_app/screen/CalendarApp.dart';
import 'package:flutter_listview_app/screen/FormWidgets.dart';
import 'package:flutter_listview_app/screen/ItemList.dart';

class HomeScreen extends StatelessWidget {
  List<Item> itemList;

  @override
  Widget build(BuildContext context) {
    itemList = getItemList();

    return Scaffold(
        appBar: AppBar(
          title: Text('Grow Springs'),
        ),
        body: _listView(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('Grow'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text('View'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_location),
              title: Text('Seed'),
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.green,
          onTap: (e) {
            if (e == 1) {
              Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                return new CalendarApp();
              }));
            } else if (e == 2) {
              Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                return new FormWidgets();
              }));
            }
          },
        ));
  }

  Widget _listView() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Expanded(
              child: ListView(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            children: itemList
                .map(
                  (Item) => ItemList(item: Item),
                )
                .toList(),
          )),
        ],
      ),
    );
  }
}

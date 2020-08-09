// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_listview_app/model/Item.dart';
import 'package:flutter_listview_app/screen/CalendarApp.dart';
import 'package:flutter_listview_app/screen/HomeScreen.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter/cupertino.dart';

class FormWidgets extends StatefulWidget {
  @override
  _FormWidgetsState createState() => _FormWidgetsState();
}

class _FormWidgetsState extends State<FormWidgets> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String purpose = '';
  String description = '';
  String address = '';
  DateTime date = DateTime.now();
  List<String> tags = List.empty();
  double maxValue = 0;
  bool brushedTeeth = false;
  bool enableFeature = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create an event'),
        ),
        body: Form(
          key: _formKey,
          child: Scrollbar(
            child: Align(
              alignment: Alignment.topCenter,
              child: Card(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...[
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: 'Enter a title...',
                              labelText: 'Title',
                            ),
                            onChanged: (value) {
                              setState(() {
                                title = value;
                              });
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: 'Enter the event\'s purpose...',
                              labelText: 'Purpose',
                            ),
                            onChanged: (value) {
                              setState(() {
                                purpose = value;
                              });
                            },
                            maxLines: 2,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: 'Enter an address...',
                              labelText: 'Location',
                            ),
                            onChanged: (value) {
                              setState(() {
                                address = value;
                              });
                            },
                          ),
                          DateTimePickerWidget(this),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: '#equality #education #blm',
                              labelText: 'Tags',
                            ),
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                tags = [];
                                for (String tag in value.split('#')) {
                                  if (tag.trim().length > 0) {
                                    tags.add(tag.trim());
                                  }
                                }
                                print(tags);
                              });
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              filled: true,
                              hintText: 'Add any additional info...',
                              labelText: 'Additional Info',
                            ),
                            onChanged: (value) {
                              description = value;
                            },
                            maxLines: 5,
                          ),
                          RaisedButton(
                              color: Colors.blueAccent,
                              child: Text(
                                'Create Event',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                getItemList().add(Item(
                                  id: 3,
                                  name: title,
                                  description: description,
                                  purpose: purpose,
                                  distance: '1.4 mi',
                                  address: address,
                                  time: date,
                                  tags: tags,
                                  isGoing: false,
                                ));
                                Navigator.of(context).push(
                                    CupertinoPageRoute<Null>(
                                        builder: (BuildContext context) {
                                  return new HomeScreen();
                                }));
                              })
                        ].expand(
                          (widget) => [
                            widget,
                            SizedBox(
                              height: 24,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account),
              title: Text('Join'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text('Calendar'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_location),
              title: Text('Create'),
            ),
          ],
          currentIndex: 2,
          selectedItemColor: Colors.blue,
          onTap: (e) {
            if (e == 0) {
              Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                return new HomeScreen();
              }));
            } else if (e == 1) {
              Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                return new CalendarApp();
              }));
            }
          },
        ));
  }
}

class DateTimePickerWidget extends StatefulWidget {
  _FormWidgetsState widgetState;
  DateTimePickerWidget(this.widgetState);

  @override
  _DateTimePickerWidgetState createState() =>
      _DateTimePickerWidgetState(this.widgetState);
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  DateTime selectedDateAndTime = DateTime.now();

  final intl.DateFormat dateFormat = intl.DateFormat('MM/dd/yyyy - hh:mm a');

  _FormWidgetsState widgetState;
  _DateTimePickerWidgetState(this.widgetState);

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(dateFormat.format(selectedDateAndTime),
            style: TextStyle(fontSize: 18.0)),
        RaisedButton(
          child: Text('Choose new date time'),
          onPressed: () async {
            final selectedDate = await _selectDateTime(context);
            if (selectedDate == null) return;

            print(selectedDate);

            final selectedTime = await _selectTime(context);
            if (selectedTime == null) return;
            print(selectedTime);

            setState(() {
              this.selectedDateAndTime = DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
              );
            });
            this.widgetState.date = selectedDateAndTime;
          },
        ),
      ],
    );
  }

  Future<TimeOfDay> _selectTime(BuildContext context) {
    final now = DateTime.now();

    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
  }

  Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
}

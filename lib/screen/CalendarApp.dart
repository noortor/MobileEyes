import 'package:flutter/material.dart';
import 'package:flutter_listview_app/model/Item.dart';
import 'package:flutter_listview_app/screen/FormWidgets.dart';
import 'package:flutter_listview_app/screen/HomeScreen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/cupertino.dart';

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View My Springs'),
      ),
      body: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
            child: SfCalendar(
              view: CalendarView.schedule,
              dataSource: _getCalendarDataSource(),
            ),
          ),
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
            currentIndex: 1,
            selectedItemColor: Colors.blue,
            onTap: (e) {
              if (e == 0) {
                Navigator.of(context).push(
                    CupertinoPageRoute<Null>(builder: (BuildContext context) {
                  return new HomeScreen();
                }));
              } else if (e == 2) {
                Navigator.of(context).push(
                    CupertinoPageRoute<Null>(builder: (BuildContext context) {
                  return new FormWidgets();
                }));
              }
            },
          )),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    for (Item item in getItemList()) {
      if (item.isGoing) {
        appointments.add(Appointment(
          startTime: item.time,
          endTime: DateTime.now().add(Duration(minutes: 10)),
          subject: item.name,
          color: Colors.green[400],
          startTimeZone: '',
          endTimeZone: '',
        ));
      }
    }
    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

import 'package:flutter/material.dart';
import 'package:calendar_project/calendar.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Calendar myCalendar = Calendar(DateTime.now());

  HomePageState() {
    myCalendar.setMonthMissedDays();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int numWeekDays = 7;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                myCalendar.getMonthName(myCalendar.dateTime.month) +
                    " " +
                    myCalendar.dateTime.year.toString(),
              )),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.today,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    myCalendar.goToToday();
                  });
                }),
            IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    myCalendar.previousMonthSelected();
                  });
                }),
            IconButton(
                icon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    myCalendar.nextMonthSelected();
                  });
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.event), title: Text('Events')),
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.pushNamed(context, 'settingsPage');
                  },
                ),
                title: Text('Settings')),
          ],
          currentIndex: 0,
          fixedColor: Colors.blue[300],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text('Sun',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.red[600]))),
                Expanded(
                    child: Text('Mon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.lightBlue[600]))),
                Expanded(
                    child: Text('Tue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.lightBlue[600]))),
                Expanded(
                    child: Text('Wed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.lightBlue[600]))),
                Expanded(
                    child: Text('Thu',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.lightBlue[600]))),
                Expanded(
                    child: Text('Fri',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.lightBlue[600]))),
                Expanded(
                    child: Text('Sat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.red[600]))),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
            GridView.count(
              crossAxisCount: numWeekDays,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: List.generate(
                  myCalendar.getNumberOfDaysInMonth(myCalendar.dateTime.month),
                  (index) {
                int dayNumber = index + 1;
                return GestureDetector(
                    child: Container(
                        margin: EdgeInsets.all(2.0),
                        padding: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          children: [
                            buildDayNumber(dayNumber),
                          ],
                        )));
              }),
            )
          ],
        ));
  }

  Align buildDayNumber(int dayNumber) {
    if ((dayNumber - myCalendar.beginMissedDays) == DateTime.now().day &&
        myCalendar.dateTime.month == DateTime.now().month &&
        myCalendar.dateTime.year == DateTime.now().year) {
      return Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 35.0,
          height: 35.0,
          padding: EdgeInsets.all(.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueAccent,
            border: Border.all(),
          ),
          child: Text((dayNumber - myCalendar.beginMissedDays).toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
      );
    } else {
      return Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 35.0,
          height: 35.0,
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: Text(
            dayNumber <= myCalendar.beginMissedDays
                ? ' '
                : (dayNumber - myCalendar.beginMissedDays).toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize:20,fontWeight: FontWeight.w600),
          ),
        ),
      );
    }
  }
}

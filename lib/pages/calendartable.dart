import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:waytodeen2/pages/BackgroundContainer.dart';

class calendartable extends StatefulWidget {
  @override
  State<calendartable> createState() => _calendartableState();
}

class _calendartableState extends State<calendartable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: calendarScrollable(),
    );
  }
}

class calendarScrollable extends StatefulWidget {
  @override
  State<calendarScrollable> createState() => calendarScrollableState();
}

class calendarScrollableState extends State<calendarScrollable> {
  String locale = 'ar';

  late DateTime today;

  HijriCalendar? h_date;
  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    h_date =
        HijriCalendar.fromDate(DateTime(today!.year, today!.month, today!.day));
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      h_date = HijriCalendar.fromDate(
          DateTime(today!.year, today!.month, today!.day));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Text(
                "Selected Date = ${h_date?.hDay} :${h_date?.getLongMonthName()} :${h_date?.hYear}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ),
            Card(
              color: Colors.transparent,
              child: Center(
                // heightFactor: 1.9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: TableCalendar(
                      locale: "en_US",
                      rowHeight: 43,
                      selectedDayPredicate: (day) => isSameDay(day, today),
                      headerStyle: HeaderStyle(
                          formatButtonVisible: false, titleCentered: true),
                      availableGestures: AvailableGestures.all,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: today,
                      onDaySelected: _onDaySelected,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
  String locale = 'ar';

    late DateTime today;

    HijriCalendar ?h_date;
  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    h_date = HijriCalendar.fromDate(DateTime(today!.year,today!.month , today!.day));

  }

  void _onDaySelected(DateTime day,DateTime focusedDay){
    setState(() {
      today = day;
      h_date = HijriCalendar.fromDate(DateTime(today!.year,today!.month , today!.day));


    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
      FittedBox(
        child: Text(
          "Selected Date = ${h_date?.hDay} :${h_date?.getLongMonthName()} :${h_date?.hYear}",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
          ),
          Card(
            child: Center(
           // heightFactor: 1.9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                width: MediaQuery.of(context).size.width,
           
                  child: TableCalendar(
                    locale: "en_US",
                    rowHeight: 43,
                    selectedDayPredicate: (day)=>isSameDay(day,today) ,
                    headerStyle: HeaderStyle(formatButtonVisible: false,titleCentered: true),
                    availableGestures: AvailableGestures.all,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: today,
                    onDaySelected: _onDaySelected,
                            
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  */


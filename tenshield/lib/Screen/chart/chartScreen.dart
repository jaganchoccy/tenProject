import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:tenshield/Screen/chart/chartModel.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatScreen extends StatefulWidget {
  final user;
  const ChatScreen({this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    DatabaseReference starCountRef = FirebaseDatabase.instance
        .reference()
        .child('https://tenshieldapp-default-rtdb.firebaseio.com/');

    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<EarningsTimeline> listEarnings = [
      EarningsTimeline(year: "08", earning: 18.5),
      EarningsTimeline(year: "09", earning: 21),
      EarningsTimeline(year: "10", earning: 30),
      EarningsTimeline(year: "11", earning: 38),
      EarningsTimeline(year: "12", earning: 42),
      EarningsTimeline(year: "13", earning: 43.5),
      EarningsTimeline(year: "14", earning: 73),
      EarningsTimeline(year: "15", earning: 79.6),
      EarningsTimeline(year: "16", earning: 82),
      EarningsTimeline(year: "17", earning: 93),
      EarningsTimeline(year: "18", earning: 108),
      EarningsTimeline(year: "19", earning: 109),
      EarningsTimeline(year: "20", earning: 117),
    ];

    List<charts.Series<EarningsTimeline, String>> timeline = [
      charts.Series(
        id: "Subscribers",
        data: listEarnings,
        domainFn: (EarningsTimeline timeline, _) => timeline.year,
        measureFn: (EarningsTimeline timeline, _) => timeline.earning,
      )
    ];

    var fullname = widget.user.userName;
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        backgroundColor: Color.fromARGB(255, 51, 52, 52),
        title: Text(
          'Hi  ' + fullname!,
        ),
      ),
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.bottomCenter,
            //stops: [0.7, 0.7],
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 51, 52, 52),
            ],
          ),
        ),
        child: Column(children: [
          Expanded(
            child: charts.PieChart(timeline, animate: true),
          ),
          Expanded(
            child: charts.PieChart(timeline, animate: true),
          ),
        ]),
      ),
    );
  }
}

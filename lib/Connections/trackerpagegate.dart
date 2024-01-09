import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexyatra_app/Presentations/schedulepage.dart';

import 'package:flutter/material.dart';

class TrackerPageGate extends StatefulWidget {
  const TrackerPageGate({super.key});

  @override
  State<TrackerPageGate> createState() => _TrackerPageGateState();
}

class _TrackerPageGateState extends State<TrackerPageGate> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.55,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
          height: 50,
          width: 200,
          child: OutlinedButton(
            child: Text("All Schedules"),
            style: ButtonStyle(
                foregroundColor: MaterialStateColor.resolveWith(
                    (states) => const Color.fromARGB(255, 255, 255, 255)),
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.red)),
            onPressed: () {
                  print("Succesfully Viewed all schedules");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllSchedulePage()));
            },
          ),
        ),
      ),
    );
  }
}

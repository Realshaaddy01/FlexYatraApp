import 'package:flutter/material.dart';
import 'package:flexyatra_app/Presentations/profile_view.dart';
import '../../Connections/trackerpagegate.dart';
import '../../Models/common_widgets/tabbtn_widget.dart';
import '../homepage.dart';
import '../meal_planner/mealplan.dart';
import '../schedulepage.dart';

import 'workoutplan.dart';

class AllActivityPage extends StatefulWidget {
  @override
  State<AllActivityPage> createState() => _AllActivityPageState();
}

class _AllActivityPageState extends State<AllActivityPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Activity Tab'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal:10.0, vertical:5),
                          child: Text(
                            // textAlign: TextAlign.center,
                            'Find your',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 42,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'activity',
                            style: TextStyle(
                              color: Color(0xFFD42E2E),
                              fontSize: 42,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                          )),
                    ],
                  ),

                ],
              ),
              Expanded(
                child: ReusableTabWidget(
                  tabTitles: ['Workout Plan', 'Meal Plan','Tracker'],
                  tabContents: [
                    // Content for Tab 1
                    Column(
                      children: [
                        Workoutplan(),
                      ],
                    ),
                    // Content for Tab 2
                    Column(
                      children: [
                        MealPlan(),
                      ],
                    ),
                    // Tab 3 content
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TrackerPageGate(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          selectedLabelStyle: TextStyle(color: Colors.black),
          unselectedLabelStyle: TextStyle(color: Colors.black54),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monitor_heart_rounded),
              label: 'Activity',
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule_rounded),
              label: 'Schedule',
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded),
              label: 'Profile',
              backgroundColor: Colors.transparent,
            ),
          ],
          currentIndex: _currentIndex,
          selectedIconTheme: IconThemeData(color: Colors.red, size: 30),
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
            switch (index) {
              case 0:
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
                break;
              case 1:
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AllActivityPage()),
                );
                break;
              case 2:
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AllSchedulePage()),
                );
                break;
              case 3:
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProfileView()),
                );
                break;
              default:
                break;
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../Models/common_widgets/round_button.dart';
import '../Models/common_widgets/workout_tracker_view.dart';
import '../utils/colo_extension.dart';
import 'Workoutplan/AllActivityPage.dart';
import 'homepage.dart';
import 'meal_planner/meal_planner_view.dart';
import 'profile_view.dart';
import 'sleep_tracker/sleep_tracker_view.dart';

class AllSchedulePage extends StatefulWidget {
  const AllSchedulePage({super.key});

  @override
  State<AllSchedulePage> createState() => _AllSchedulePageState();
}

class _AllSchedulePageState extends State<AllSchedulePage> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        title: Text(
          "All Schedules",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundButton(
                  title: "Workout Tracker",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkoutTrackerView(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 15,
              ),
              RoundButton(
                  title: "Meal Planner",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MealPlannerView(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 15,
              ),
              RoundButton(
                  title: "Sleep Tracker",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SleepTrackerView(),
                      ),
                    );
                  })
            ],
          ),
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
    );
  }
}

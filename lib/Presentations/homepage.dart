import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../Models/common_widgets/finished_workout_view.dart';
import '../Models/common_widgets/notification_view.dart';
import '../Models/common_widgets/round_button.dart';
import '../Models/common_widgets/workout_row.dart';
import '../utils/colo_extension.dart';
import 'Workoutplan/AllActivityPage.dart';
import 'activity_tracker_view.dart';
import 'profile_view.dart';
import 'schedulepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<DocumentSnapshot> userData;

  @override
  void initState() {
    super.initState();
    userData = fetchUserData();
  }

  Future<DocumentSnapshot> fetchUserData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
    }
    throw Exception('User not authenticated');
  }

  int _currentIndex = 0;

  List lastWorkoutArr = [
    {
      "name": "Full Body Workout",
      "image": "assets/img/Workout1.png",
      "kcal": "180",
      "time": "20",
      "progress": 0.3
    },
    {
      "name": "Lower Body Workout",
      "image": "assets/img/Workout2.png",
      "kcal": "200",
      "time": "30",
      "progress": 0.4
    }
  ];
  List<int> showingTooltipOnSpots = [21];

  List<FlSpot> get allSpots => const [
        FlSpot(0, 20),
        FlSpot(1, 25),
        FlSpot(2, 40),
        FlSpot(3, 50),
        FlSpot(4, 35),
        FlSpot(5, 40),
        FlSpot(6, 30),
        FlSpot(7, 20),
        FlSpot(8, 25),
        FlSpot(9, 40),
        FlSpot(10, 50),
        FlSpot(11, 35),
        FlSpot(12, 50),
        FlSpot(13, 60),
        FlSpot(14, 40),
        FlSpot(15, 50),
        FlSpot(16, 20),
        FlSpot(17, 25),
        FlSpot(18, 40),
        FlSpot(19, 50),
        FlSpot(20, 35),
        FlSpot(21, 80),
        FlSpot(22, 30),
        FlSpot(23, 20),
        FlSpot(24, 25),
        FlSpot(25, 40),
        FlSpot(26, 50),
        FlSpot(27, 35),
        FlSpot(28, 50),
        FlSpot(29, 60),
        FlSpot(30, 40)
      ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(colors: [
            TColor.primaryColor2.withOpacity(0.4),
            TColor.primaryColor1.withOpacity(0.1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        dotData: FlDotData(show: false),
        gradient: LinearGradient(
          colors: TColor.primaryG,
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Scaffold(
      backgroundColor: TColor.white,
      body: FutureBuilder<DocumentSnapshot>(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('No data available'));
          } else {
            final userData = snapshot.data!;
            final firstName = userData['firstName'];
            final lastName = userData['lastName'];
            final userName = (firstName != null && lastName != null)
                ? '$firstName $lastName'
                : 'Name not available';

            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome Back,",
                                  style: TextStyle(
                                      color: TColor.gray, fontSize: 12),
                                ),
                                Text(
                                  userName != null ? userName : "Loading...",
                                  style: TextStyle(
                                      color: TColor.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationView(),
                                    ),
                                  );
                                },
                                icon: Image.asset(
                                  "assets/img/notification_active.png",
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.fitHeight,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                        Container(
                          height: media.width * 0.4,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: TColor.primaryG),
                              borderRadius:
                                  BorderRadius.circular(media.width * 0.075)),
                          child: Stack(alignment: Alignment.center, children: [
                            Image.asset(
                              "assets/img/bg_dots.png",
                              height: media.width * 0.4,
                              width: double.maxFinite,
                              fit: BoxFit.fitHeight,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "BMI (Body Mass Index)",
                                        style: TextStyle(
                                            color: TColor.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "You have a normal weight",
                                        style: TextStyle(
                                            color:
                                                TColor.white.withOpacity(0.7),
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: media.width * 0.05,
                                      ),
                                      SizedBox(
                                          width: 120,
                                          height: 35,
                                          child: RoundButton(
                                              title: "View More",
                                              type: RoundButtonType.bgSGradient,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              onPressed: () {})),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          decoration: BoxDecoration(
                            color: TColor.primaryColor2.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Today Target",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                width: 70,
                                height: 25,
                                child: RoundButton(
                                  title: "Check",
                                  type: RoundButtonType.bgGradient,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ActivityTrackerView(),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                        Text(
                          "Activity Status",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: media.width * 0.02,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.width * 0.91,
                            decoration: BoxDecoration(
                              color: TColor.primaryColor2.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Heart Rate",
                                        style: TextStyle(
                                          color: TColor.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      ShaderMask(
                                        blendMode: BlendMode.srcIn,
                                        shaderCallback: (bounds) {
                                          return LinearGradient(
                                                  colors: TColor.primaryG,
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight)
                                              .createShader(Rect.fromLTRB(0, 0,
                                                  bounds.width, bounds.height));
                                        },
                                        child: Text(
                                          "78 BPM",
                                          style: TextStyle(
                                              color:
                                                  TColor.white.withOpacity(0.7),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                LineChart(
                                  LineChartData(
                                    showingTooltipIndicators:
                                        showingTooltipOnSpots.map((index) {
                                      return ShowingTooltipIndicators([
                                        LineBarSpot(
                                          tooltipsOnBar,
                                          lineBarsData.indexOf(tooltipsOnBar),
                                          tooltipsOnBar.spots[index],
                                        ),
                                      ]);
                                    }).toList(),
                                    lineTouchData: LineTouchData(
                                      enabled: true,
                                      handleBuiltInTouches: false,
                                      touchCallback: (FlTouchEvent event,
                                          LineTouchResponse? response) {
                                        if (response == null ||
                                            response.lineBarSpots == null) {
                                          return;
                                        }
                                        if (event is FlTapUpEvent) {
                                          final spotIndex = response
                                              .lineBarSpots!.first.spotIndex;
                                          showingTooltipOnSpots.clear();
                                          setState(() {
                                            showingTooltipOnSpots
                                                .add(spotIndex);
                                          });
                                        }
                                      },
                                      mouseCursorResolver: (FlTouchEvent event,
                                          LineTouchResponse? response) {
                                        if (response == null ||
                                            response.lineBarSpots == null) {
                                          return SystemMouseCursors.basic;
                                        }
                                        return SystemMouseCursors.click;
                                      },
                                      getTouchedSpotIndicator:
                                          (LineChartBarData barData,
                                              List<int> spotIndexes) {
                                        return spotIndexes.map((index) {
                                          return TouchedSpotIndicatorData(
                                            FlLine(
                                              color: Colors.red,
                                            ),
                                            FlDotData(
                                              show: true,
                                              getDotPainter: (spot, percent,
                                                      barData, index) =>
                                                  FlDotCirclePainter(
                                                radius: 3,
                                                color: Colors.white,
                                                strokeWidth: 3,
                                                strokeColor:
                                                    TColor.secondaryColor1,
                                              ),
                                            ),
                                          );
                                        }).toList();
                                      },
                                      touchTooltipData: LineTouchTooltipData(
                                        tooltipBgColor: TColor.secondaryColor1,
                                        tooltipRoundedRadius: 20,
                                        getTooltipItems:
                                            (List<LineBarSpot> lineBarsSpot) {
                                          return lineBarsSpot
                                              .map((lineBarSpot) {
                                            return LineTooltipItem(
                                              "${lineBarSpot.x.toInt()} mins ago",
                                              const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          }).toList();
                                        },
                                      ),
                                    ),
                                    lineBarsData: lineBarsData,
                                    minY: 0,
                                    maxY: 130,
                                    titlesData: FlTitlesData(
                                      show: false,
                                    ),
                                    gridData: FlGridData(show: false),
                                    borderData: FlBorderData(
                                      show: true,
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //     ],
                        //   ),
                        // ),
                        // ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Latest Workout",
                              style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "See More",
                                style: TextStyle(
                                    color: TColor.gray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: lastWorkoutArr.length,
                            itemBuilder: (context, index) {
                              var wObj = lastWorkoutArr[index] as Map? ?? {};
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const FinishedWorkoutView(),
                                      ),
                                    );
                                  },
                                  child: WorkoutRow(wObj: wObj));
                            }),
                        SizedBox(
                          height: media.width * 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
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

  List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
      (i) {
        var color0 = TColor.secondaryColor1;

        switch (i) {
          case 0:
            return PieChartSectionData(
                color: color0,
                value: 33,
                title: '',
                radius: 55,
                titlePositionPercentageOffset: 0.55,
                badgeWidget: const Text(
                  "20,1",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ));
          case 1:
            return PieChartSectionData(
              color: Colors.white,
              value: 75,
              title: '',
              radius: 45,
              titlePositionPercentageOffset: 0.55,
            );

          default:
            throw Error();
        }
      },
    );
  }

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          TColor.primaryColor2.withOpacity(0.5),
          TColor.primaryColor1.withOpacity(0.5),
        ]),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 35),
          FlSpot(2, 70),
          FlSpot(3, 40),
          FlSpot(4, 80),
          FlSpot(5, 25),
          FlSpot(6, 70),
          FlSpot(7, 35),
        ],
      );

  SideTitles get rightTitles => SideTitles(
        getTitlesWidget: rightTitleWidgets,
        showTitles: true,
        interval: 20,
        reservedSize: 40,
      );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 20:
        text = '20%';
        break;
      case 40:
        text = '40%';
        break;
      case 60:
        text = '60%';
        break;
      case 80:
        text = '80%';
        break;
      case 100:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: TextStyle(
          color: TColor.gray,
          fontSize: 12,
        ),
        textAlign: TextAlign.center);
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: TColor.gray,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Sun', style: style);
        break;
      case 2:
        text = Text('Mon', style: style);
        break;
      case 3:
        text = Text('Tue', style: style);
        break;
      case 4:
        text = Text('Wed', style: style);
        break;
      case 5:
        text = Text('Thu', style: style);
        break;
      case 6:
        text = Text('Fri', style: style);
        break;
      case 7:
        text = Text('Sat', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}

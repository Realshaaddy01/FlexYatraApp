import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import '../Models/common_widgets/round_button.dart';
import '../Models/common_widgets/setting_row.dart';
import '../Models/common_widgets/title_subtitle_cell.dart';
import '../utils/colo_extension.dart';
import 'Workoutplan/AllActivityPage.dart';
import 'homepage.dart';
import 'schedulepage.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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

  bool positive = false;

  List accountArr = [
    {"image": "assets/img/p_personal.png", "name": "Personal Data", "tag": "1"},
    {"image": "assets/img/p_achi.png", "name": "Achievement", "tag": "2"},
    {
      "image": "assets/img/p_activity.png",
      "name": "Activity History",
      "tag": "3"
    },
    {
      "image": "assets/img/p_workout.png",
      "name": "Workout Progress",
      "tag": "4"
    }
  ];

  List otherArr = [
    {"image": "assets/img/p_contact.png", "name": "Contact Us", "tag": "5"},
    {"image": "assets/img/p_privacy.png", "name": "Privacy Policy", "tag": "6"},
    {"image": "assets/img/p_setting.png", "name": "Setting", "tag": "7"},
  ];

  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        title: Text(
          "Profile",
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

            final height = userData['height'] ?? 'Height not available';
            final weight = userData['weight'] ?? 'Weight not available';
            final gender = userData['gender'] ?? 'gender not available';

            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "assets/img/u1.png",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userName,
                                style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Lose a Fat Program",
                                style: TextStyle(
                                  color: TColor.gray,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          height: 25,
                          child: RoundButton(
                            title: "Edit",
                            type: RoundButtonType.bgGradient,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const ActivityTrackerView(),
                              //   ),
                              // );
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TitleSubtitleCell(
                            title: "Height",
                            subtitle: height,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: TitleSubtitleCell(
                            title: "Weight",
                            subtitle: weight,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: TitleSubtitleCell(
                            title: "Gender",
                            subtitle: gender,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 2)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Account",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: accountArr.length,
                            itemBuilder: (context, index) {
                              var iObj = accountArr[index] as Map? ?? {};
                              return SettingRow(
                                icon: iObj["image"].toString(),
                                title: iObj["name"].toString(),
                                onPressed: () {},
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 2)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Notification",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 30,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("assets/img/p_notification.png",
                                      height: 15,
                                      width: 15,
                                      fit: BoxFit.contain),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Pop-up Notification",
                                      style: TextStyle(
                                        color: TColor.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  CustomAnimatedToggleSwitch<bool>(
                                    current: positive,
                                    values: [false, true],
                                    dif: 0.0,
                                    indicatorSize: Size.square(30.0),
                                    animationDuration:
                                        const Duration(milliseconds: 200),
                                    animationCurve: Curves.linear,
                                    onChanged: (b) =>
                                        setState(() => positive = b),
                                    iconBuilder: (context, local, global) {
                                      return const SizedBox();
                                    },
                                    defaultCursor: SystemMouseCursors.click,
                                    onTap: () =>
                                        setState(() => positive = !positive),
                                    iconsTappable: false,
                                    wrapperBuilder: (context, global, child) {
                                      return Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Positioned(
                                              left: 10.0,
                                              right: 10.0,
                                              height: 30.0,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors:
                                                          TColor.secondaryG),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              50.0)),
                                                ),
                                              )),
                                          child,
                                        ],
                                      );
                                    },
                                    foregroundIndicatorBuilder:
                                        (context, global) {
                                      return SizedBox.fromSize(
                                        size: const Size(10, 10),
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: TColor.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(50.0)),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black38,
                                                  spreadRadius: 0.05,
                                                  blurRadius: 1.1,
                                                  offset: Offset(0.0, 0.8))
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 2)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Other",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: otherArr.length,
                            itemBuilder: (context, index) {
                              var iObj = otherArr[index] as Map? ?? {};
                              return SettingRow(
                                icon: iObj["image"].toString(),
                                title: iObj["name"].toString(),
                                onPressed: () {},
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
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
        onTap: (int _pages) {
          setState(() {
            _currentIndex = _pages;
          });
          switch (_pages) {
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

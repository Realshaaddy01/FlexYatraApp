import 'package:flutter/material.dart';
import '../../../Connections/exercises_set_section.dart';
import '../../../Models/common_widgets/icon_title_next_row.dart';
import '../../../Models/common_widgets/round_button.dart';
import '../../../utils/colo_extension.dart';
import 'exercises_stpe_details.dart';
import 'workout_schedule_view.dart';

class WorkoutallView extends StatefulWidget {
  const WorkoutallView({super.key});

  @override
  State<WorkoutallView> createState() => _WorkoutallViewState();
}

class _WorkoutallViewState extends State<WorkoutallView> {
  List exercisesArr = [
    {
      "name": "Chest",
      "set": [
        {
          "image": "assets/img/fullbody/Chest/Inclined_Bench_Press.png",
          "title": "Incline Bench Press (Barbell/ Dumbbell)",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Chest/Flat_Bench_Press.png",
          "title": "Flat Bench Press (Barbell/ Dumbbell)",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Chest/Dumbbell_Machine_Fly.png",
          "title": "Dumbbell Fly/ Machine Fly ",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Chest/Decline_Bench_Press.png",
          "title": "Decline Bench Press (Barbell/ Dumbbell)",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Chest/Dumbbell_Pullover.png",
          "title": "Dumbbell Pullover",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Chest/Cable_Fly.png",
          "title": "Cable Fly",
          "value": "3 sets x 12 reps"
        },
      ],
    },
    {
      "name": "Triceps",
      "set": [
        {
          "image": "assets/img/fullbody/Triceps/Cable_Pushdown.png",
          "title": "Cable Pushdown",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Triceps/Skull_Crusher.png",
          "title": "Skull Crusher (EZ Bar/ Dumbbell)",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Triceps/Close_Grip_Bench_Press.png",
          "title": "Close Grip Bench Press",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Triceps/Dumbbell_Overhead_Extension.png",
          "title": "Dumbbell Overhead Extension",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Triceps/Kickback.png",
          "title": "Kickback",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Triceps/Dips.png",
          "title": "Dips",
          "value": "3 sets x 12 reps"
        },
      ]
    },
    {
      "name": "Back",
      "set": [
        {
          "image": "assets/img/fullbody/Back/Lat_Pulldown.png",
          "title": "Lat Pulldown",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Back/BentOver_Row.png",
          "title": "Bent-Over Row",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Back/Deadlift.png",
          "title": "Deadlift",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Back/Single_Arm_Dumbbell_Row.png",
          "title": "Single Arm Dumbbell Row",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Back/T_Bar_Row.png",
          "title": "T-Bar Row",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Back/Back_Extension.png",
          "title": "Back Extension",
          "value": "3 sets x 12 reps"
        },
      ]
    },
    {
      "name": "Biceps",
      "set": [
        {
          "image": "assets/img/fullbody/Biceps/Preacher_Curl.png",
          "title": "Preacher Curl",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Biceps/Dumbbell_Barbell_Curl.png",
          "title": "Dumbbell/ Barbell Curl",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Biceps/Hammer_Curl.png",
          "title": "Hammer Curl",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Biceps/Zottman_Curl.png",
          "title": "Zottman Curl",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Biceps/Concentration_Curl.png",
          "title": "Concentration Curl",
          "value": "3 sets x 12 reps"
        },
      ]
    },
    {
      "name": "Shoulder",
      "set": [
        {
          "image": "assets/img/fullbody/Shoulder/Shoulder_Press.png",
          "title": "Shoulder Press (Barbell/ Dumbbell)",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Shoulder/Dumbbell_Lateral_Raise.png",
          "title": "Dumbbell Lateral Raise",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Shoulder/Dumbbell_Front_Raise.png",
          "title": "Dumbbell Front Raise",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Shoulder/Face_Pull.png",
          "title": "Face Pull",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Shoulder/Upright_Row.png",
          "title": "Upright Row (Barbell/ Dumbbell)",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Shoulder/Shrug.png",
          "title": "Shrug (Barbell/ Dumbbell)",
          "value": "3 sets x 12 reps"
        },
      ]
    },
    {
      "name": "Legs",
      "set": [
        {
          "image": "assets/img/fullbody/Legs/Barbell_Squat.png",
          "title": "Barbell Squat",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Legs/Leg_Press.png",
          "title": "Leg Press",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Legs/Lunge.png",
          "title": "Lunge",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Legs/Leg_Extension.png",
          "title": "Leg Extension",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Legs/Romanian_Deadlift.png",
          "title": "Romanian Deadlift",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Legs/Hamstring_Curl.png",
          "title": "Hamstring Curl",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Legs/Calf_Press.png",
          "title": "Calf Press",
          "value": "3 sets x 12 reps"
        },
      ]
    },
    {
      "name": "Abs",
      "set": [
        {
          "image": "assets/img/fullbody/Abs/Crunch.png",
          "title": "Crunch",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Abs/Russian_Twist.png",
          "title": "Russian Twist",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Abs/Flutter_Kick.png",
          "title": "Flutter Kick",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Abs/Hanging_Leg_Raise.png",
          "title": "Hanging Leg Raise",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Abs/Mountain_Climbers.png",
          "title": "Mountain Climbers",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Abs/Bicycle_Crunches.png",
          "title": "Bicycle Crunches",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Abs/Plank.png",
          "title": "Plank",
          "value": "2 sets x 20 secs"
        },
      ]
    },
    {
      "name": "Glutes",
      "set": [
        {
          "image": "assets/img/fullbody/Glutes/Hip_Thrusts.png",
          "title": "Hip Thrusts",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Glutes/Sumo_Squat.png",
          "title": "Sumo Squat",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Glutes/Glute_Bridge.png",
          "title": "Glute Bridge",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Glutes/Glute_Kickback.png",
          "title": "Glute Kickback",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Glutes/Hip_Abduction.png",
          "title": "Hip Abduction",
          "value": "3 sets x 12 reps"
        },
        {
          "image": "assets/img/fullbody/Glutes/Goblet_Squat.png",
          "title": "Goblet Squat",
          "value": "3 sets x 12 reps"
        },
      ]
    },
  ];
  String exercises = "8 Exercises";
  String time = "1hrs";
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: TColor.primaryG)),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: TColor.lightGray,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    "assets/img/black_btn.png",
                    width: 15,
                    height: 15,
                    fit: BoxFit.contain,
                  ),
                ),
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
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: media.width * 0.5,
              flexibleSpace: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/img/goal_1.png",
                  width: media.width * 0.75,
                  height: media.width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: TColor.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 50,
                        height: 4,
                        decoration: BoxDecoration(
                            color: TColor.gray.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "FullBody Workout",
                                  style: TextStyle(
                                      color: TColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${exercises} | ${time} | 300 Calories Burn",
                                  style: TextStyle(
                                      color: TColor.gray, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Image.asset(
                              "assets/img/fav.png",
                              width: 15,
                              height: 15,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      IconTitleNextRow(
                          icon: "assets/img/time.png",
                          title: "Schedule Workout",
                          time: "5/27, 09:00 AM",
                          color: TColor.primaryColor2.withOpacity(0.3),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WorkoutScheduleView()));
                          }),
                      SizedBox(
                        height: media.width * 0.02,
                      ),
                      IconTitleNextRow(
                          icon: "assets/img/difficulity.png",
                          title: "Difficulity",
                          time: "Beginner",
                          color: TColor.secondaryColor2.withOpacity(0.3),
                          onPressed: () {}),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Exercises",
                            style: TextStyle(
                                color: TColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "3 Sets",
                              style:
                                  TextStyle(color: TColor.gray, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: exercisesArr.length,
                          itemBuilder: (context, index) {
                            var sObj = exercisesArr[index] as Map? ?? {};
                            return ExercisesSetSection(
                              sObj: sObj,
                              onPressed: (obj) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExercisesStepDetails(
                                      eObj: obj,
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundButton(title: "Start Workout", onPressed: () {})
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

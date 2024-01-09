import 'package:flexyatra_app/Presentations/meal_planner/nonvegmeals.dart';
import 'package:flexyatra_app/Presentations/meal_planner/vegmeals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../Models/common_widgets/round_button.dart';
import '../../utils/colo_extension.dart';

class AllMeals extends StatefulWidget {
  const AllMeals({super.key});

  @override
  State<AllMeals> createState() => _AllMealsState();
}

class _AllMealsState extends State<AllMeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: TColor.white,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "Find Your Meal",
        style: TextStyle(
          color: TColor.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundButton(
                  title: "All Vegeterian Meals",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllVegMealsPage(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 15,
              ),
              RoundButton(
                  title: "All Non-Vegeterian Meals",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllNonVegMealsPage(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

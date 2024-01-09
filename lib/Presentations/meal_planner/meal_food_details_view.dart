import 'package:flutter/material.dart';

import '../../utils/colo_extension.dart';

import 'food_info_details_view.dart';
import 'sub_widgets/meal_category_cell.dart';
import 'sub_widgets/meal_recommed_cell.dart';
import 'sub_widgets/popular_meal_row.dart';

class MealFoodDetailsView extends StatefulWidget {
  final Map eObj;
  const MealFoodDetailsView({super.key, required this.eObj});

  @override
  State<MealFoodDetailsView> createState() => _MealFoodDetailsViewState();
}

class _MealFoodDetailsViewState extends State<MealFoodDetailsView> {
  TextEditingController txtSearch = TextEditingController();

  List categoryArr = [
    {
      "name": "Salad",
      "image": "assets/img/MealPlan/Salad.png",
    },
    {
      "name": "Meat",
      "image": "assets/img/MealPlan/Meat.png",
    },
    {
      "name": "Cake",
      "image": "assets/img/MealPlan/Cake.png",
    },
    {
      "name": "Pie",
      "image": "assets/img/MealPlan/Pie.png",
    },
    {
      "name": "Smoothies",
      "image": "assets/img/MealPlan/Smoothies.png",
    },
    {
      "name": "Curry",
      "image": "assets/img/MealPlan/Curry.png",
    },
    {
      "name": "Soup",
      "image": "assets/img/MealPlan/Soup.png",
    },
    {
      "name": "Noodles",
      "image": "assets/img/MealPlan/Noodles.png",
    },
    {
      "name": "Lentil Soup",
      "image": "assets/img/MealPlan/Lentil_Soup.png",
    },
    {
      "name": "Peanut Butter Sandwich",
      "image": "assets/img/MealPlan/PeanutButter_Sandwich.png",
    },
  ];

  List popularArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/img/MealPlan/Blueberry_Pancake.png",
      "b_image":"assets/img/MealPlan/Blueberry_Pancake.png",
      "size": "Medium",
      "time": "30mins",
      "kcal": "230kCal"
    },
    {
      "name": "Chicken Sandwich",
      "image": "assets/img/MealPlan/Chicken_Sandwich.png",
      "b_image": "assets/img/MealPlan/Chicken_Sandwich.png",
      "size": "Medium",
      "time": "20mins",
      "kcal": "280kCal"
    },
    {
      "name": "Mushroom Soup",
      "image": "assets/img/MealPlan/Mushroom_Soup.png",
      "b_image": "assets/img/MealPlan/Mushroom_Soup.png",
      "size": "Medium",
      "time": "15mins",
      "kcal": "50kCal"
    },
    {
      "name": "Thukpa",
      "image": "assets/img/MealPlan/Thukpa.png",
      "b_image": "assets/img/MealPlan/Thukpa.png",
      "size": "Medium",
      "time": "20mins",
      "kcal": "440kCal"
    },
    {
      "name": "Oatmeal",
      "image": "assets/img/MealPlan/Oatmeal.png",
      "b_image": "assets/img/MealPlan/Oatmeal.png",
      "size": "Easy",
      "time": "20mins",
      "kcal": "80kCal"
    },
    {
      "name": "Dal Bhat",
      "image": "assets/img/MealPlan/Dal_Bhat.png",
      "b_image": "assets/img/MealPlan/Dal_Bhat.png",
      "size": "Medium",
      "time": "60mins",
      "kcal": "430kCal"
    },
    {
      "name": "Roti",
      "image": "assets/img/MealPlan/Roti.png",
      "b_image": "assets/img/MealPlan/Roti.png",
      "size": "Medium",
      "time": "20mins",
      "kcal": "95kCal"
    },
    {
      "name": "Lassi",
      "image": "assets/img/MealPlan/Lassi.png",
      "b_image": "assets/img/MealPlan/Lassi.png",
      "size": "Easy",
      "time": "20mins",
      "kcal": "160kCal"
    },
    {
      "name": "Crispy Tofu",
      "image": "assets/img/MealPlan/Crispy_Tofu.png",
      "b_image": "assets/img/MealPlan/Crispy_Tofu.png",
      "size": "Easy",
      "time": "15mins",
      "kcal": "75kCal"
    },
    {
      "name": "Paneer Curry",
      "image": "assets/img/MealPlan/Paneer_Curry.png",
      "b_image": "assets/img/MealPlan/Paneer_Curry.png",
      "size": "Medium",
      "time": "30mins",
      "kcal": "300kCal"
    },
    {
      "name": "Soya Chunks Curry",
      "image": "assets/img/MealPlan/Soya_Chunks_Curry.png",
      "b_image": "assets/img/MealPlan/Soya_Chunks_Curry.png",
      "size": "Easy",
      "time": "20mins",
      "kcal": "280kCal"
    },
  ];

  List recommendArr = [
    {
      "name": "Dal Bhat",
      "image": "assets/img/MealPlan/Dal_Bhat.png",
      "size": "Medium",
      "time": "60mins",
      "kcal": "430kCal"
    },
    {
      "name": "Lassi",
      "image": "assets/img/MealPlan/Lassi.png",
      "size": "Easy",
      "time": "20mins",
      "kcal": "160kCal"
    },
    {
      "name": "Oatmeal",
      "image": "assets/img/MealPlan/Oatmeal.png",
      "size": "Easy",
      "time": "20mins",
      "kcal": "80kCal"
    },
    {
      "name": "Mushroom Soup",
      "image": "assets/img/MealPlan/Mushroom_Soup.png",
      "size": "Medium",
      "time": "15mins",
      "kcal": "50kCal"
    },
    {
      "name": "Roti",
      "image": "assets/img/MealPlan/Roti.png",
      "size": "Medium",
      "time": "95mins",
      "kcal": "50kCal"
    },

  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
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
        title: Text(
          widget.eObj["name"].toString(),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: TColor.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        offset: Offset(0, 1))
                  ]),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: txtSearch,
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        prefixIcon: Image.asset(
                          "assets/img/search.png",
                          width: 25,
                          height: 25,
                        ),
                        hintText: "Search Pancake"),
                  )),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 1,
                    height: 25,
                    color: TColor.gray.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/img/Filter.png",
                      width: 25,
                      height: 25,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryArr.length,
                  itemBuilder: (context, index) {
                    var cObj = categoryArr[index] as Map? ?? {};
                    return MealCategoryCell(
                      cObj: cObj,
                      index: index,
                    );
                  }),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Recommendation\nfor Diet",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: media.width * 0.6,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendArr.length,
                  itemBuilder: (context, index) {
                    var fObj = recommendArr[index] as Map? ?? {};
                    return MealRecommendCell(
                      fObj: fObj,
                      index: index,
                    );
                  }),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Popular",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: popularArr.length,
                itemBuilder: (context, index) {
                  var fObj = popularArr[index] as Map? ?? {};
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodInfoDetailsView(
                            dObj: fObj,
                            mObj: widget.eObj,
                          ),
                        ),
                      );
                    },
                    child: PopularMealRow(
                      mObj: fObj,
                    ),
                  );
                }),
            SizedBox(
              height: media.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}

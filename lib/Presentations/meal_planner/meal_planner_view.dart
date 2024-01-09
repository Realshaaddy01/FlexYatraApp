import 'package:fl_chart/fl_chart.dart';
import 'package:flexyatra_app/Presentations/meal_planner/allmeal_details_page.dart';
import 'package:flutter/material.dart';

import '../../Connections/find_eat_cell.dart';
import '../../Models/common_widgets/round_button.dart';
import '../../utils/colo_extension.dart';
import 'meal_food_details_view.dart';
import 'meal_schedule_view.dart';
import 'sub_widgets/today_meal_row.dart';

class MealPlannerView extends StatefulWidget {
  const MealPlannerView({super.key});

  @override
  State<MealPlannerView> createState() => _MealPlannerViewState();
}

class _MealPlannerViewState extends State<MealPlannerView> {
  List todayMealArr = [
    {
      "name": "Salmon Nigiri",
      "image": "assets/img/m_1.png",
      "time": "28/05/2023 07:00 AM"
    },
    {
      "name": "Lassi",
      "image": "assets/img/MealPlan/Lassi.png",
      "time": "28/05/2023 12:00 AM"
    },
    {
      "name": "Dal Bhat",
      "image": "assets/img/MealPlan/Dal_Bhat.png",
      "time": "28/05/2023 20:00 AM"
    },
  ];

  List findEatArr = [
    {
      "name": "Breakfast",
      "image": "assets/img/m_3.png",
      "number": "50+ Foods"
    },
    {"name": "Lunch", "image": "assets/img/m_4.png", "number": "30+ Foods"},
    {
      "name": "Snacks",
      "image": "assets/img/MealPlan/Fruits.png",
      "number": "25+ Foods"
    },
    {
      "name": "Dinner",
      "image": "assets/img/MealPlan/Mushroom_Soup.png",
      "time": "20+ Foods"
    },
    {
      "name": "Desserts",
      "image": "assets/img/MealPlan/Dark_Chocolate.png",
      "time": "15+ Foods"
    },

  ];

  List breakfastArr = [
    {
      "name": "Coffee",
      "image": "assets/img/MealPlan/Coffee.png",
      "time": "07:00am"
    },
    {
      "name": "Oatmeal",
      "image": "assets/img/MealPlan/Oatmeal.png",
      "time": "07:30am"
    },
    {
      "name": "Scrambled Eggs",
      "image": "assets/img/MealPlan/Scrambled_Eggs.png",
      "time": "07:30am"
    },
    {
      "name": " Peanut Butter Sandwich",
      "image": "assets/img/MealPlan/PeanutButter_Sandwich.png",
      "time": "07:30am"
    },
  ];

  List lunchArr = [
    {
      "name": "Dal Bhat",
      "image": "assets/img/MealPlan/Dal_Bhat.png",
      "time": "11:00am"
    },
    {
      "name": "Thukpa",
      "image": "assets/img/MealPlan/Thukpa.png",
      "time": "11:00pm"
    },
    {
      "name": "Milk",
      "image": "assets/img/MealPlan/Milk.png",
      "time": "11:00pm"
    },
    {
      "name": "Chicken Sandwich",
      "image": "assets/img/MealPlan/Chicken_Sandwich.png",
      "time": "11:00pm"
    },
    {
      "name": "Noodles",
      "image": "assets/img/MealPlan/Noodles.png",
      "time": "11:00pm"
    },

  ];
  List snacksArr = [
    {
      "name": "Fruits",
      "image": "assets/img/MealPlan/Fruits.png",
      "time": "04:30pm"
    },

    {
      "name": "Nuts",
      "image": "assets/img/MealPlan/Nuts.png",
      "time": "04:30pm"
    },
    {
      "name": "Smoothies",
      "image": "assets/img/MealPlan/Smoothies.png",
      "time": "04:30pm"
    },

  ];
  List dinnerArr = [
    {
      "name": "Roti",
      "image": "assets/img/MealPlan/Roti.png",
      "time": "08:00pm"
    },
    {
      "name": "Lentil Soup",
      "image": "assets/img/MealPlan/Lentil_Soup.png",
      "time": "08:00pm"
    },
    {
      "name": "Salad",
      "image": "assets/img/MealPlan/Salad.png",
      "time": "08:00pm"
    },
    {
      "name": "Mushroom Soup",
      "image": "assets/img/MealPlan/Mushroom_Soup.png",
      "time": "08:00pm"
    },

  ];
  List dessertArr = [
    {
      "name": "Lassi",
      "image": "assets/img/MealPlan/Lassi.png",
      "time": "03:30pm"
    },
    {
      "name": "Fruit Tart",
      "image": "assets/img/MealPlan/Fruit_Tart.png",
      "time": "04:00pm"
    },
    {
      "name": "Dark Chocolate",
      "image": "assets/img/MealPlan/Dark_Chocolate.png",
      "time": "04:00pm"
    },
  ];

  String selectedMeal = "Breakfast"; // Default to Breakfast
  List? selectedArr;

  @override
  void initState() {
    super.initState();
    updateSelectedArr();
  }

  void updateSelectedArr() {
    if (selectedMeal == "Breakfast") {
      selectedArr =breakfastArr;
    } else if (selectedMeal == "Lunch") {
      selectedArr = lunchArr;
    }else if (selectedMeal == "Snack") {
      selectedArr = snacksArr;
  } else if (selectedMeal == "Dinner") {
      selectedArr = dinnerArr;
  }else if (selectedMeal == "Dessert") {
      selectedArr = dessertArr;
    }
  }


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
          "All Meals Planner",
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Meal Nutritions",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: TColor.secondaryG),
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              items: ["Weekly", "Monthly"]
                                  .map((name) => DropdownMenuItem(
                                        value: name,
                                        child: Text(
                                          name,
                                          style: TextStyle(
                                              color: TColor.gray, fontSize: 14),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {},
                              icon:
                                  Icon(Icons.expand_more, color: TColor.white),
                              hint: Text(
                                "Weekly",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: TColor.white, fontSize: 12),
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 15),
                      height: media.width * 0.5,
                      width: double.maxFinite,
                      child: LineChart(
                        LineChartData(
                          lineTouchData: LineTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            touchCallback: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              },
                            mouseCursorResolver: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return SystemMouseCursors.basic;
                              }
                              return SystemMouseCursors.click;
                            },
                            getTouchedSpotIndicator: (LineChartBarData barData,
                                List<int> spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  FlLine(
                                    color: Colors.transparent,
                                  ),
                                  FlDotData(
                                    show: true,
                                    getDotPainter:
                                        (spot, percent, barData, index) =>
                                            FlDotCirclePainter(
                                      radius: 3,
                                      color: Colors.white,
                                      strokeWidth: 3,
                                      strokeColor: TColor.secondaryColor1,
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
                                return lineBarsSpot.map((lineBarSpot) {
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
                          lineBarsData: lineBarsData1,
                          minY: -0.5,
                          maxY: 110,
                          titlesData: FlTitlesData(
                              show: true,
                              leftTitles: AxisTitles(),
                              topTitles: AxisTitles(),
                              bottomTitles: AxisTitles(
                                sideTitles: bottomTitles,
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: rightTitles,
                              )),
                          gridData: FlGridData(
                            show: true,
                            drawHorizontalLine: true,
                            horizontalInterval: 25,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: TColor.gray.withOpacity(0.15),
                                strokeWidth: 2,
                              );
                            },
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      )),
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
                          "Daily Meal Schedule",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
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
                                      const MealScheduleView(),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Meals",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: TColor.primaryG),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              items: [
                                "Breakfast",
                                "Lunch",
                                "Dinner",
                                "Snack",
                                "Dessert"
                              ]
                                  .map((name) => DropdownMenuItem(
                                        value: name,
                                        child: Text(
                                          name,
                                          style: TextStyle(
                                              color: TColor.gray, fontSize: 14),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedMeal,
                              onChanged: (value) {
                                setState(() {
                                  selectedMeal = value.toString();
                                  updateSelectedArr(); // Update selectedArr based on the selected meal
                                });
                              },
                              icon:
                                  Icon(Icons.expand_more, color: TColor.white),
                              hint: Text(
                                "Breakfast",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: TColor.black, fontSize: 12),
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: todayMealArr.length,
                      itemBuilder: (context, index) {
                        var mObj = todayMealArr[index] as Map? ?? {};
                        return TodayMealRow(
                          mObj: mObj,
                        );
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Find Something to Eat",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: media.width * 0.55,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: findEatArr.length,
                  itemBuilder: (context, index) {
                    var fObj = findEatArr[index] as Map? ?? {};
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MealFoodDetailsView(eObj: fObj) ) );
                      },
                      child: FindEatCell(
                        fObj: fObj,
                        index: index,
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Find Meals of your Type",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0,vertical: 15),
              child: RoundButton(
                  title: "Meal Plans",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllMeals(),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          TColor.primaryColor2,
          TColor.primaryColor1,
        ]),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            radius: 3,
            color: Colors.white,
            strokeWidth: 1,
            strokeColor: TColor.primaryColor2,
          ),
        ),
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

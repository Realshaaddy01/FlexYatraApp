import 'package:flutter/material.dart';

class AllVegMealsPage extends StatelessWidget {
  final List<Meal> _meals = [
    Meal(
      category: 'Breakfast',
      imageUrl: 'assets/img/Allmeals/vegmeals/oats_berries.jpg',
      title: 'Oats with Berries',
      value: '500 calories',
    ),
    Meal(
      category: 'Breakfast',
      imageUrl: 'assets/img/Allmeals/vegmeals/smoothie_bowl.jpg',
      title: 'Tropical Smoothie Bowl',
      value: '400 calories',
    ),
    Meal(
      category: 'Breakfast',
      imageUrl: 'assets/img/Allmeals/vegmeals/avocado_toast.jpg',
      title: 'Avocado Toast with Poached Egg',
      value: '350 calories',
    ),
    Meal(
      category: 'Breakfast',
      imageUrl: 'assets/img/Allmeals/vegmeals/tofu_scramble.jpg',
      title: 'Tofu Scramble with Peppers and Onions',
      value: '450 calories',
    ),
    Meal(
      category: 'Breakfast',
      imageUrl: 'assets/img/Allmeals/vegmeals/pancakes_fruit.jpg',
      title: 'Whole Wheat Pancakes with Fruit Compote',
      value: '400 calories',
    ),

    Meal(
      category: 'Snacks',
      imageUrl: 'assets/img/Allmeals/vegmeals/hummus_veggies.jpg',
      title: 'Hummus with Veggie Sticks',
      value: '250 calories',
    ),
    Meal(
      category: 'Snacks',
      imageUrl: 'assets/img/Allmeals/vegmeals/roasted_chickpeas.jpg',
      title: 'Spicy Roasted Chickpeas',
      value: '150 calories',
    ),
    Meal(
      category: 'Snacks',
      imageUrl: 'assets/img/Allmeals/vegmeals/apple_butter.jpg',
      title: 'Apple Slices with Almond Butter',
      value: '200 calories',
    ),
    Meal(
      category: 'Snacks',
      imageUrl: 'assets/img/Allmeals/vegmeals/spring_rolls.jpg',
      title: 'Veggie Spring Rolls with Dipping Sauce',
      value: '300 calories',
    ),
    Meal(
      category: 'Snacks',
      imageUrl: 'assets/img/Allmeals/vegmeals/trail_mix.jpg',
      title: 'Trail Mix with Nuts and Dried Fruit',
      value: '200 calories',
    ),
    Meal(
      category: 'Lunch',
      imageUrl: 'assets/img/Allmeals/vegmeals/burrito_bowl.jpg',
      title: 'Vegan Burrito Bowl with Black Beans and Salsa',
      value: '550 calories',
    ),
    Meal(
      category: 'Lunch',
      imageUrl: 'assets/img/Allmeals/vegmeals/quinoa_salad.jpg',
      title: 'Quinoa Salad with Roasted Vegetables',
      value: '400 calories',
    ),
    Meal(
      category: 'Lunch',
      imageUrl: 'assets/img/Allmeals/vegmeals/lentil_soup.jpg',
      title: 'Lentil Soup with Crusty Bread',
      value: '350 calories',
    ),
    Meal(
      category: 'Lunch',
      imageUrl: 'assets/img/Allmeals/vegmeals/chickpea_curry.jpg',
      title: 'Chickpea Curry with Rice',
      value: '450 calories',
    ),
    Meal(
      category: 'Lunch',
      imageUrl: 'assets/img/Allmeals/vegmeals/tofu_stirfry.jpg',
      title: 'Tofu Stir-Fry with Noodles',
      value: '500 calories',
    ),

    Meal(
      category: 'Dinner',
      imageUrl: 'assets/img/Allmeals/vegmeals/vegetable_lasagna.jpg',
      title: 'Vegetable Lasagna with Spinach and Ricotta',
      value: '500 calories',
    ),
    Meal(
      category: 'Dinner',
      imageUrl: 'assets/img/Allmeals/vegmeals/dal_roti.jpg',
      title: 'Lentil Dal with Roti',
      value: '400 calories',
    ),
    Meal(
      category: 'Dinner',
      imageUrl: 'assets/img/Allmeals/vegmeals/pasta_primavera.jpg',
      title: 'Pasta Primavera with Vegetables',
      value: '450 calories',
    ),
    Meal(
      category: 'Dinner',
      imageUrl: 'assets/img/Allmeals/vegmeals/Mushroom_Stroganoff.jpg',
      title: 'Mushroom Stroganoff with Vegetables',
      value: '450 calories',
    ),
    Meal(
      category: 'Dinner',
      imageUrl: 'assets/img/Allmeals/vegmeals/Tofu_Pad_Thai.jpg',
      title: 'Tofu Pad Thai with Vegetables',
      value: '500 calories',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Veg Meals'),
      ),
      body: ListView.builder(
        itemCount: _meals.length,
        itemBuilder: (context, index) {
          final meal = _meals[index];
          return MealCard(meal: meal);
        },
      ),
    );
  }
}

class Meal {
  final String category;
  final String imageUrl;
  final String title;
  final String value;

  Meal({
    required this.category,
    required this.imageUrl,
    required this.title,
    required this.value,
  });
}

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              meal.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(meal.category, style: TextStyle(fontSize: 16)),
                  Text(meal.title, style: TextStyle(fontSize: 12)),
                  Text(meal.value, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class AllNonVegMealsPage extends StatelessWidget {
  final List<Meal> _meals = [
    Meal(
      category: 'Breakfast',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/scrambled_eggs_salmon.jpg',
      title: 'Scrambled Eggs with Smoked Salmon',
      value: '500 calories',
    ),
    Meal(
      category: 'Breakfast',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/sausage_hash_browns.jpg',
      title: 'Sausage and Hash Browns',
      value: '600 calories',
    ),
    Meal(
      category: 'Breakfast',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/chicken_sausage_waffles.jpg',
      title: 'Chicken Sausage and Waffles',
      value: '550 calories',
    ),
    Meal(
      category: 'Breakfast',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/tuna_salad_toast.jpg',
      title: 'Tuna Salad on Toast',
      value: '400 calories',
    ),
    Meal(
      category: 'Breakfast',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/yogurt_berries_granola.jpg',
      title: 'Greek Yogurt with Berries and Granola (add nuts/seeds for non-veg)',
      value: '350 calories',
    ),
    Meal(
      category: 'Snacks',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/hard_boiled_eggs.jpg',
      title: 'Hard-boiled Eggs',
      value: '70 calories',
    ),
    Meal(
      category: 'Snacks',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/turkey_jerky_cheese.jpg',
      title: 'Turkey Jerky and Cheese',
      value: '150 calories',
    ),
    Meal(
      category: 'Snacks',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/hummus_veggies_chicken.jpg',
      title: 'Hummus with Sliced Vegetables and Chicken',
      value: '300 calories',
    ),
    Meal(
      category: 'Snacks',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/edamame.jpg',
      title: 'Edamame with Sea Salt',
      value: '120 calories',
    ),
    Meal(
      category: 'Snacks',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/cottage_cheese_fruit.jpg',
      title: 'Cottage Cheese with Fruit and Honey',
      value: '250 calories',
    ),
    Meal(
      category: 'Lunch',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/chicken_salad_sandwich.jpg',
      title: 'Chicken Salad Sandwich',
      value: '400 calories',
    ),
    Meal(
      category: 'Lunch',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/tuna_melt.jpg',
      title: 'Tuna Melt',
      value: '500 calories',
    ),
    Meal(
      category: 'Lunch',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/taco_salad_beef.jpg',
      title: 'Taco Salad with Ground Beef',
      value: '550 calories',
    ),
    Meal(
      category: 'Lunch',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/grilled_chicken_caesar_salad.jpg',
      title: 'Grilled Chicken Caesar Salad',
      value: '450 calories',
    ),
    Meal(
      category: 'Lunch',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/lentil_soup_sausage.jpg',
      title: 'Lentil Soup with Sausage',
      value: '400 calories',
    ),
    Meal(
      category: 'Dinner',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/salmon_roasted_vegetables.jpg',
      title: 'Salmon with Roasted Vegetables',
      value: '550 calories',
    ),
    Meal(
      category: 'Dinner',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/chicken_stirfry_noodles.jpg',
      title: 'Chicken Stir-Fry with Noodles',
      value: '600 calories',
    ),
    Meal(
      category: 'Dinner',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/chicken_tikka_masala_naan.jpg',
      title: 'Chicken Tikka Masala with Garlic Naan',
      value: '700 calories',
    ),
    Meal(
      category: 'Dinner',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/beef_tacos_slaw.jpg',
      title: 'Beef Tacos with Cilantro Lime Slaw',
      value: '650 calories',
    ),
    Meal(
      category: 'Dinner',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/salmon_asparagus_lemon.jpg',
      title: 'Salmon with Roasted Asparagus and Lemon Butter',
      value: '450 calories',
    ),
    Meal(
      category: 'Dinner',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/shrimp_alfredo_fettuccine.jpg',
      title: 'Shrimp Alfredo with Fettuccine',
      value: '750 calories',
    ),
    Meal(
      category: 'Dinner',
      imageUrl: 'assets/img/Allmeals/nonvegmeals/chicken_skewers_mediterranean.jpg',
      title: 'Mediterranean-Style Grilled Chicken Skewers with Vegetables',
      value: '500 calories',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Non-Veg Meals'),
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

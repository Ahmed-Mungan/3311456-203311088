import 'package:flutter/material.dart';
import 'package:myproject/models/food_model.dart';
import 'package:myproject/services/food_service.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    FoodService foodService = FoodService();
    Food? food;
    Future<void> getFood() async {
      food = await foodService.getFoods();
    }

    getFood();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Text(food!.result![0].name ?? "selam"),
        ],
      )),
    );
  }
}

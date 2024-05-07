import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal/models/meal.dart';

class FavoriteMealsNotifer extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifer() : super([]);

  bool toggleMealFavoriteStatus(Meal meal){
    final mealIsFavorite = state.contains(meal);
    if(mealIsFavorite){
      state = state.where((meal) => meal.id != meal.id).toList(); // 自分以外のリスト
      return false;
    }else{
      state = [...state, meal]; // 自分と他のお気に入りのリスト
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifer, List<Meal>>((ref) => FavoriteMealsNotifer());

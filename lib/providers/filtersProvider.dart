import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/providers/mealsProvider.dart';

import 'package:meal/screens/filtersScreen.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FiltersNotifer extends StateNotifier<Map<Filter, bool>>{
  FiltersNotifer() : super({
    Filter.glutenFree : false,
    Filter.lactoseFree : false,
    Filter.vegetarian : false,
    Filter.vegan : false,
  });

  void setFilter(Filter filter, bool isActive){
    state = {
      ...state,
      filter : isActive,
    };
  }

  void setFilters(Map<Filter, bool> chosenfilters){
    state = chosenfilters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifer, Map<Filter, bool>>(
        (ref) => FiltersNotifer());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if(activeFilters[Filter.glutenFree]! && !meal.isGlutenFree){
      return false;
    }
    if(activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
      return false;
    }
    if(activeFilters[Filter.vegan]! && !meal.isVegan){
      return false;
    }
    if(activeFilters[Filter.vegetarian]! && !meal.isVegetarian){
      return false;
    }
    return true;
  }).toList();
});

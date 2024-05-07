import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal/data/dummyData.dart';

final mealsProvider = Provider((ref){
  return dummyMeals;
});

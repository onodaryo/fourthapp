import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meal/models/meal.dart';

class MealExplainScreen extends StatelessWidget {
  const MealExplainScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    Widget content = Image.network(
      meal.imageUrl,
      height: 300,
      width: double.infinity,
      fit: BoxFit.cover,
    );

    if (meal == null) {
      content = Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Uh oh ... nothing here!?!?!?!?!?',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              const SizedBox(
                height: 16,
              ),
              Text('Try selecting a different meal...',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),)
            ]),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: content,
    );
  }
}

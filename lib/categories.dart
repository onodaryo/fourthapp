import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meal/main.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Center(child: Text('1',style: TextStyle(color: Colors.white, ),textAlign: TextAlign.left,)),
          Center(child: Text('2',style: TextStyle(color: Colors.white, ),textAlign: TextAlign.center,)),
          Center(child: Text('3',style: TextStyle(color: Colors.white, ),textAlign: TextAlign.center,)),
          Center(child: Text('4',style: TextStyle(color: Colors.white, ),textAlign: TextAlign.center,)),
          Center(child: Text('5',style: TextStyle(color: Colors.white, ),textAlign: TextAlign.center,)),
          Center(child: Text('6',style: TextStyle(color: Colors.white, ),textAlign: TextAlign.center,)),
        ],
      ),
    );
  }
}
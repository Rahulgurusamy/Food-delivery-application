import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food/providers/food_provider.dart';
import 'package:food/widgets/food_item.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<FoodProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red[700]!, Colors.red[400]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: foodProvider.favorites.isEmpty
      ? const Center(
        child: Text(
          'No favorites yet!',
          style: TextStyle(fontSize: 18),
        ),
      )
      :ListView.builder(
        itemCount: foodProvider.favorites.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: FoodItem(
                  food: foodProvider.favorites[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

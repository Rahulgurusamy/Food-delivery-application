import 'package:flutter/material.dart';
import 'package:food/models/food_model.dart';

class FoodProvider extends ChangeNotifier {
  final List<Food> _foods = [
  Food(
    id: '1',
    name: 'Pizza',
    description: 'Delicious cheese pizza',
    price: 9.99,
    imagePath: 'assets/pizza.jpg',
    category: 'Italian',
    ingredients: 'Dough, Cheese, Tomato Sauce',
    nutritionalInfo: 'Calories: 300, Fat: 12g, Carbs: 30g, Protein: 15g',
  ),
  Food(
    id: '2',
    name: 'Burger',
    description: 'Juicy beef burger',
    price: 7.99,
    imagePath: 'assets/burger.jpg',
    category: 'Fast Food',
    ingredients: 'Bun, Beef Patty, Cheese, Lettuce, Tomato, Onion',
    nutritionalInfo: 'Calories: 500, Fat: 25g, Carbs: 40g, Protein: 30g',
  ),
  Food(
    id: '3',
    name: 'Pasta',
    description: 'Chicken Pasta',
    price: 8.99,
    imagePath: 'assets/pasta.jpg',
    category: 'Italian',
    ingredients: 'Pasta, Chicken, Alfredo Sauce, Garlic, Parmesan Cheese',
    nutritionalInfo: 'Calories: 400, Fat: 18g, Carbs: 45g, Protein: 20g',
  ),
  Food(
    id: '4',
    name: 'Chicken',
    description: 'Chicken 65',
    price: 9.99,
    imagePath: 'assets/chicken.jpg',
    category: 'Indian',
    ingredients: 'Chicken, Spices, Curry Leaves, Yogurt',
    nutritionalInfo: 'Calories: 350, Fat: 15g, Carbs: 20g, Protein: 25g',
  ),
  Food(
    id: '5',
    name: 'Biryani',
    description: 'Chicken Biryani',
    price: 7.99,
    imagePath: 'assets/briyani.jpg',
    category: 'Indian',
    ingredients: 'Basmati Rice, Chicken, Spices, Yogurt, Fried Onions',
    nutritionalInfo: 'Calories: 600, Fat: 30g, Carbs: 70g, Protein: 35g',
  ),
  Food(
    id: '6',
    name: 'French fries',
    description: 'Masala Fries',
    price: 5.99,
    imagePath: 'assets/french fries.jpg',
    category: 'Fast Food',
    ingredients: 'Potatoes, Salt, Pepper, Spices',
    nutritionalInfo: 'Calories: 300, Fat: 15g, Carbs: 40g, Protein: 5g',
  ),
  Food(
    id: '7',
    name: 'Meals',
    description: 'Veg Meals',
    price: 10.99,
    imagePath: 'assets/veg meals.jpg',
    category: 'Indian',
    ingredients: 'Rice, Dal, Vegetables, Chapati',
    nutritionalInfo: 'Calories: 400, Fat: 10g, Carbs: 50g, Protein: 15g',
  ),
  Food(
    id: '8',
    name: 'Drinks',
    description: 'Fanta',
    price: 4.99,
    imagePath: 'assets/fanta.jpg',
    category: 'Beverage',
    ingredients: 'Carbonated Water, Sugar, Citric Acid, Natural Flavors',
    nutritionalInfo: 'Calories: 150, Fat: 0g, Carbs: 40g, Protein: 0g',
  ),
];


  List<Food> get foods => _foods;

  final List<Food> _favorites = [];
  List<Food> get favorites => _favorites;

  final List<Food> _cart = [];
  List<Food> get cart => _cart;

  void addToFavorites(Food food) {
    if (!_favorites.contains(food)) {
      _favorites.add(food);
      notifyListeners();
    }
  }

  void removeFromFavorites(Food food) {
    _favorites.remove(food);
    notifyListeners();
  }

    void addToCart(Food food, int quantity) {
    for (var i = 0; i < quantity; i++) {
      cart.add(food);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var food in cart) {
      total += food.price;
    }
    return total;
  }

  void toggleFavorite(Food food) {
    int index = _foods.indexWhere((f) => f.id == food.id);
    if (index != -1) {
      _foods[index].isFavorite = !_foods[index].isFavorite;
    }
    notifyListeners();
  }
  
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}

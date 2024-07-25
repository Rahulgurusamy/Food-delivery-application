import 'package:food/models/food_model.dart';
import 'package:food/utils/api_request.dart';

class FoodRepository {
  final ApiRequest apiRequest = ApiRequest();

  Future<List<Food>> fetchFoods() async {
    final response = await apiRequest.get('/foods');
    return (response as List).map((json) => Food.fromJson(json)).toList();
  }

  Future<void> addFavorite(Food food) async {
    await apiRequest.post('/favorites', data: food.toJson());
  }

  Future<void> removeFavorite(String foodId) async {
    await apiRequest.delete('/favorites/$foodId');
  }

  Future<void> addToCart(Food food) async {
    await apiRequest.post('/cart', data: food.toJson());
  }

  Future<void> removeFromCart(String foodId) async {
    await apiRequest.delete('/cart/$foodId');
  }
}

class Restaurant {
  final String id;
  final String name;
  final String image;
  final String description;
  final double rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.rating,
  });
}
List<Restaurant> favoriteRestaurants = [
  Restaurant(
    id: '1',
    name: 'Pizza Palace',
    image: 'assets/pizza.jpg',
    description: 'The best pizza in town!',
    rating: 4.5,
  ),
  Restaurant(
    id: '2',
    name: 'Chicken',
    image: 'assets/chicken.jpg',
    description: 'Authentic Japanese sushi.',
    rating: 4.8,
  ),
];

class Order {
  final String id;
  final String date;
  final String status;
  final double totalAmount;
  final List<String> items;

  Order({
    required this.id,
    required this.date,
    required this.status,
    required this.totalAmount,
    required this.items,
  });
}
List<Order> sampleOrders = [
  Order(
    id: '12345',
    date: '2024-07-15',
    status: 'Delivered',
    totalAmount: 45.67,
    items: ['Pizza', 'Burger', 'Coke'],
  ),
  Order(
    id: '67890',
    date: '2024-07-20',
    status: 'Pending',
    totalAmount: 23.45,
    items: ['Chicken 65'],
  ),
];

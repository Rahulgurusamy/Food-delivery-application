import 'package:flutter/material.dart';
import 'package:food/models/order_model.dart';

class OrderHistoryPage extends StatelessWidget {
  final List<Order> orders;

  const OrderHistoryPage({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        backgroundColor: Colors.deepOrange,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  'Order ID: ${order.id}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date: ${order.date}', style: const TextStyle(fontSize: 16)),
                    Text('Status: ${order.status}', style: const TextStyle(fontSize: 16)),
                    Text('Total Amount: \$${order.totalAmount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text(
                      'Items: ${order.items.join(', ')}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.deepOrange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailPage(order: order),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class OrderDetailPage extends StatelessWidget {
  final Order order;

  const OrderDetailPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        backgroundColor: Colors.deepOrange,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: ${order.id}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Date: ${order.date}', style: const TextStyle(fontSize: 16)),
            Text('Status: ${order.status}', style: const TextStyle(fontSize: 16)),
            Text('Total Amount: \$${order.totalAmount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Divider(thickness: 2, color: Colors.deepOrange),
            const SizedBox(height: 16),
            Text(
              'Items',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: order.items.map((item) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 4),
                  leading: const Icon(Icons.shopping_bag, color: Colors.deepOrange),
                  title: Text(item, style: const TextStyle(fontSize: 16)),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

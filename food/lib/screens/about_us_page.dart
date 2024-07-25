import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildHeaderSection(),
              const SizedBox(height: 20),
              _buildSectionCard(
                title: 'Welcome to Food Delivery App!',
                content:
                    'Our mission is to provide you with the best food delivery service, bringing your favorite meals right to your doorstep.',
              ),
              const SizedBox(height: 20),
              _buildSectionCard(
                title: 'Our Story',
                content:
                    'Founded in 2024, Food Delivery App started with a simple idea: to make food delivery quick, easy, and enjoyable. We began with a small team of passionate individuals who wanted to make a difference in the food delivery industry. Today, we are proud to serve thousands of customers every day, offering a wide range of restaurants and cuisines to choose from.',
              ),
              const SizedBox(height: 20),
              _buildSectionCard(
                title: 'Our Values',
                content: 'Customer Satisfaction: We strive to provide the best service and ensure our customers are happy with their experience.\n\n'
                    'Quality: We partner with top restaurants to ensure that you receive high-quality meals every time.\n\n'
                    'Innovation: We are constantly looking for ways to improve and innovate our services to better serve you.',
              ),
              const SizedBox(height: 20),
              _buildSectionCard(
                title: 'Contact Us',
                content: 'We love to hear from our customers! If you have any questions, feedback, or suggestions, please feel free to reach out to us.',
                footer: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Email: support@fooddeliveryapp.com',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Phone: +1 (123) 456-7890',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/logo.jpg'),
        ),
        SizedBox(height: 10),
        Text(
          'Food Delivery App',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionCard({
    required String title,
    required String content,
    Widget? footer,
  }) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            if (footer != null) ...[
              const SizedBox(height: 20),
              footer,
            ],
          ],
        ),
      ),
    );
  }
}

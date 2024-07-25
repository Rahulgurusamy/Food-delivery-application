import 'package:flutter/material.dart';
import 'package:food/providers/feedback_provider.dart';
import 'package:provider/provider.dart';

class FeedbackListPage extends StatelessWidget {
  const FeedbackListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feedbackProvider = Provider.of<FeedbackProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback List'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: feedbackProvider.feedbacks.length,
        itemBuilder: (context, index) {
          final feedback = feedbackProvider.feedbacks[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                feedback['type']!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(feedback['text']!),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ContactSupportPage extends StatelessWidget {
  const ContactSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Support'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'If you need any help, feel free to contact our support team:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            const ContactSupportItem(
              icon: Icons.email,
              contactMethod: 'Email',
              contactDetail: 'support@foodapp.com',
            ),
            const ContactSupportItem(
              icon: Icons.phone,
              contactMethod: 'Phone',
              contactDetail: '+1 234 567 890',
            ),
            const ContactSupportItem(
              icon: Icons.chat,
              contactMethod: 'Live Chat',
              contactDetail: 'Available in the app',
            ),
          ],
        ),
      ),
    );
  }
}

class ContactSupportItem extends StatelessWidget {
  final IconData icon;
  final String contactMethod;
  final String contactDetail;

  const ContactSupportItem({
    super.key,
    required this.icon,
    required this.contactMethod,
    required this.contactDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepOrange),
        title: Text(
          contactMethod,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Text(contactDetail),
      ),
    );
  }
}

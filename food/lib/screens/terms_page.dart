import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
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
              _buildSectionTitle('Terms of Service', Icons.description),
              _buildSectionContent(
                'These Terms of Service ("Terms", "Terms of Service") govern your use of our mobile application ("Service") operated by [Company Name] ("us", "we", or "our").',
              ),
              _buildSectionTitle('Accounts', Icons.account_circle),
              _buildSectionContent(
                'When you create an account with us, you must provide us with information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service.',
              ),
              _buildSectionTitle('Intellectual Property', Icons.lock_open),
              _buildSectionContent(
                'The Service and its original content, features, and functionality are and will remain the exclusive property of [Company Name] and its licensors.',
              ),
              _buildSectionTitle('Termination', Icons.cancel),
              _buildSectionContent(
                'We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.',
              ),
              _buildSectionTitle('Governing Law', Icons.gavel),
              _buildSectionContent(
                'These Terms shall be governed and construed in accordance with the laws of [State/Country], without regard to its conflict of law provisions.',
              ),
              _buildSectionTitle('Changes', Icons.update),
              _buildSectionContent(
                'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will try to provide at least 30 days\' notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.',
              ),
              _buildSectionTitle('Contact Us', Icons.contact_mail),
              _buildSectionContent(
                'If you have any questions about these Terms, please contact us at:',
              ),
              _buildContentCard(
                'Email: support@fooddeliveryapp.com\n'
                'Phone: +1 (123) 456-7890',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.deepOrange, size: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildContentCard(String content) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

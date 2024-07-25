import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
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
              _buildSectionTitle('Privacy Policy', Icons.lock),
              _buildSectionContent(
                'This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our mobile application. Please read this privacy policy carefully. If you do not agree with the terms of this privacy policy, please do not access the application.',
              ),
              _buildSectionTitle('Collection of Information', Icons.collections),
              _buildSectionContent(
                'We may collect information about you in a variety of ways. The information we may collect via the Application includes:',
              ),
              _buildContentCard(
                'Personal Data: Personally identifiable information, such as your name, shipping address, email address, and telephone number, and demographic information, such as your age, gender, hometown, and interests that you voluntarily give to us when you register with the Application or when you choose to participate in various activities related to the Application.',
              ),
              _buildSectionTitle('Use of Information', Icons.privacy_tip),
              _buildSectionContent(
                'Having accurate information about you permits us to provide you with a smooth, efficient, and customized experience. Specifically, we may use information collected about you via the Application to:',
              ),
              _buildContentCard(
                '1. Create and manage your account.\n'
                '2. Email you regarding your account or order.\n'
                '3. Fulfill and manage purchases, orders, payments, and other transactions related to the Application.\n'
                '4. Generate a personal profile about you to make future visits to the Application more personalized.\n'
                '5. Increase the efficiency and operation of the Application.',
              ),
              _buildSectionTitle('Disclosure of Information', Icons.share),
              _buildSectionContent(
                'We may share information we have collected about you in certain situations. Your information may be disclosed as follows:',
              ),
              _buildContentCard(
                'By Law or to Protect Rights: If we believe the release of information about you is necessary to respond to legal process, to investigate or remedy potential violations of our policies, or to protect the rights, property, and safety of others, we may share your information as permitted or required by any applicable law, rule, or regulation.',
              ),
              _buildSectionTitle('Contact Us', Icons.contact_mail),
              _buildSectionContent(
                'If you have questions or comments about this Privacy Policy, please contact us at:',
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
        children: [
          Icon(icon, color: Colors.deepOrange, size: 30),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
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

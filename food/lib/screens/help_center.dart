import 'package:flutter/material.dart';
import 'package:food/screens/feedback_list_page.dart';
import 'package:food/screens/feedback_page.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        backgroundColor: Colors.deepOrange,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            HelpSection(
              title: 'FAQs',
              icon: Icons.question_answer,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FAQPage(),
                  ),
                );
              },
            ),
            HelpSection(
              title: 'Contact Support',
              icon: Icons.support,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactSupportPage(),
                  ),
                );
              },
            ),
            HelpSection(
              title: 'Guides & Tutorials',
              icon: Icons.school,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GuidesTutorialsPage(),
                  ),
                );
              },
            ),
            HelpSection(
              title: 'Feedback',
              icon: Icons.feedback,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeedbackPage(),
                  ),
                );
              },
            ),
            HelpSection(
              title: 'View Feedback',
              icon: Icons.visibility,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeedbackListPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HelpSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const HelpSection({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
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
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.deepOrange),
        onTap: onTap,
      ),
    );
  }
}

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: const [
            FAQItem(
              question: 'How do I reset my password?',
              answer: 'To reset your password, go to the Profile page and click on "Change Password". Follow the instructions to reset your password.',
            ),
            FAQItem(
              question: 'How can I contact support?',
              answer: 'You can contact support by going to the "Contact Support" section in the Help Center.',
            ),
            FAQItem(
              question: 'Where can I find the privacy policy?',
              answer: 'The privacy policy can be found in the "Privacy Policy" section of the app.',
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              answer,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}

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

class GuidesTutorialsPage extends StatelessWidget {
  const GuidesTutorialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guides & Tutorials'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            GuideItem(
              title: 'How to place an order',
              description: 'A step-by-step guide on how to place an order using our app.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GuideDetailPage(
                      title: 'How to place an order',
                      content: 'Detailed instructions on how to place an order...',
                    ),
                  ),
                );
              },
            ),
            GuideItem(
              title: 'Managing your account',
              description: 'Learn how to manage your account settings and preferences.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GuideDetailPage(
                      title: 'Managing your account',
                      content: 'Detailed instructions on managing your account...',
                    ),
                  ),
                );
              },
            ),
            GuideItem(
              title: 'Using the map feature',
              description: 'Discover how to use the map feature to find nearby restaurants.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GuideDetailPage(
                      title: 'Using the map feature',
                      content: 'Detailed instructions on using the map feature...',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GuideItem extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const GuideItem({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
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
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.deepOrange),
        onTap: onTap,
      ),
    );
  }
}

class GuideDetailPage extends StatelessWidget {
  final String title;
  final String content;

  const GuideDetailPage({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          content,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

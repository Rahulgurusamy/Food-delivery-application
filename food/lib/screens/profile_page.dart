import 'package:flutter/material.dart';
import 'package:food/models/order_model.dart';
import 'package:food/models/restaurant_model.dart';
import 'package:food/screens/about_us_page.dart';
import 'package:food/screens/change_password_page.dart';
import 'package:food/screens/fav_restaurant_page.dart';
import 'package:food/screens/feedback_page.dart';
import 'package:food/screens/help_center.dart';
import 'package:food/screens/notification_page.dart';
import 'package:food/screens/order_details_page.dart';
import 'package:food/screens/privacy_policy_page.dart';
import 'package:food/screens/terms_page.dart';
import 'package:food/screens/update_profile.dart';
import 'package:provider/provider.dart';
import 'package:food/providers/auth_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red[700]!, Colors.red[400]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildProfileCard(context, authProvider),
          const SizedBox(height: 20),
          _buildListTile(
            context: context,
            text: 'Order History',
            icon: Icons.history,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderHistoryPage(orders: sampleOrders),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildListTile(
            context: context,
            text: 'Favorite Restaurants',
            icon: Icons.favorite,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteRestaurantsPage(restaurants: favoriteRestaurants),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildListTile(
            context: context,
            text: 'Change Password',
            icon: Icons.lock,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildListTile(
            context: context,
            text: 'Notification Preferences',
            icon: Icons.notifications,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationPreferencesPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildListTile(
            context: context,
            text: 'Help Center',
            icon: Icons.help,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpCenterPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildListTile(
            context: context,
            text: 'Contact Support',
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
          const SizedBox(height: 20),
          _buildListTile(
            context: context,
            text: 'Feedback',
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
          const SizedBox(height: 20),
          _buildListTile(
            context: context,
            text: 'Privacy Policy',
            icon: Icons.privacy_tip,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildListTile(
            context: context,
            text: 'Terms of Service',
            icon: Icons.description,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TermsOfServicePage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildListTile(
            context: context,
            text: 'About Us',
            icon: Icons.info,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUsPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildListTile(
            context: context,
            text: 'Logout',
            icon: Icons.logout,
            colors: const [Colors.teal, Colors.greenAccent],
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        authProvider.logout();
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context, AuthProvider authProvider) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal[300]!, Colors.teal[600]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.teal[200],
                      backgroundImage: authProvider.profilePictureUrl != null && authProvider.profilePictureUrl!.isNotEmpty
                          ? NetworkImage(authProvider.profilePictureUrl!)
                          : null,
                      child: (authProvider.profilePictureUrl == null || authProvider.profilePictureUrl!.isEmpty)
                          ? const Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.teal,
                          size: 36,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Email: ${authProvider.userEmail}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Phone: ${authProvider.phoneNumber ?? 'Not provided'}',
                style: const TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 8),
              Text(
                'Address: ${authProvider.address ?? 'Not provided'}',
                style: const TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UpdateProfilePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.teal, 
                    backgroundColor: Colors.white, 
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: BorderSide(color: Colors.teal, width: 2),
                  ),
                  child: const Text(
                    'Update Profile',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required BuildContext context,
    required String text,
    required IconData icon,
    required VoidCallback onTap,
    List<Color> colors = const [Colors.grey, Colors.grey],
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        leading: Icon(icon, color: Colors.teal, size: 30),
        title: Text(text, style: const TextStyle(fontSize: 18)),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onTap: onTap,
      ),
    );
  }
}

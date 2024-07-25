import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food/providers/auth_provider.dart';

class NotificationPreferencesPage extends StatefulWidget {
  @override
  _NotificationPreferencesPageState createState() => _NotificationPreferencesPageState();
}

class _NotificationPreferencesPageState extends State<NotificationPreferencesPage> {
  bool orderUpdates = false;
  bool promotionalOffers = false;
  bool newRestaurants = false;

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    orderUpdates = authProvider.orderUpdates ?? false;
    promotionalOffers = authProvider.promotionalOffers ?? false;
    newRestaurants = authProvider.newRestaurants ?? false;
  }

  void _savePreferences() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.updateNotificationPreferences(
      orderUpdates: orderUpdates,
      promotionalOffers: promotionalOffers,
      newRestaurants: newRestaurants,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Notification preferences saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Preferences'),
        backgroundColor: Colors.deepOrange,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manage your notification preferences',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(height: 20),
            _buildPreferencesCard(),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _savePreferences,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Save Preferences'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreferencesCard() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSwitchTile(
              title: 'Order Updates',
              value: orderUpdates,
              onChanged: (bool value) {
                setState(() {
                  orderUpdates = value;
                });
              },
            ),
            _buildSwitchTile(
              title: 'Promotional Offers',
              value: promotionalOffers,
              onChanged: (bool value) {
                setState(() {
                  promotionalOffers = value;
                });
              },
            ),
            _buildSwitchTile(
              title: 'New Restaurants',
              value: newRestaurants,
              onChanged: (bool value) {
                setState(() {
                  newRestaurants = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.black,
            activeTrackColor: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}

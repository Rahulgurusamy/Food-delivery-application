import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _userEmail = '';
  String? _phoneNumber;
  String? _address;
  String? _city;
  String? _state;
  String _profilePictureUrl = '';
  bool? orderUpdates;
  bool? promotionalOffers;
  bool? newRestaurants;

  String get userEmail => _userEmail;
  String? get phoneNumber => _phoneNumber;
  String? get address => _address;
  String? get city => _city;
  String? get state => _state;
  String get profilePictureUrl => _profilePictureUrl;

  void login(String email, String password) {
    _userEmail = email;
    notifyListeners();
  }

  void signup(String email, String password, String phoneNumber) {
    _userEmail = email;
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void logout() {
    _userEmail = '';
    _phoneNumber = null;
    _address = null;
    _city = null;
    _state = null;
    notifyListeners();
  }

  void updateProfile({
    required String email,
    required String phoneNumber,
    required String address,
    required String city,
    required String state,
  }) {
    _userEmail = email;
    _phoneNumber = phoneNumber;
    _address = address;
    _city = city;
    _state = state;
    notifyListeners();
  }

  Future<bool> changePassword(String currentPassword, String newPassword) async {
    await Future.delayed(const Duration(seconds: 2));
    return currentPassword == 'password';
  }

  void updateProfilePicture(String url) {
    _profilePictureUrl = url;
    notifyListeners();
  }

  void updateNotificationPreferences({
    required bool orderUpdates,
    required bool promotionalOffers,
    required bool newRestaurants,
  }) {
    this.orderUpdates = orderUpdates;
    this.promotionalOffers = promotionalOffers;
    this.newRestaurants = newRestaurants;
    notifyListeners();
  }
}

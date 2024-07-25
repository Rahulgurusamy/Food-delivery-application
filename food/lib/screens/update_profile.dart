import 'package:flutter/material.dart';
import 'package:food/providers/auth_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late GoogleMapController mapController;
  LatLng _currentPosition = const LatLng(0, 0);
  bool _isMapReady = false;

  String? _email;
  String? _phoneNumber;
  String? _address;
  String? _city;
  String? _state;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _isMapReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField(
                          label: 'Email',
                          initialValue: authProvider.userEmail,
                          onSaved: (value) => _email = value,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          label: 'Phone Number',
                          initialValue: authProvider.phoneNumber ?? '',
                          onSaved: (value) => _phoneNumber = value,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          label: 'Address',
                          initialValue: authProvider.address ?? '',
                          onSaved: (value) => _address = value,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          label: 'City',
                          initialValue: authProvider.city ?? '',
                          onSaved: (value) => _city = value,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          label: 'State',
                          initialValue: authProvider.state ?? '',
                          onSaved: (value) => _state = value,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 300,
                          child: _isMapReady
                              ? GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: _currentPosition,
                                    zoom: 14.0,
                                  ),
                                  onMapCreated: (controller) {
                                    setState(() {
                                      mapController = controller;
                                    });
                                  },
                                  markers: {
                                    Marker(
                                      markerId: const MarkerId('currentLocation'),
                                      position: _currentPosition,
                                      draggable: true,
                                      onDragEnd: (newPosition) {
                                        setState(() {
                                          _currentPosition = newPosition;
                                        });
                                      },
                                    ),
                                  },
                                )
                              : const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                authProvider.updateProfile(
                                  email: _email ?? '',
                                  phoneNumber: _phoneNumber ?? '',
                                  address: _address ?? '',
                                  city: _city ?? '',
                                  state: _state ?? '',
                                );
                                Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Save Changes',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
 

  Widget _buildTextField({
    required String label,
    String initialValue = '',
    required FormFieldSetter<String> onSaved,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal, width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmNewPassword = true;
  String? _currentPassword;
  String? _newPassword;
  String? _confirmNewPassword;
  String _errorMessage = '';
  String _matchMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.025)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  prefixIcon: Icon(Icons.lock), // Add a lock icon
                  suffixIcon: IconButton(
                    icon: Icon(_obscureCurrentPassword? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscureCurrentPassword =!_obscureCurrentPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Add a border radius
                  ),
                  filled: true, // Add a filled background
                  fillColor: Colors.white, // Set the background color
                ),
                obscureText: _obscureCurrentPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your current password';
                  }
                  return null;
                },
                onSaved: (value) => _currentPassword = value,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'New Password',
                  prefixIcon: Icon(Icons.lock), // Add a lock icon
                  suffixIcon: IconButton(
                    icon: Icon(_obscureNewPassword? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscureNewPassword =!_obscureNewPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Add a border radius
                  ),
                  filled: true, // Add a filled background
                  fillColor: Colors.white, // Set the background color
                ),
                obscureText: _obscureNewPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a new password';
                  } else if (!_validatePassword(value)) {
                    return _errorMessage;
                  }
                  return null;
                },
                onSaved: (value) => _newPassword = value,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm New Password',
                  prefixIcon: Icon(Icons.lock), // Add a lock icon
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirmNewPassword? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmNewPassword =!_obscureConfirmNewPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Add a border radius
                  ),
                  filled: true, // Add a filled background
                  fillColor: Colors.white, // Set the background color
                ),
                obscureText: _obscureConfirmNewPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your new password';
                  }
                  return null;
                },
                onSaved: (value) => _confirmNewPassword = value,
              ),
              Text(
                _matchMessage,
                style: TextStyle(
                  color: _matchMessage.startsWith('Passwords are match')? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate()?? false) {
                    _formKey.currentState?.save();
                    if (_newPassword != _confirmNewPassword) {
                      setState(() {
                        _matchMessage = 'Passwords do not match';
                      });
                    } else {
                      setState(() {
                        _matchMessage = 'Passwords are match';
                      });
                      // Send the new password to the backend API
                      try {
                        final url = 'https://your-backend-api.com/change-password';
                        final response = await http.post(
                          Uri.parse(url),
                          headers: {
                            'Content-Type': 'application/json',
                          },
                          body: jsonEncode({
                            'current_password': _currentPassword,
                            'new_password': _newPassword,

                          }),
                        );

                        if (response.statusCode == 200) {
                          // Password changed successfully
                          print('Password changed successfully');
                          // You can also show a success message to the user
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Password changed successfully'),
                            ),
                          );
                        } else {
                          // Handle error
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error: ${response.statusCode}'),
                            ),
                          );
                        }
                      } catch (e) {
                        // Handle error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error: $e'),
                          ),
                        );
                      }
                    }
                  }
                },
                child: Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validatePassword(String password) {
    _errorMessage = '';
    if (password.length < 7) {
      _errorMessage = 'Password must be at least 7 characters long';
      return false;
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      _errorMessage = 'Password must contain at least one lowercase letter';
      return false;
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      _errorMessage = 'Password must contain at least one uppercase letter';
      return false;
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      _errorMessage = 'Password must contain at least one digit';
      return false;
    }
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_-]'))) {
      _errorMessage = 'Password must contain at least one special character';
      return false;
    }
    return true;
  }
}
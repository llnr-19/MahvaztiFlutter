import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/profile_tile.dart';
import 'change_username_screen.dart';
import 'change_email_screen.dart';
import 'change_password_screen.dart';
import 'change_phone_screen.dart'; // Import the change_phone_screen.dart file

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> with WidgetsBindingObserver {
  String _username = '';
  String _phoneNumber = '';
  String _email = '';
  String _firstname = '';
  String _lastname = '';
  Future<void> _fetchUserData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/user'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {

        _phoneNumber = jsonData['phone'];
        _email = jsonData['email'];
        _firstname = jsonData['firstname'];
        _lastname = jsonData['lastname'];
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.025)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Expanded(
              child: ListView(
                children: [
                  profile_tile(context: context, icon: Icons.abc_rounded, title: 'Username', onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeUsernameScreen(initialFirstname: _firstname, initialLastname: _lastname))).then((value) {
                      if (value!= null) {
                        setState(() {
                          _firstname = value['firstname']; // Update the _firstname variable
                          _lastname = value['lastname']; // Update the _lastname variable
                        });
                      }
                    });
                  }),
                  // In MyAccountScreen
                  profile_tile(
                   context: context,
                    icon: Icons.phone,
                    title: 'phone',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePhoneScreen(
                            initialPhoneNumber: _phoneNumber,
                          ),
                        ),
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            _phoneNumber = value; // Update the _phoneNumber variable
                          });
                        }
                      });
                    },
                  ),
                  profile_tile(context: context, icon: Icons.mail, title: 'Email', onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeEmailScreen(initialEmail: _email))).then((value) {
                      if (value != null) {
                        setState(() {
                          _email = value; // Update the _email variable with the returned value
                        });
                      }
                    });
                  }),
                  profile_tile(context: context, icon: Icons.lock, title: 'change password', onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/profile_tile.dart';
import 'change_username_screen.dart';
import 'change_email_screen.dart';
import 'change_password_screen.dart';
import 'change_phone_screen.dart'; // Import the change_phone_screen.dart file

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> with WidgetsBindingObserver {
  String _username = '';
  String _phoneNumber = '';
  String _email = '';
  String _firstname = '';
  String _lastname = '';

  Future<void> _fetchUserData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/user'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        _phoneNumber = jsonData['phone'];
        _email = jsonData['email'];
        _firstname = jsonData['firstname'];
        _lastname = jsonData['lastname'];
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Call the _fetchUserData function here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.025)),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  Expanded(
                    child: ListView(
                      children: [
                        profile_tile(context: context, icon: Icons.abc_rounded, title: 'Username', onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeUsernameScreen(initialFirstname: _firstname, initialLastname: _lastname))).then((value) {
                            if (value!= null) {
                              setState(() {
                                _firstname = value['firstname']; // Update the _firstname variable
                                _lastname = value['lastname']; // Update the _lastname variable
                              });
                            }
                          });
                        }),
                        // In MyAccountScreen
                        profile_tile(
                          context: context,
                          icon: Icons.phone,
                          title: _phoneNumber, // Display the phone number
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePhoneScreen(
                                  initialPhoneNumber: _phoneNumber,
                                ),
                              ),
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  _phoneNumber = value; // Update the _phoneNumber variable
                                });
                              }
                            });
                          },
                        ),
                        profile_tile(context: context, icon: Icons.mail, title: _email, onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeEmailScreen(initialEmail: _email))).then((value) {
                            if (value != null) {
                              setState(() {
                                _email = value; // Update the _email variable with the returned value
                              });
                            }
                          });
                        }),
                        profile_tile(context: context, icon: Icons.lock, title: 'change password', onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text('Error: ${snapshot.error}');
          }
        },
      ),
    );
  }
}

 */
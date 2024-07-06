// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../components/profile_tile.dart';
// import 'change_username_screen.dart';
// import 'change_email_screen.dart';
// import 'change_password_screen.dart';
// import 'change_phone_screen.dart'; // Import the change_phone_screen.dart file
//
// class MyAccountScreen extends StatefulWidget {
//   const MyAccountScreen({super.key});
//
//   @override
//   _MyAccountScreenState createState() => _MyAccountScreenState();
// }
//
// class _MyAccountScreenState extends State<MyAccountScreen> with WidgetsBindingObserver {
//   String _username = '';
//   String _phoneNumber = '';
//   String _email = '';
//   String _firstname = '';
//   String _lastname = '';
//   Future<void> _fetchUserData() async {
//     final response = await http.get(Uri.parse('https://mahvazti.up.railway.app/api/customer/get-cust?custId=cust-0000024'));
//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       setState(() {
//         _username = _firstname + _lastname;
//         _phoneNumber = jsonData['phone'];
//         _email = jsonData['email'];
//       });
//       print(jsonData);
//     } else {
//       print('Error: ${response.statusCode}');
//     }
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _fetchUserData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Account',
//             style: TextStyle(
//                 fontSize: MediaQuery.of(context).size.height * 0.025)),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // SizedBox(height: MediaQuery.of(context).size.height * 0.025),
//             Expanded(
//               child: ListView(
//                 children: [
//                   profile_tile(context: context, icon: Icons.abc_rounded, title: 'Username', onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeUsernameScreen(initialFirstname: _firstname, initialLastname: _lastname))).then((value) {
//                       if (value!= null) {
//                         setState(() {
//                           _username = value['firstname'] + value['lastname']; // Update the _firstname variable
//
//                         });
//                       }
//                     });
//                   }),
//                   // In MyAccountScreen
//                   profile_tile(
//                    context: context,
//                     icon: Icons.phone,
//                     title: 'phone',
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ChangePhoneScreen(
//                             initialPhoneNumber: _phoneNumber,
//                           ),
//                         ),
//                       ).then((value) {
//                         if (value != null) {
//                           setState(() {
//                             _phoneNumber = value; // Update the _phoneNumber variable
//                           });
//                         }
//                       });
//                     },
//                   ),
//                   profile_tile(context: context, icon: Icons.mail, title: 'Email', onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeEmailScreen(initialEmail: _email))).then((value) {
//                       if (value != null) {
//                         setState(() {
//                           _email = value; // Update the _email variable with the returned value
//                         });
//                       }
//                     });
//                   }),
//                   profile_tile(context: context, icon: Icons.lock, title: 'change password', onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
//                   }),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/profile_tile.dart';
import 'change_username_screen.dart';
import 'change_email_screen.dart';
import 'change_password_screen.dart';
import 'change_phone_screen.dart';

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> with WidgetsBindingObserver {
  String _phoneNumber = '';
  String _email = '';
  String _firstname = '';
  String _lastname = '';


  Future<void> _fetchUserData() async {
    final token = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhc2hyYWZAZ21haWwuY29tIiwiaWF0IjoxNzIwMjk0MzUzLCJleHAiOjE3MjAyOTUyNTN9.XhAvksMsnH5juHQGz1afUy90l-YR69snod9YD70I8FM';
    final response = await http.get(
      Uri.parse('https://calm-nourishment-production.up.railway.app/api/customer/get-cust'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        _phoneNumber = jsonData['custPhone'];
        _email = jsonData['custEmail'];
        _firstname = jsonData['custFname'];
        _lastname = jsonData['custLname'];
      });
    } else {
      print('Error message: ${response.body}');
      print('Error: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData();
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
        title: Text('My Account', style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025)),
        centerTitle: true,
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (_phoneNumber.isEmpty && _email.isEmpty && _firstname.isEmpty && _lastname.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                profile_tile(
                  context: context,
                  icon: Icons.person,
                  title: '$_firstname $_lastname',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeUsernameScreen(
                          initialFirstname: _firstname,
                          initialLastname: _lastname,
                        ),
                      ),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          _firstname = value['firstname'];
                          _lastname = value['lastname'];
                        });
                      }
                    });
                  },
                ),
                profile_tile(
                  context: context,
                  icon: Icons.phone,
                  title: '$_phoneNumber',
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
                          _phoneNumber = value;
                        });
                      }
                    });
                  },
                ),
                profile_tile(
                  context: context,
                  icon: Icons.mail,
                  title: '$_email',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeEmailScreen(
                          initialEmail: _email,
                        ),
                      ),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          _email = value;
                        });
                      }
                    });
                  },
                ),
                profile_tile(
                  context: context,
                  icon: Icons.lock,
                  title: 'Change Password',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


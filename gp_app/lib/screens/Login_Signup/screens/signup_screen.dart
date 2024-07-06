// import 'dart:convert';
//
// import 'package:encrypt/encrypt.dart' as encrypt;
// import 'package:flutter/material.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:crypto/crypto.dart';
// import 'package:gp_app/screens/Login_Signup/screens/signin_screen.dart';
// import 'package:gp_app/screens/Login_Signup/themes/theme.dart';
// import 'package:gp_app/screens/Login_Signup/widgets/custom_scaffold.dart';
// import 'package:icons_plus/icons_plus.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formSignupKey = GlobalKey<FormState>();
//   final _fNameController = TextEditingController();
//   final _lNameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isObscure = true;
//   bool _isValid = false;
//   String _errorMessage = '';
//   void _toggleObscure() {
//     setState(() {
//       _isObscure = !_isObscure;
//     });
//   }
//
//   bool _validatePassword(String password) {
//     // Reset error message
//     _errorMessage = '';
//     // Password length greater than 6
//     if (password.length < 6) {
//       _errorMessage += 'Password must be longer than 6 characters.\n';
//     }
//     // Contains at least one uppercase letter
//     if (!password.contains(RegExp(r'[A-Z]'))) {
//       _errorMessage += '• Uppercase letter is missing.\n';
//     }
//     // Contains at least one lowercase letter
//     if (!password.contains(RegExp(r'[a-z]'))) {
//       _errorMessage += '• Lowercase letter is missing.\n';
//     }
//     // Contains at least one digit
//     if (!password.contains(RegExp(r'[0-9]'))) {
//       _errorMessage += '• Number is missing.\n';
//     }
//     // Contains at least one special character
//     if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
//       _errorMessage += '• Special character is missing.\n';
//     }
//     // If there are no error messages, the password is valid
//     return _errorMessage.isEmpty;
//   }
//
//   bool agreePersonalData = true;
//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       child: Column(
//         children: [
//
//           Expanded(
//             // flex: 35,
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40.0),
//                   topRight: Radius.circular(40.0),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 // get started form
//                 child: Form(
//                   key: _formSignupKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // get started text
//                       Text(
//                         'Get Started',
//                         style: TextStyle(
//                           fontSize: 30.0,
//                           fontWeight: FontWeight.w900,
//                           color: lightColorScheme.primary,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40.0,
//                       ),
//                       // first name and last name
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 20.0),
//                               child: TextFormField(
//                                 controller: _fNameController,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your first name';
//                                   }
//                                   if (value.length >= 30) {
//                                     return 'input is Too Large';
//                                   }
//                                   if (!RegExp(r"^[a-zA-Z ,.'-]+$")
//                                       .hasMatch(value)) {
//                                     return 'Please enter a valid name.';
//                                   }
//                                   return null;
//                                 },
//                                 decoration: InputDecoration(
//                                   label: const Text('First Name'),
//                                   hintText: 'Enter First Name',
//                                   hintStyle: const TextStyle(
//                                     color: Colors.black26,
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: Colors
//                                           .black12, // Default border color
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: Colors
//                                           .black12, // Default border color
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                               ),
//                               //const SizedBox(
//                               // height: 25.0,
//                               //),
//                             ),
//                           ),
//                           const SizedBox(width: 10.0),
//                           Expanded(
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 20.0),
//                               child: TextFormField(
//                                 controller: _lNameController,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your last name';
//                                   } else if (!RegExp(r'^[a-zA-Z0-9_-]{3,16}$')
//                                       .hasMatch(value)) {
//                                     return 'Please enter your name.';
//                                   }
//                                   return null;
//                                 },
//                                 decoration: InputDecoration(
//                                   label: const Text('Last Name'),
//                                   hintText: 'Enter Last Name',
//                                   hintStyle: const TextStyle(
//                                     color: Colors.black26,
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: Colors
//                                           .black12, // Default border color
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: Colors
//                                           .black12, // Default border color
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                               ),
//                               //const SizedBox(
//                               //  height: 25.0,
//                               //),
//                             ),
//                           ),
//                         ],
//                       ),
//                       // email
//                       TextFormField(
//                         controller: _emailController, // Use the controller
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your phone number.';
//                           } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
//                             return 'Please enter a valid phone number.';
//                           }
//                           return null; // Valid email
//                         },
//                         decoration: InputDecoration(
//                           label: const Text('Phone'),
//                           hintText: 'Enter Phone Number',
//                           hintStyle: const TextStyle(
//                             color: Colors.black26,
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12, // Default border color
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12, // Default border color
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       TextFormField(
//                         controller: _phoneController, // Use the controller
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email address.';
//                           } else if (!RegExp(
//                               r'^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,63})$')
//                               .hasMatch(value)) {
//                             return 'Please enter a valid email address.';
//                           }
//                           return null; // Valid email
//                         },
//                         decoration: InputDecoration(
//                           label: const Text('Email'),
//                           hintText: 'Enter Email',
//                           hintStyle: const TextStyle(
//                             color: Colors.black26,
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12, // Default border color
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12, // Default border color
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       // password
//                       TextFormField(
//                         obscureText: _isObscure,
//                         obscuringCharacter: '*',
//                         controller: _passwordController, // Use the controller
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter password.';
//                           }
//                           return null; // Valid password
//                         },
//                         decoration: InputDecoration(
//                           label: const Text('Password'),
//                           hintText: 'Enter Password',
//                           hintStyle: const TextStyle(
//                             color: Colors.black26,
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12, // Default border color
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12, // Default border color
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           suffixIcon: IconButton(
//                             icon: Icon(_isObscure
//                                 ? Icons.visibility_off
//                                 : Icons.visibility),
//                             onPressed: _toggleObscure,
//                           ),
//                         ),
//                       ),
//                       _isValid
//                           ? const Text(
//                               '',
//                               style: TextStyle(color: Colors.green),
//                             )
//                           : Text(
//                               ''
//                               '• $_errorMessage',
//                               style: const TextStyle(color: Colors.red),
//                             ),
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: agreePersonalData,
//                             onChanged: (bool? value) {
//                               setState(() {
//                                 agreePersonalData = value!;
//                               });
//                             },
//                             activeColor: lightColorScheme.primary,
//                           ),
//                           const Text(
//                             'I agree to the processing of ',
//                             style: TextStyle(
//                               color: Colors.black45,
//                             ),
//                           ),
//                           Text(
//                             'Personal data',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: lightColorScheme.primary,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       // signup button
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             if (_formSignupKey.currentState!.validate() &&
//                                 agreePersonalData) {
//                               String hashPassword(String password) {
//                                 var bytes = utf8.encode(password);
//                                 var digest = sha256.convert(bytes);
//                                 return digest.toString();
//                               }
//                               String password = _passwordController.text;
//                               String hashedPassword = hashPassword(password);
//                               /*Future<void> _sendPasswordToServer(String hashedPassword) async {
//                                 // Replace with your actual server interaction code
//                                 // Ensure secure communication (HTTPS)
//                                 final response = await http.post(
//                                   Uri.parse('https://your-server.com/api/register'),
//                                   body: {'hashedPassword': hashedPassword},
//                                 );
//
//                                 if (response.statusCode == 200) {
//                                   // Handle successful registration/login
//                                 } else {
//                                   // Handle error
//                                 }
//                               }*/
//                               final Map<String, dynamic> userDetails = {
//                                 'fname': _fNameController.text,
//                                 'lname': _lNameController.text,
//                                 'phone': _phoneController.text,
//                                 'email': _emailController.text,
//                                 'password': hashedPassword,
//                               };
//                               String jsonDetails = jsonEncode(userDetails);
//                               print(jsonDetails);
//                               /*final key = encrypt.Key.fromUtf8(
//                                   'A1B2C3D4E5F6G7H8I9J0K1L2M3N4O5P6');
//                               final iv = encrypt.IV.fromLength(16);
//                               final encrypter =
//                                   encrypt.Encrypter(encrypt.AES(key));
//                               final encrypted =
//                                   encrypter.encrypt(jsonDetails, iv: iv);
//                               final encryptedBase64 = encrypted.base64;
//                               final ivBase64 = iv.base64;*/
//
//                               final response = await http.post(
//                                 Uri.parse('https://easygoing-magic-production.up.railway.app/api/auth/register'),
//                                 headers: <String, String>{
//                                   'Content-Type': 'application/json; charset=UTF-8',
//                                   //referer - token
//                                 },
//                                 body:  jsonEncode({
//                                   jsonDetails,
//                                   // 'data': encryptedBase64,
//                                   // 'iv': iv.base64, // Send the IV along with the encrypted data
//                                 }),
//                               );
//                               if (response.statusCode == 200) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(content: Text('User Signed Up successfully')),
//                                 );
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (e) => const SignInScreen(),
//                                   ),
//                                 ); // Navigate back with updated details
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(content: Text('Failed to Signed Up User')),
//                                 );
//                               }
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Processing Data'),
//                                 ),
//                               );
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(
//                               //     builder: (e) => const SignInScreen(),
//                               //   ),
//                               // );
//                             } else if (!agreePersonalData) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text(
//                                         'Please agree to the processing of personal data')),
//                               );
//                             }
//                             setState(() {
//                               _isValid =
//                                   _validatePassword(_passwordController.text);
//                             });
//                           },
//                           child: const Text('Sign up'),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30.0,
//                       ),
//                       // already have an account
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             'Already have an account? ',
//                             style: TextStyle(
//                               color: Colors.black45,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (e) => const SignInScreen(),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Sign in',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: lightColorScheme.primary,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';

//import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:gp_app/screens/Login_Signup/screens/signin_screen.dart';
import 'package:gp_app/screens/Login_Signup/themes/theme.dart';
import 'package:gp_app/screens/Login_Signup/widgets/custom_scaffold.dart';
//import 'package:icons_plus/icons_plus.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isValid = false;
  String _errorMessage = '';
  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  bool _validatePassword(String password) {
    // Reset error message
    _errorMessage = '';
    // Password length greater than 6
    if (password.length < 6) {
      _errorMessage += 'Password must be longer than 6 characters.\n';
    }
    // Contains at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      _errorMessage += '• Uppercase letter is missing.\n';
    }
    // Contains at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      _errorMessage += '• Lowercase letter is missing.\n';
    }
    // Contains at least one digit
    if (!password.contains(RegExp(r'[0-9]'))) {
      _errorMessage += '• Number is missing.\n';
    }
    // Contains at least one special character
    if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      _errorMessage += '• Special character is missing.\n';
    }
    // If there are no error messages, the password is valid
    return _errorMessage.isEmpty;
  }
  String hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> _signUp() async {
    if (_formSignupKey.currentState!.validate()) {
      //String email = _emailController.text;
      String password = _passwordController.text;
      String hashedPassword = hashPassword(password);

      final Map<String, dynamic> userDetails = {
        'fName': _fNameController.text,
        'lName': _lNameController.text,
        'phone': _phoneController.text,
        'email': _emailController.text,
        'password': password,
      };

      final Uri url = Uri.parse('https://mahvazti.up.railway.app/api/auth/register'); // Replace with your backend URL

      try {
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            //'token': 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ5c2ZAZ21haWwuY29tIiwiaWF0IjoxNzIwMjM4NTQ3LCJleHAiOjE3MjAyMzk0NDd9.fmZiJEwx7tP0u5mV16REMm06hNulNp_obQHeXOyM8ZA'
          },
          body: jsonEncode(userDetails),
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          String token = responseData['token'];
          print(token);
          // Successful signin, navigate to the next screen
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (e) => SignInScreen(),
            ),
                (Route<dynamic> route) => false,
          );
        } else {
          // Signin failed, show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Signin failed: ${response.statusCode}')),
          );
        }
      } catch (e) {
        // Network error, show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Network error: $e')),
        );
      }
    }
  }

  bool agreePersonalData = true;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Expanded(
            // flex: 35,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                // get started form
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // get started text
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      // first name and last name
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 20.0),
                              child: TextFormField(
                                controller: _fNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  if (value.length >= 30) {
                                    return 'input is Too Large';
                                  }
                                  if (!RegExp(r"^[a-zA-Z ,.'-]+$")
                                      .hasMatch(value)) {
                                    return 'Please enter a valid name.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: const Text('First Name'),
                                  hintText: 'Enter First Name',
                                  hintStyle: const TextStyle(
                                    color: Colors.black26,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .black12, // Default border color
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .black12, // Default border color
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              //const SizedBox(
                              // height: 25.0,
                              //),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 20.0),
                              child: TextFormField(
                                controller: _lNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your last name';
                                  } else if (!RegExp(r'^[a-zA-Z0-9_-]{3,16}$')
                                      .hasMatch(value)) {
                                    return 'Please enter your name.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: const Text('Last Name'),
                                  hintText: 'Enter Last Name',
                                  hintStyle: const TextStyle(
                                    color: Colors.black26,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .black12, // Default border color
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .black12, // Default border color
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              //const SizedBox(
                              //  height: 25.0,
                              //),
                            ),
                          ),
                        ],
                      ),
                      // email
                      TextFormField(
                        controller: _phoneController, // Use the controller
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number.';
                          } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                            return 'Please enter a valid phone number.';
                          }
                          return null; // Valid email
                        },
                        decoration: InputDecoration(
                          label: const Text('Phone'),
                          hintText: 'Enter Phone Number',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: _emailController, // Use the controller
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address.';
                          } else if (!RegExp(
                              r'^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,63})$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address.';
                          }
                          return null; // Valid email
                        },
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // password
                      TextFormField(
                        obscureText: _isObscure,
                        obscuringCharacter: '*',
                        controller: _passwordController, // Use the controller
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password.';
                          }
                          return null; // Valid password
                        },
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: _toggleObscure,
                          ),
                        ),
                      ),
                      _isValid
                          ? const Text(
                        '',
                        style: TextStyle(color: Colors.green),
                      )
                          : Text(
                        ''
                            '• $_errorMessage',
                        style: const TextStyle(color: Colors.red),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (bool? value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                            activeColor: lightColorScheme.primary,
                          ),
                          const Text(
                            'I agree to the processing of ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            'Personal data',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: lightColorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // signup button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formSignupKey.currentState!.validate() && agreePersonalData) {
                              setState(() {
                                _isValid =
                                    _validatePassword(_passwordController.text);
                              });
                              await _signUp();
                            } else if (!agreePersonalData) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please agree to the processing of personal data')),
                              );
                            }
                          },
                          child: const Text('Sign up'),
                        ),
                      ),
                      // already have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignInScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
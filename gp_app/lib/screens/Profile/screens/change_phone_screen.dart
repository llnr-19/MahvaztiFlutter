import 'package:flutter/material.dart';
import 'my_account_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change Phone Number',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAccountScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyAccountScreen(); // Use MyAccountScreen here
  }
}

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  CustomTextField({
    required this.hintText,
    required this.labelText,
    required this.keyboardType,
    this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(fontWeight: FontWeight.bold), // Make label text bold
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: '\n${widget.hintText}',
        prefixIcon: Icon(Icons.phone), // Add a phone icon
        suffixIcon: IconButton(
          icon: Icon(Icons.create),
          onPressed: () {
            widget.controller?.clear();
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Add a border radius
          borderSide: BorderSide(color: Colors.grey), // Add a grey border color
        ),
        filled: true, // Add a filled background
        fillColor: Colors.white, // Set the background color
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your phone number';
        } else if (value.length > 11) {
          return 'Phone number cannot be more than 11 digits';
        } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
          return 'Phone number can only contain digits. No characters or special characters allowed';
        }
        return null;
      },
      keyboardType: widget.keyboardType,
    );
  }
}
class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color color;

  CustomButton({
    required this.onTap,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
    );
  }
}

class ChangePhoneScreen extends StatefulWidget {
  final String initialPhoneNumber;

  ChangePhoneScreen({required this.initialPhoneNumber});

  @override
  _ChangePhoneScreenStateState createState() => _ChangePhoneScreenStateState();
}

class _ChangePhoneScreenStateState extends State<ChangePhoneScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize the text field with the initial phone number
    _controller.text = widget.initialPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Number',
            style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    CustomTextField(
                      hintText: 'Enter new phone number',
                      labelText: 'Phone Number:',
                      keyboardType: TextInputType.phone,
                      controller: _controller,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save(); // Save the form data
                              try {
                                setState(() {
                                  _isLoading = true;
                                });
                                // Send the updated phone number to the backend
                                final updatedPhoneNumber = _controller.text;
                                final url = 'https://your-backend-api.com/update-phone-number';
                                final response = await http.post(Uri.parse(url), headers: {
                                  'Content-Type': 'application/json',
                                }, body: jsonEncode({
                                  'phone_number': updatedPhoneNumber,
                                  'email': null,
                                  'firstname': null,
                                  'lastname': null,
                                }));

                                if (response.statusCode == 200) {
                                  // Update the phone number variable
                                  Navigator.pop(context, updatedPhoneNumber);
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
                              } finally {
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            }
                          },
                          text: _isLoading ? 'Loading...' : 'Save',
                          color: Colors.red,
                        ),
                        CustomButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
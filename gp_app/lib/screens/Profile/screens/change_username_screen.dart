import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class CustomTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController? controller; // Add this line

  CustomTextField({
    required this.hintText,
    required this.labelText,
    required this.keyboardType,
    this.controller, // Add this line
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // Use the controller here
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        // Make label text bold
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: '\n${widget.hintText}',
        prefixIcon: Icon(Icons.person),
        // Add a username icon
        suffixIcon: IconButton(
          icon: Icon(Icons.create),
          onPressed: () {
            widget.controller?.clear(); // Use the controller here
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Add a border radius
          borderSide: BorderSide(color: Colors.grey),
        ),
        filled: true,
        // Add a filled background
        fillColor: Colors.white, // Set the background color
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        } else if (value.length < 3) {
          return 'Name should be at least 3 characters';
        } else if (value.length > 15) {
          return 'Name should not be more than 15 characters';
        } else if (!RegExp(r"^[a-zA-Z,.'-]+$").hasMatch(value)) {
          return 'Invalid characters';
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

class ChangeUsernameScreen extends StatefulWidget {
  final String initialFirstname;
  final String initialLastname;

  ChangeUsernameScreen({required this.initialFirstname, required this.initialLastname});

  @override
  _ChangeUsernameScreenState createState() => _ChangeUsernameScreenState();
}

class _ChangeUsernameScreenState extends State<ChangeUsernameScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _firstnameController.text = widget.initialFirstname;
    _lastnameController.text = widget.initialLastname;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Username',
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
                      hintText: 'Enter new firstname',
                      labelText: 'Firstname:',
                      keyboardType: TextInputType.text,
                      controller: _firstnameController,
                    ),
                    SizedBox(height: 20), // Add this line to add space between text fields
                    CustomTextField(
                      hintText: 'Enter new lastname',
                      labelText: 'Lastname:',
                      keyboardType: TextInputType.text,
                      controller: _lastnameController,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save(); // Save the form data
                              final updatedFirstname = _firstnameController.text;
                              final updatedLastname = _lastnameController.text;
                              try {
                                setState(() {
                                  _isLoading = true;
                                });
                                final url = 'https://your-backend-api.com/update-username';
                                final response = await http.post(Uri.parse(url), headers: {
                                  'Content-Type': 'application/json',
                                }, body: jsonEncode({
                                  'firstname': updatedFirstname,
                                  'lastname': updatedLastname,
                                  "phone_number": null,
                                  "email": null,
                                }));

                                if (response.statusCode == 200) {
                                  // Update the username variable
                                  Navigator.pop(context, {'firstname': updatedFirstname, 'lastname': updatedLastname});
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
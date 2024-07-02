import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChangeEmailScreen extends StatefulWidget {
  final String initialEmail;

  ChangeEmailScreen({required this.initialEmail});

  @override
  _ChangeEmailScreenState createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialEmail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Email',
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
                    TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Email:',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: '\nEnter new email',
                        prefixIcon: Icon(Icons.email),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.create),
                          onPressed: () {
                            _controller.clear();
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your email';
                        } else if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$', caseSensitive: false).hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save(); // Save the form data
                              try {
                                setState(() {
                                  _isLoading = true;
                                });
                                final url = 'https://your-backend-api.com/update-email';
                                final newEmail = _controller.text;
                                // Send request to backend API to update email address
                                final response = await http.post(
                                  Uri.parse(url),
                                  headers: {
                                    'Content-Type': 'application/json',
                                  },
                                  body: jsonEncode({
                                    'email': newEmail,
                                    'firstname': null,
                                    'lastname': null,
                                    'phone': null,
                                  }),
                                );

                                if (response.statusCode == 200) {
                                  // Update successful, navigate back to MyAccountScreen
                                  Navigator.pop(context, newEmail);
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
                          child: _isLoading
                              ? CircularProgressIndicator()
                              : Text('Save'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey),
                          ),
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
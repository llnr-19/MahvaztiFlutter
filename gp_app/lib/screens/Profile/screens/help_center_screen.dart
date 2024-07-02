import 'package:flutter/material.dart';
import '../components/custom_button.dart';

class HelpCenterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center',
          style: TextStyle(
            fontSize: 18, // Changed to a fixed font size
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue, // Added a background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Increased padding for better spacing
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(15), // Increased padding for better spacing
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue),
                      borderRadius: BorderRadius.all(Radius.circular(10)), // Increased border radius
                      color: Colors.white, // Added a background color
                    ),
                    child: Text(
                      "If you encounter any issues or have feedback regarding our application, please don't hesitate to contact our support team. \nWe are here to assist you with any questions or concerns you may have.\nYou can reach out to us via email at support@appname.com, through our in-app chat feature for real-time assistance, or by submitting a support ticket.\nYour feedback is valuable to us and helps us improve our services to provide you with the best user experience.\nThank you for using our app!",
                      style: TextStyle(
                        fontSize: 16, // Changed to a fixed font size
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[800], // Changed to a darker grey color
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Increased spacing between widgets
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Write your message here',
                        border: OutlineInputBorder( // Added a border
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder( // Added a focused border
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a message';
                        } else if (_isBlacklisted(value)) {
                          return 'Hacking attempt detected! Please refrain from using malicious input.';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20), // Increased spacing between widgets
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        context: context,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle Send action
                            String sanitizedInput = _sanitizeInput(_messageController.text);
                            // Insert into database
                            //...
                          }
                        },
                        hintText: 'Send',
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _sanitizeInput(String input) {
    // Remove HTML tags
    input = input.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
    // Remove special characters
    input = input.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
    // Trim input
    input = input.trim();

    return input;
  }

  bool _isBlacklisted(String input) {
    // Blacklist of words to be used in injection
    List<String> blacklist = [
      'elect',
      'insert',
      'update',
      'delete',
      'drop',
      'union',
      'cript',
      'alert',
      'iframe',
      'onload',
      'onerror',
      '<script>',
      '</script>',
      '<iframe>',
      '</iframe>',
      '<img>',
      '<svg>',
      'javascript:',
      'eval(',
      'document.cookie',
      'document.location',
      'window.location',
      'php://input',
      'data:text/html',
      'data:text/javascript',
    ];

    for (String word in blacklist) {
      if (input.toLowerCase().contains(word.toLowerCase())) {
        return true;
      }
    }

    return false;
  }
}
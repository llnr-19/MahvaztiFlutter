import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CardDetailsForm extends StatefulWidget {
  @override
  _CardDetailsFormState createState() => _CardDetailsFormState();
}

class _CardDetailsFormState extends State<CardDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _accessNameController = TextEditingController();

  String _selectedCategory = 'financial';

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderNameController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _accessNameController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> formData = {
        'category': _selectedCategory,
        'card_number': _cardNumberController.text,
        'card_holder_name': _cardHolderNameController.text,
      };

      if (_selectedCategory == 'financial') {
        formData.addAll({
          'expiry_date': _expiryDateController.text,
          'cvv': _cvvController.text,
        });
      } else if (_selectedCategory == 'access') {
        formData['access_name'] = _accessNameController.text;
      } else if (_selectedCategory == 'transport') {
        formData['access_name'] = _accessNameController.text;
      }

      final response = await http.post(
        Uri.parse('https://your-backend-url.com/api/add-card'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(formData),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Card details submitted successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit card details')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add Card Details', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'financial',
                    child: Text('Financial'),
                  ),
                  DropdownMenuItem(
                    value: 'access',
                    child: Text('Access'),
                  ),
                  DropdownMenuItem(
                    value: 'transport',
                    child: Text('Transport'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                keyboardType: TextInputType.number,
                maxLength: 16,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter card number';
                  }
                  if (value.length != 16) {
                    return 'Card number must be 16 digits';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              if (_selectedCategory == 'access' ||
                  _selectedCategory == 'transport')
                TextFormField(
                  controller: _accessNameController,
                  decoration: InputDecoration(
                    labelText: 'Access Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter access name';
                    }
                    return null;
                  },
                ),
              if (_selectedCategory == 'access' ||
                  _selectedCategory == 'transport')
                SizedBox(height: 16.0),
              TextFormField(
                controller: _cardHolderNameController,
                decoration: InputDecoration(
                  labelText: 'Cardholder Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter cardholder name';
                  }
                  return null;
                },
              ),
              if (_selectedCategory == 'financial') SizedBox(height: 16.0),
              if (_selectedCategory == 'financial')
                TextFormField(
                  controller: _expiryDateController,
                  decoration: InputDecoration(
                    labelText: 'Expiry Date (MM/YY)',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter expiry date';
                    }
                    return null;
                  },
                ),
              if (_selectedCategory == 'financial') SizedBox(height: 16.0),
              if (_selectedCategory == 'financial')
                TextFormField(
                  controller: _cvvController,
                  decoration: InputDecoration(
                    labelText: 'CVV',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter CVV';
                    }
                    if (value.length != 3) {
                      return 'CVV must be 3 digits';
                    }
                    return null;
                  },
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

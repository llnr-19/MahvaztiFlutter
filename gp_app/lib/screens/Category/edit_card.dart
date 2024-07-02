import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditCardForm extends StatefulWidget {
  final Map<String, String> cardDetails;

  EditCardForm({Key? key, required this.cardDetails}) : super(key: key);

  @override
  _EditCardFormState createState() => _EditCardFormState();
}

class _EditCardFormState extends State<EditCardForm> {
  late TextEditingController _cardNumberController;
  late TextEditingController _cardHolderNameController;
  late TextEditingController _expiryDateController;
  late TextEditingController _cvvController;

  @override
  void initState() {
    super.initState();
    _cardNumberController =
        TextEditingController(text: widget.cardDetails['card_number']);
    _cardHolderNameController =
        TextEditingController(text: widget.cardDetails['card_holder_name']);
    _expiryDateController =
        TextEditingController(text: widget.cardDetails['expiry_date']);
    _cvvController = TextEditingController(text: widget.cardDetails['cvv']);
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderNameController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (Form.of(context)!.validate()) {
      final Map<String, String> updatedCardDetails = {
        'card_number': _cardNumberController.text,
        'card_holder_name': _cardHolderNameController.text,
        'expiry_date': _expiryDateController.text,
        'cvv': _cvvController.text,
      };

      final response = await http.post(
        Uri.parse('https://your-backend-url.com/api/update-card'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(updatedCardDetails),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Card details updated successfully')),
        );
        Navigator.pop(
            context, updatedCardDetails); // Navigate back with updated details
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update card details')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Card Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
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
              TextFormField(
                controller: _cardHolderNameController,
                decoration: InputDecoration(
                  labelText: 'Cardholder Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter cardholder name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _expiryDateController,
                decoration: InputDecoration(
                  labelText: 'Expiry Date (MM/YY)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter expiry date';
                  }
                  // Additional validation for date format can be added here
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _cvvController,
                decoration: InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
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

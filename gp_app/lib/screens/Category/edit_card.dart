import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package/flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
//import 'package:first/aes.dart';





class EditCardForm extends StatefulWidget {
  final Map<String, String> cardDetails;

  EditCardForm({Key? key, required this.cardDetails}) : super(key: key);

  @override
  _EditCardFormState createState() => _EditCardFormState();
}

class _EditCardFormState extends State<EditCardForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _cardNumberController;
  late TextEditingController _cardHolderNameController;
  late TextEditingController _expiryDateController;
  late TextEditingController _cvvController;
  //final encryptionService = EncryptionService();


  @override
  void initState() {
   // final encryptionService = EncryptionService();
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
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> updatedCardDetails = {
        'card_number': _cardNumberController.text,
        'card_holder_name': _cardHolderNameController.text,
        'expiry_date': _expiryDateController.text,
        'cvv': _cvvController.text,
      };
      String jsonDetails = jsonEncode(updatedCardDetails);
      print(jsonDetails);
      final token =
          'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhc2hyYWZAZ21haWwuY29tIiwiaWF0IjoxNzIwMjgxMDIwLCJleHAiOjE3MjAyODE5MjB9.r9XbDjke-ZLVktofnl4_luhhpvM8Q_fPXv21XgAYOgg';
      final Uri url = Uri.parse(
          'https://mahvazti.up.railway.app/api/customer/cust-0000024/addcard'); // Replace with your backend URL

      try {
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(updatedCardDetails),
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          String token = responseData['token'];
          print(token);
        } else {
          print('Error sending card details: ${response.statusCode}');
          print('Error message: ${response.reasonPhrase}');
          print(jsonEncode(updatedCardDetails));
        }
      } catch (e) {
        // Network error, show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Network error: $e')),
        );
      }


      // Encrypt data
      // final encryptedText = await encryptionService.encryptingData(jsonDetails);
      // print(jsonEncode({
      //   'data':encryptedText}));
      //
      // // Decrypt data
      // final decryptedText = await encryptionService.decryptingData(encryptedText);
      // print("Decrypted data: $decryptedText");
      // var mapobj = jsonDecode(decryptedText);
      // print(mapobj["card_number"]);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Card Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _cardNumberController,
                decoration: const InputDecoration(
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
                  final int? parsedValue = int.tryParse(value);
                  if (parsedValue == null) {
                    return 'Please enter a valid number.'; // Handle non-numeric input
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _cardHolderNameController,
                decoration: const InputDecoration(
                  labelText: 'Cardholder Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter cardholder name';
                  }
                  if (value.length >= 30) {
                    return 'Too Large';
                  }
                  RegExp nameHRegex = RegExp(r"^[a-zA-Z ,.'-]+$");
                  if (!nameHRegex.hasMatch(value)) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _expiryDateController,
                decoration: const InputDecoration(
                  labelText: 'Expiry Date (MM/YY)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter expiry date';
                  }
                  RegExp dateRegex = RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$');
                  if (!dateRegex.hasMatch(value)) {
                    return 'Please enter a valid date';
                  }
                  // Additional validation for date format can be added here
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _cvvController,
                decoration: const InputDecoration(
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
                  final int? parsedValue = int.tryParse(value);
                  if (parsedValue == null) {
                    return 'Please enter a valid number.'; // Handle non-numeric input
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
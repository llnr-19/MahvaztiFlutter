// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// //
// // class CardDetailsForm extends StatefulWidget {
// //   const CardDetailsForm({super.key});
// //
// //   @override
// //   _CardDetailsFormState createState() => _CardDetailsFormState();
// // }
// //
// // class _CardDetailsFormState extends State<CardDetailsForm> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _cardNumberController = TextEditingController();
// //   final _cardHolderNameController = TextEditingController();
// //   final _expiryDateController = TextEditingController();
// //   final _cvvController = TextEditingController();
// //   final _accessNameController = TextEditingController();
// //
// //   String _selectedCategory = 'financial';
// //
// //   @override
// //   void dispose() {
// //     _cardNumberController.dispose();
// //     _cardHolderNameController.dispose();
// //     _expiryDateController.dispose();
// //     _cvvController.dispose();
// //     _accessNameController.dispose();
// //     super.dispose();
// //   }
// //
// //   Future<void> _submitForm() async {
// //     if (_formKey.currentState!.validate()) {
// //       final Map<String, String> formData = {
// //         'category': _selectedCategory,
// //         'card_number': _cardNumberController.text,
// //         'card_holder_name': _cardHolderNameController.text,
// //       };
// //
// //       if (_selectedCategory == 'financial') {
// //         formData.addAll({
// //           'expiry_date': _expiryDateController.text,
// //           'cvv': _cvvController.text,
// //         });
// //       } else if (_selectedCategory == 'access') {
// //         formData['access_name'] = _accessNameController.text;
// //       } else if (_selectedCategory == 'transport') {
// //         formData['access_name'] = _accessNameController.text;
// //       }
// //
// //       final response = await http.post(
// //         Uri.parse('https://your-backend-url.com/api/add-card'),
// //         headers: <String, String>{
// //           'Content-Type': 'application/json; charset=UTF-8',
// //         },
// //         body: jsonEncode(formData),
// //       );
// //
// //       if (response.statusCode == 200) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text('Card details submitted successfully')),
// //         );
// //       } else {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text('Failed to submit card details')),
// //         );
// //       }
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.blue,
// //         title: const Text('Add Card Details',
// //             style: TextStyle(color: Colors.white)),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             children: [
// //               Container(
// //                 height: 180,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(12.0),
// //                   color: Colors.blue[100],
// //                 ),
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(16.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       const Text(
// //                         'Credit card',
// //                         style: TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           fontSize: 16.0,
// //                         ),
// //                       ),
// //                       const SizedBox(height: 16.0),
// //                       // Credit Card Chip
// //                       Container(
// //                         height: 20,
// //                         width: 40,
// //                         decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(4.0),
// //                           color: Colors.grey[200],
// //                         ),
// //                         child: const Center(
// //                           child: Text(
// //                             '**',
// //                             style: TextStyle(
// //                               fontWeight: FontWeight.bold,
// //                               fontSize: 12.0,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       const SizedBox(height: 16.0),
// //                       // Credit Card Number
// //                       const Text(
// //                         '**** **** **** ****',
// //                         style: TextStyle(
// //                           fontSize: 14.0,
// //                         ),
// //                       ),
// //                       const SizedBox(height: 8.0),
// //                       // Credit Card Holder Name
// //                       const Text(
// //                         'Card Holder Name',
// //                         style: TextStyle(
// //                           fontSize: 14.0,
// //                         ),
// //                       ),
// //                       const SizedBox(height: 8.0),
// //                       // Credit Card Expiration Date
// //                       const Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           Text(
// //                             'Valid thru',
// //                             style: TextStyle(
// //                               fontSize: 12.0,
// //                             ),
// //                           ),
// //                           Text(
// //                             '11/26',
// //                             style: TextStyle(
// //                               fontSize: 12.0,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 20.0),
// //               SizedBox(
// //                 height: 480,
// //                 child: ListView(
// //                   children: <Widget>[
// //                     DropdownButtonFormField<String>(
// //                       value: _selectedCategory,
// //                       decoration: InputDecoration(
// //                         labelText: 'Category',
// //                         border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(20)),
// //                       ),
// //                       items: const [
// //                         DropdownMenuItem(
// //                           value: 'financial',
// //                           child: Text('Financial'),
// //                         ),
// //                         DropdownMenuItem(
// //                           value: 'access',
// //                           child: Text('Access'),
// //                         ),
// //                         DropdownMenuItem(
// //                           value: 'transport',
// //                           child: Text('Transport'),
// //                         ),
// //                       ],
// //                       onChanged: (value) {
// //                         setState(() {
// //                           _selectedCategory = value!;
// //                         });
// //                       },
// //                     ),
// //                     const SizedBox(height: 16.0),
// //                     TextFormField(
// //                       controller: _cardNumberController,
// //                       decoration: InputDecoration(
// //                         labelText: 'Card Number',
// //                         border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(20)),
// //                       ),
// //                       keyboardType: TextInputType.number,
// //                       maxLength: 16,
// //                       validator: (value) {
// //                         if (value == null || value.isEmpty) {
// //                           return 'Please enter card number';
// //                         }
// //                         if (value.length != 16) {
// //                           return 'Card number must be 16 digits';
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     const SizedBox(height: 16.0),
// //                     if (_selectedCategory == 'access' ||
// //                         _selectedCategory == 'transport')
// //                       TextFormField(
// //                         controller: _accessNameController,
// //                         decoration: InputDecoration(
// //                           labelText: 'Access Name',
// //                           border: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(20)),
// //                         ),
// //                         validator: (value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter access name';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                     if (_selectedCategory == 'access' ||
// //                         _selectedCategory == 'transport')
// //                       const SizedBox(height: 16.0),
// //                     TextFormField(
// //                       controller: _cardHolderNameController,
// //                       decoration: InputDecoration(
// //                         labelText: 'Cardholder Name',
// //                         border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(20)),
// //                       ),
// //                       validator: (value) {
// //                         if (value == null || value.isEmpty) {
// //                           return 'Please enter cardholder name';
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     if (_selectedCategory == 'financial')
// //                       const SizedBox(height: 16.0),
// //                     if (_selectedCategory == 'financial')
// //                       TextFormField(
// //                         controller: _expiryDateController,
// //                         decoration: InputDecoration(
// //                           labelText: 'Expiry Date (MM/YY)',
// //                           border: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(20)),
// //                         ),
// //                         keyboardType: TextInputType.datetime,
// //                         validator: (value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter expiry date';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                     if (_selectedCategory == 'financial')
// //                       const SizedBox(height: 16.0),
// //                     if (_selectedCategory == 'financial')
// //                       TextFormField(
// //                         controller: _cvvController,
// //                         decoration: InputDecoration(
// //                           labelText: 'CVV',
// //                           border: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(20)),
// //                         ),
// //                         keyboardType: TextInputType.number,
// //                         maxLength: 3,
// //                         validator: (value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter CVV';
// //                           }
// //                           if (value.length != 3) {
// //                             return 'CVV must be 3 digits';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                     const SizedBox(height: 16.0),
// //                     ElevatedButton(
// //                       onPressed: _submitForm,
// //                       child: const Text('Submit'),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class CardDetailsForm extends StatefulWidget {
//   const CardDetailsForm({super.key});
//
//   @override
//   _CardDetailsFormState createState() => _CardDetailsFormState();
// }
//
// class _CardDetailsFormState extends State<CardDetailsForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _cardNumberController = TextEditingController();
//   final _cardHolderNameController = TextEditingController();
//   final _expiryDateController = TextEditingController();
//   final _cvvController = TextEditingController();
//   final _accessNameController = TextEditingController();
//
//   String _selectedCategory = 'financial';
//
//   @override
//   void dispose() {
//     _cardNumberController.dispose();
//     _cardHolderNameController.dispose();
//     _expiryDateController.dispose();
//     _cvvController.dispose();
//     _accessNameController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       double jj = 500;
//       final Map<String, dynamic> formData = {
//         "custEmail": "ashraf@gmail.com",
//         "cardCategoryName": _selectedCategory,
//         "cardNumber": _cardNumberController.text,
//         "cardName": "Test Card",
//         "cardHolderName": _cardHolderNameController.text,
//         "cardBalance": jj
//       };
//       print(formData);
//       if (_selectedCategory == 'finacial') {
//         formData.addAll({
//           'expiryDate': _expiryDateController.text,
//           'cvv': _cvvController.text,
//           "cardNotes": "Telda card for dailyuse"
//         });
//       } else if (_selectedCategory == 'access' ||
//           _selectedCategory == 'transport') {
//         formData['access_name'] = _accessNameController.text;
//       }
//
//       final token =
//           'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhc2hyYWZAZ21haWwuY29tIiwiaWF0IjoxNzIwMjgxMDIwLCJleHAiOjE3MjAyODE5MjB9.r9XbDjke-ZLVktofnl4_luhhpvM8Q_fPXv21XgAYOgg';
//       final Uri url = Uri.parse(
//           'https://mahvazti.up.railway.app/api/customer/cust-0000024/addcard'); // Replace with your backend URL
//
//       try {
//         final response = await http.post(
//           url,
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer $token',
//           },
//           body: jsonEncode(formData),
//         );
//
//         if (response.statusCode == 200) {
//           final responseData = jsonDecode(response.body);
//           String token = responseData['token'];
//           print(token);
//         } else {
//           print('Error sending card details: ${response.statusCode}');
//           print('Error message: ${response.reasonPhrase}');
//           print(jsonEncode(formData));
//         }
//       } catch (e) {
//         // Network error, show an error message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Network error: $e')),
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text('Add Card Details',
//             style: TextStyle(color: Colors.white)),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 Container(
//                   height: 180,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12.0),
//                     color: Colors.blue[100],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Credit card',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16.0,
//                           ),
//                         ),
//                         const SizedBox(height: 16.0),
//                         // Credit Card Chip
//                         Container(
//                           height: 20,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4.0),
//                             color: Colors.grey[200],
//                           ),
//                           child: const Center(
//                             child: Text(
//                               '',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 12.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16.0),
//                         // Credit Card Number
//                         const Text(
//                           '**** **** **** ****',
//                           style: TextStyle(
//                             fontSize: 14.0,
//                           ),
//                         ),
//                         const SizedBox(height: 8.0),
//                         // Credit Card Holder Name
//                         const Text(
//                           'Card Holder Name',
//                           style: TextStyle(
//                             fontSize: 14.0,
//                           ),
//                         ),
//                         const SizedBox(height: 8.0),
//                         // Credit Card Expiration Date
//                         const Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Valid thru',
//                               style: TextStyle(
//                                 fontSize: 12.0,
//                               ),
//                             ),
//                             Text(
//                               '11/26',
//                               style: TextStyle(
//                                 fontSize: 12.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 SizedBox(
//                   height: 600,
//                   child: Column(
//                     children: <Widget>[
//                       DropdownButtonFormField<String>(
//                         value: _selectedCategory,
//                         decoration: InputDecoration(
//                           labelText: 'Category',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                         ),
//                         items: const [
//                           DropdownMenuItem(
//                             value: 'financial',
//                             child: Text('Financial'),
//                           ),
//                           DropdownMenuItem(
//                             value: 'access',
//                             child: Text('Access'),
//                           ),
//                           DropdownMenuItem(
//                             value: 'transport',
//                             child: Text('Transport'),
//                           ),
//                         ],
//                         onChanged: (value) {
//                           setState(() {
//                             _selectedCategory = value!;
//                           });
//                         },
//                       ),
//                       const SizedBox(height: 16.0),
//                       TextFormField(
//                         controller: _cardNumberController,
//                         decoration: InputDecoration(
//                           labelText: 'Card Number',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                         ),
//                         keyboardType: TextInputType.number,
//                         maxLength: 16,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter card number';
//                           }
//                           if (value.length != 16) {
//                             return 'Card number must be 16 digits';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 16.0),
//                       if (_selectedCategory == 'access' ||
//                           _selectedCategory == 'transport')
//                         TextFormField(
//                           controller: _accessNameController,
//                           decoration: InputDecoration(
//                             labelText: 'Access Name',
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20)),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter access name';
//                             }
//                             return null;
//                           },
//                         ),
//                       if (_selectedCategory == 'access' ||
//                           _selectedCategory == 'transport')
//                         const SizedBox(height: 16.0),
//                       TextFormField(
//                         controller: _cardHolderNameController,
//                         decoration: InputDecoration(
//                           labelText: 'Cardholder Name',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter cardholder name';
//                           }
//                           return null;
//                         },
//                       ),
//                       if (_selectedCategory == 'financial')
//                         const SizedBox(height: 16.0),
//                       if (_selectedCategory == 'financial')
//                         TextFormField(
//                           controller: _expiryDateController,
//                           decoration: InputDecoration(
//                             labelText: 'Expiry Date (MM/YY)',
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20)),
//                           ),
//                           keyboardType: TextInputType.datetime,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter expiry date';
//                             }
//                             return null;
//                           },
//                         ),
//                       if (_selectedCategory == 'financial')
//                         const SizedBox(height: 16.0),
//                       if (_selectedCategory == 'financial')
//                         TextFormField(
//                           controller: _cvvController,
//                           decoration: InputDecoration(
//                             labelText: 'CVV',
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20)),
//                           ),
//                           keyboardType: TextInputType.number,
//                           maxLength: 3,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter CVV';
//                             }
//                             if (value.length != 3) {
//                               return 'CVV must be 3 digits';
//                             }
//                             return null;
//                           },
//                         ),
//                       const SizedBox(height: 16.0),
//                       ElevatedButton(
//                         onPressed: _submitForm,
//                         child: const Text('Submit'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CardDetailsForm extends StatefulWidget {
  const CardDetailsForm({super.key});

  @override
  _CardDetailsFormState createState() => _CardDetailsFormState();
}

class _CardDetailsFormState extends State<CardDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  final _cardNameController = TextEditingController();
  final _cardNoteController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _balanceController = TextEditingController();
  final _accessNameController = TextEditingController();

  String _selectedCategory = 'financial';

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderNameController.dispose();
    _cardNameController.dispose();
    _cardNoteController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _accessNameController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      //double jj = 500;
      final Map<String, dynamic> formData = {
        "custEmail": "ashraf@gmail.com",
        "cardCategoryName": _selectedCategory,
        "cardNumber": _cardNumberController.text,
        "cardName": _cardNameController.text,
        "cardHolderName": _cardHolderNameController.text,
        "cardBalance": _balanceController.text
      };
      print(formData);
      if (_selectedCategory == 'finacial') {
        formData.addAll({
          'expiryDate': _expiryDateController.text,
          'cvv': _cvvController.text,
          "cardNotes": _cardNoteController.text
        });
      } else if (_selectedCategory == 'access' ||
          _selectedCategory == 'transport') {
        formData['access_name'] = _accessNameController.text;
      }

      final token =
          'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhc2hyYWZAZ21haWwuY29tIiwiaWF0IjoxNzIwMjgyMTY5LCJleHAiOjE3MjAyODMwNjl9.GnVEjGA0-R6r0ZrN3CqSbhpt-dKDgUeHHNpa3w-b65Y';
      final Uri url = Uri.parse(
          'https://mahvazti.up.railway.app/api/customer/cust-0000024/addcard'); // Replace with your backend URL

      try {
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(formData),
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          String token = responseData['token'];
          print(token);
        } else {
          print('Error sending card details: ${response.statusCode}');
          print('Error message: ${response.reasonPhrase}');
          print(jsonEncode(formData));
        }
      } catch (e) {
        // Network error, show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Network error: $e')),
        );
      }
    }
  }
  // Future<void> _submitForm() async {
  //   if (_formKey.currentState!.validate()) {
  //     final Map<String, String> formData = {
  //       'custEmail': "gg@gmail.com",
  //       'cardCategoryName': _selectedCategory,
  //       'cardNumber': _cardNumberController.text,
  //       'cardName': _cardNameController,
  //       'cardHolderName': _cardHolderNameController.text,
  //       'cardBalance': _balanceController.text,
  //     };

  //     if (_selectedCategory == 'financial') {
  //       formData.addAll({
  //         'expiryDate': _expiryDateController.text,
  //         'cvv': _cvvController.text,
  //         'cardNotes': _cardNoteController.text
  //       });
  //     } else if (_selectedCategory == 'access') {
  //       formData['access_name'] = _accessNameController.text;
  //     } else if (_selectedCategory == 'transport') {
  //       formData['access_name'] = _accessNameController.text;
  //     }

  //     final response = await http.post(
  //       Uri.parse(
  //           'https://mahvazti.up.railway.app/api/auth/cust-0000015/addcard'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'token':
  //             "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwMTEyNTI1NTE1NyIsImlhdCI6MTcyMDI0MTQ2NSwiZXhwIjoxNzIwMjQyMzY1fQ.WrV2j_k3oWWPiXJ4GMczFyHqHHFgAb9qilZy10XHGvM",
  //       },
  //       body: jsonEncode(formData),
  //     );

  //     if (response.statusCode == 200) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Card details submitted successfully')),
  //       );
  //     } else {
  //       print(response.statusCode);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Failed to submit card details')),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Add Card Details',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.blue[100],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Credit card',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Credit Card Chip
                        Container(
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.grey[200],
                          ),
                          child: const Center(
                            child: Text(
                              '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Credit Card Number
                        const Text(
                          '**** **** **** ****',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        // Credit Card Holder Name
                        const Text(
                          'Card Holder Name',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        // Credit Card Expiration Date
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Valid thru',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              '11/26',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 700,
                  child: Column(
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
                      const SizedBox(height: 16.0),
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
                      const SizedBox(height: 16.0),
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
                        const SizedBox(height: 16.0),
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
                      if (_selectedCategory == 'financial')
                        const SizedBox(height: 16.0),
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
                      if (_selectedCategory == 'financial')
                        const SizedBox(height: 16.0),
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
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _balanceController,
                        decoration: InputDecoration(
                          labelText: 'Balance',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your balance';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _cardNoteController,
                        decoration: InputDecoration(
                          labelText: 'Card Note',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class CreditCardd extends StatefulWidget {
//   final List<CreditCardData> cards; // List to hold card details
//   final ValueChanged<CreditCardData>
//       onCardSelected; // Callback for card selection
//
//   const CreditCardd(
//       {Key? key, required this.cards, required this.onCardSelected})
//       : super(key: key);
//
//   @override
//   State<CreditCardd> createState() => _CreditCardState();
// }
//
// class CreditCardData {
//   final String cardNumber;
//   final double totalBalance;
//   final String cardName;
//   final String cardHolderName;
//   final String cardType;
//
//   CreditCardData({
//     required this.cardNumber,
//     required this.totalBalance,
//     required this.cardName,
//     required this.cardHolderName,
//     required this.cardType,
//   });
// }
//
// class _CreditCardState extends State<CreditCardd> {
//   int _selectedIndex = -1; // Index of the selected card (-1 for none)
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal, // Enable horizontal scrolling
//       child: Row(
//         children: widget.cards
//             .map((cardData) => createCard(cardData, context))
//             .toList(),
//       ),
//     );
//   }
//
//   Widget createCard(CreditCardData cardData, BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() => _selectedIndex = widget.cards.indexOf(cardData));
//         widget
//             .onCardSelected(cardData); // Notify parent widget of selected card
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 12),
//         width: 300,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16.0),
//           gradient: const LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF90C9FF),
//               Color(0xFF5286FF),
//             ],
//           ),
//           boxShadow: [
//             if (_selectedIndex ==
//                 widget.cards.indexOf(cardData)) // Shadow only for selected card
//               BoxShadow(
//                 color: Colors.black12.withOpacity(0.5),
//                 spreadRadius: 1,
//                 blurRadius: 5,
//                 offset: const Offset(4, 8),
//               ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 35),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Card Number: ${cardData.cardNumber}',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               Text(
//                 'Total Balance:${cardData.totalBalance}',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               Text(
//                 'Card Name: ${cardData.cardName}',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               Text(
//                 'Cardholder Name: ${cardData.cardHolderName}',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               Text(
//                 'Card Type: ${cardData.cardType}',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// //                        Positioned(
// //       top: 170.0,
// //       left: 20.0,
// //       right: 20.0,
// //       child: Column(
// //         children: [
// //           TextFormField(
// //             controller: _amountController,
// //             keyboardType: const TextInputType.numberWithOptions(decimal: true),
//
// //             decoration: const InputDecoration(
// //               labelText: 'Amount',
// //               border: OutlineInputBorder(),
// //             ),
// //             validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                      return 'Please enter an amount.';
// //                          }
// //                       final double? parsedValue = double.tryParse(value);
// //                       if (parsedValue == null) {
// //                         return 'Please enter a valid number.';
// //                       }
// // //talk to database
// //                       if (parsedValue >= 700) {
// //                         return 'Please enter an amount less than coins you have.';
// //                       }
// //                       return null;
// //                     },
// //           ),
// //           const SizedBox(height: 10.0),
// //           TextFormField(
// //                 controller: _dateController,
// //                 readOnly: true,
// //                 onTap: () async {
// //                   DateTime? pickedDate = await showDatePicker(
// //                     context: context,
// //                     initialDate: DateTime.now(),
// //                     firstDate: DateTime(2023, 1, 1),
// //                     lastDate: DateTime(2100),
// //                   );
// //                   if (pickedDate != null) {
// //                     setState(() {
// //                       _dateController.text = pickedDate.toString();
// //                     });
// //                   }
// //                 },
// //                 decoration: const InputDecoration(
// //                    border: OutlineInputBorder(),
// //                   labelText: 'Date',
//
// //                 ),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please select date';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //         ],
// //       ),
// //     ),
//     //              Positioned(
//     //               top: 330.0,
//     //               left: 200.0,
//     //                  child:Form(
//     //               key: _formKey,
//     //                 child: ElevatedButton(
//     //                      onPressed: () {
//     //                        if (_formKey.currentState!.validate()) {
//     //                 // Form is valid, process payment (replace with actual payment logic)
//     //                 // print('Processing payment...');
//     //               }
//
//     //                       },
//     //                     child: const Text(
//     //               "Pay",
//     //                 style: TextStyle(fontSize: 25.0),
//     // ),
//     //          ) ,
//
//     //              ),
//     //              ),
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreditCardd extends StatefulWidget {
  final ValueChanged<CreditCardData> onCardSelected; // Callback for card selection

  const CreditCardd({super.key, required this.onCardSelected, required List<CreditCardData> cards});

  @override
  State<CreditCardd> createState() => _CreditCardState();
}

class CreditCardData {
  final String cardNumber;
  final double totalBalance;
  final String cardName;
  final String cardHolderName;
  final String cardType;

  CreditCardData({
    required this.cardNumber,
    required this.totalBalance,
    required this.cardName,
    required this.cardHolderName,
    required this.cardType,
  });

  factory CreditCardData.fromJson(Map<String, dynamic> json) {
    return CreditCardData(
      cardNumber: json['cardNumber'],
      totalBalance: json['totalBalance'].toDouble(),
      cardName: json['cardName'],
      cardHolderName: json['cardHolderName'],
      cardType: json['cardType'],
    );
  }
}

class _CreditCardState extends State<CreditCardd> {
  List<CreditCardData> _cards = [];
  int _selectedIndex = -1; // Index of the selected card (-1 for none)
  bool _isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    _fetchCardData();
  }

  Future<void> _fetchCardData() async {
    final response = await http.get(Uri.parse('https://api.example.com/cards'));

    if (response.statusCode == 200) {
      final List<dynamic> cardJson = json.decode(response.body);
      setState(() {
        _cards = cardJson.map((json) => CreditCardData.fromJson(json)).toList();
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load card data');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      child: Row(
        children: _cards.map((cardData) => createCard(cardData, context)).toList(),
      ),
    );
  }

  Widget createCard(CreditCardData cardData, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => _selectedIndex = _cards.indexOf(cardData));
        widget.onCardSelected(cardData); // Notify parent widget of selected card
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 12),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF90C9FF),
              Color(0xFF5286FF),
            ],
          ),
          boxShadow: [
            if (_selectedIndex == _cards.indexOf(cardData)) // Shadow only for selected card
              BoxShadow(
                color: Colors.black12.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(4, 8),
              ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Card Number: ${cardData.cardNumber}',
                style: const TextStyle(fontSize: 16.0),
              ),
              Text(
                'Total Balance: ${cardData.totalBalance}',
                style: const TextStyle(fontSize: 16.0),
              ),
              Text(
                'Card Name: ${cardData.cardName}',
                style: const TextStyle(fontSize: 16.0),
              ),
              Text(
                'Cardholder Name: ${cardData.cardHolderName}',
                style: const TextStyle(fontSize: 16.0),
              ),
              Text(
                'Card Type: ${cardData.cardType}',
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

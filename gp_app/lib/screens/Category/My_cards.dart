import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gp_app/screens/Category/category_list.dart';
import 'package:gp_app/screens/Category/edit_card.dart';

class MyCards extends StatelessWidget {
  final String category;

  MyCards({Key? key, required this.category}) : super(key: key);

  final Map<String, List<MyCardDetails>> cardDetailsByCategory = {
    'Financial': [
      MyCardDetails(
          cardNumber: '1234567812345678',
          cardHolderName: 'John Doe',
          cardType: 'Visa'),
      // Add more financial cards here
    ],
    'Access': [
      MyCardDetails(
          cardNumber: '8765432187654321',
          cardHolderName: 'Jane Smith',
          cardType: 'Access Card'),
      // Add more access cards here
    ],
    'Transport': [
      MyCardDetails(
          cardNumber: '1122334455667788',
          cardHolderName: 'Jim Brown',
          cardType: 'Transport Card'),
      // Add more transport cards here
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<MyCardDetails> cardDetails = cardDetailsByCategory[category] ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'My Cards',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: cardDetails.length,
        itemBuilder: (context, index) {
          return CreditCard(
            cardDetails: cardDetails[index].toJson(),
          );
        },
      ),
    );
  }
}

class CreditCard extends StatefulWidget {
  final Map<String, String> cardDetails;

  CreditCard({Key? key, required this.cardDetails}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditCardForm(
                cardDetails:
                    widget.cardDetails), // Update with correct import path
          ),
        );
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
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Credit card',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Card Number: ${widget.cardDetails['card_number']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Cardholder Name: ${widget.cardDetails['card_holder_name']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Card Type: ${widget.cardDetails['card_type']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class My_cards extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: const Text(
//             'My Cards',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: ListView.builder(
//           scrollDirection: Axis.vertical,
//           itemCount: 5, // Number of credit cards
//           itemBuilder: (context, index) {
//             return CreditCard(
//               cardDetails: {}, // Select the first card
//             );
//           },
//         ));
//   }
// }

// class CreditCard extends StatefulWidget {
//   final Map<String, String> cardDetails;

//   CreditCard({Key? key, required this.cardDetails}) : super(key: key);

//   @override
//   State<CreditCard> createState() => _CreditCardState();
// }

// class _CreditCardState extends State<CreditCard> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => EditCardForm(cardDetails: widget.cardDetails),
//           ),
//         );
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 12),
//         width: 300,
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 121, 224, 231),
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 45),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Card Number: ${widget.cardDetails['card_number']}',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 'Cardholder Name: ${widget.cardDetails['card_holder_name']}',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 'Card Type: ${widget.cardDetails['card_type']}',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

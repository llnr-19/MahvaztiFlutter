import 'package:flutter/material.dart';
import 'home_body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Initial Selected Value
  String dropdownValue = 'Financial Card';

  // Card details
  final Map<String, Map<String, String>> cardDetails = {
    'Financial Card': {
      'Card Number': '1234 5678 9012 3456',
      'Cardholder Name': 'John Doe',
      'Card Type': 'Financial Card',
    },
    'Access Card': {
      'Card Number': '2345 6789 0123 4567',
      'Cardholder Name': 'Jane Smith',
      'Card Type': 'Access Card',
    },
    'Transportation Card': {
      'Card Number': '3456 7890 1234 5678',
      'Cardholder Name': 'Alice Johnson',
      'Card Type': 'Transportation Card',
    },
    'Keychain Card': {
      'Card Number': '4567 8901 2345 6789',
      'Cardholder Name': 'Bob Brown',
      'Card Type': 'Keychain Card',
    },
  };

  void _updateDropdownValue(String newValue) {
    setState(() {
      dropdownValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: homAppBar(dropdownValue, _updateDropdownValue),
      body: HomeBody(
        cardDetails[dropdownValue]!,
      ),
    );
  }
}

AppBar homAppBar(String dropdownValue, ValueChanged<String> onValueChanged) {
  return AppBar(
    toolbarHeight: 110,
    backgroundColor: Colors.blue,
    title: Column(
      children: [
        const Center(
          child: Text(
            'HOME',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        select_drop(
          dropdownValue: dropdownValue,
          onValueChanged: onValueChanged,
        ),
      ],
    ),
  );
}

class select_drop extends StatelessWidget {
  final String dropdownValue;
  final ValueChanged<String> onValueChanged;

  select_drop({
    Key? key,
    required this.dropdownValue,
    required this.onValueChanged,
  }) : super(key: key);

  // List of items in our dropdown menu
  final List<String> items = [
    'Financial Card',
    'Access Card',
    'Transportation Card',
    'Keychain Card',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(55).copyWith(
          bottomRight: const Radius.circular(55),
        ),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          isExpanded: true,
          iconEnabledColor: Colors.blue,
          iconSize: 40,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              onValueChanged(newValue);
            }
          },
        ),
      ),
    );
  }
}


// // import 'package:flutter/material.dart';
// // import 'package:gp_app/services/api_service.dart';

// // class Home extends StatefulWidget {
// //   const Home({super.key});

// //   @override
// //   State<Home> createState() => _HomeState();
// // }

// // class _HomeState extends State<Home> {
// //   String dropdownValue = 'Financial Card';
// //   Map<String, String> cardDetails = {};
// //   final ApiService apiService =
// //       ApiService(baseUrl: 'https://your-backend-api.com');

// //   @override
// //   void initState() {
// //     super.initState();
// //     _fetchCardDetails();
// //   }

// //   void _fetchCardDetails() async {
// //     try {
// //       final details = await apiService.getCardDetails(dropdownValue);
// //       setState(() {
// //         cardDetails = details
// //             .map((key, value) => MapEntry(key.toString(), value.toString()));
// //       });
// //     } catch (e) {
// //       print('Error fetching card details: $e');
// //     }
// //   }

// //   void _updateDropdownValue(String newValue) {
// //     setState(() {
// //       dropdownValue = newValue;
// //       _fetchCardDetails();
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.blue,
// //       appBar: homAppBar(dropdownValue, _updateDropdownValue),
// //       // body: HomeBody(
// //       //   initialCardDetails: cardDetails,
// //       //   updateCardDetails: _fetchCardDetails,
// //       //   apiService: 'jkjki',
// //       // ),
// //     );
// //   }
// // }

// // AppBar homAppBar(String dropdownValue, ValueChanged<String> onValueChanged) {
// //   return AppBar(
// //     toolbarHeight: 110,
// //     backgroundColor: Colors.blue,
// //     title: Column(
// //       children: [
// //         const Center(
// //           child: Text(
// //             'HOME',
// //             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
// //           ),
// //         ),
// //         select_drop(
// //           dropdownValue: dropdownValue,
// //           onValueChanged: onValueChanged,
// //         ),
// //       ],
// //     ),
// //   );
// // }

// // class select_drop extends StatelessWidget {
// //   final String dropdownValue;
// //   final ValueChanged<String> onValueChanged;

// //   select_drop({
// //     Key? key,
// //     required this.dropdownValue,
// //     required this.onValueChanged,
// //   }) : super(key: key);

// //   final List<String> items = [
// //     'Financial Card',
// //     'Access Card',
// //     'Transportation Card',
// //     'Keychain Card',
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
// //       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(55).copyWith(
// //           bottomRight: const Radius.circular(55),
// //         ),
// //         color: Colors.white,
// //       ),
// //       child: DropdownButtonHideUnderline(
// //         child: DropdownButton<String>(
// //           value: dropdownValue,
// //           isExpanded: true,
// //           iconEnabledColor: Colors.blue,
// //           iconSize: 40,
// //           items: items.map((String item) {
// //             return DropdownMenuItem<String>(
// //               value: item,
// //               child: Text(item),
// //             );
// //           }).toList(),
// //           onChanged: (String? newValue) {
// //             if (newValue != null) {
// //               onValueChanged(newValue);
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:gp_app/screens/Home/home_Body.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   // Initial Selected Value
//   String dropdownValue = 'Financial Card';

//   // Card details
//   final Map<String, Map<String, String>> cardDetails = {
//     'Financial Card': {
//       'Card Number': '1234 5678 9012 3456',
//       'Cardholder Name': 'John Doe',
//       'Card Type': 'Financial Card',
//     },
//     'Access Card': {
//       'Card Number': '2345 6789 0123 4567',
//       'Cardholder Name': 'Jane Smith',
//       'Card Type': 'Access Card',
//     },
//     'Transportation Card': {
//       'Card Number': '3456 7890 1234 5678',
//       'Cardholder Name': 'Alice Johnson',
//       'Card Type': 'Transportation Card',
//     },
//     'Keychain Card': {
//       'Card Number': '4567 8901 2345 6789',
//       'Cardholder Name': 'Bob Brown',
//       'Card Type': 'Keychain Card',
//     },
//   };

//   void _updateDropdownValue(String newValue) {
//     setState(() {
//       dropdownValue = newValue;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.blue,
//         appBar: homAppBar(dropdownValue, _updateDropdownValue),
//         body: HomeBody(
//           cardDetails[dropdownValue]!,
//         ));
//   }
// }

// AppBar homAppBar(String dropdownValue, ValueChanged<String> onValueChanged) {
//   return AppBar(
//     toolbarHeight: 110,
//     backgroundColor: Colors.blue,
//     title: Column(
//       children: [
//         const Center(
//           child: Text(
//             'HOME',
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ),
//         select_drop(
//           dropdownValue: dropdownValue,
//           onValueChanged: onValueChanged,
//         ),
//       ],
//     ),
//   );
// }

// class select_drop extends StatelessWidget {
//   final String dropdownValue;
//   final ValueChanged<String> onValueChanged;

//   select_drop({
//     Key? key,
//     required this.dropdownValue,
//     required this.onValueChanged,
//   }) : super(key: key);

//   // List of items in our dropdown menu
//   final List<String> items = [
//     'Financial Card',
//     'Access Card',
//     'Transportation Card',
//     'Keychain Card',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(55).copyWith(
//           bottomRight: const Radius.circular(55),
//         ),
//         color: Colors.white,
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           value: dropdownValue,
//           isExpanded: true,
//           iconEnabledColor: Colors.blue,
//           iconSize: 40,
//           items: items.map((String item) {
//             return DropdownMenuItem<String>(
//               value: item,
//               child: Text(item),
//             );
//           }).toList(),
//           onChanged: (String? newValue) {
//             if (newValue != null) {
//               onValueChanged(newValue);
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

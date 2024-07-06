import 'package:flutter/material.dart';
import 'package:gp_app/screens/Login_Signup/screens/welcome_screen.dart';
import 'package:gp_app/screens/Login_Signup/themes/theme.dart';
import 'package:gp_app/screens/mm/Navigation_Bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const WelcomeScreen(),
    );
  }
}
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:nfc_manager/nfc_manager.dart';
// import 'package:nfc_manager/platform_tags.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'NFC Peer-to-Peer Example',
//       home: NFCPeerToPeerExample(),
//     );
//   }
// }
//
// class NFCPeerToPeerExample extends StatefulWidget {
//   const NFCPeerToPeerExample({super.key});
//
//   @override
//   _NFCPeerToPeerExampleState createState() => _NFCPeerToPeerExampleState();
// }
//
// class _NFCPeerToPeerExampleState extends State<NFCPeerToPeerExample> {
//   final NfcManager _nfcManager = NfcManager.instance;
//   final String _textToSend = 'Hello, NFC!';
//   String _receivedText = '';
//   String _statusMessage = '';
//
//   late Uint8List _apduSendCommand;
//   late Uint8List _apduReceiveResponse;
//   IsoDep? _isoDep;
//
//   @override
//   void initState() {
//     super.initState();
//     _initApduCommands();
//     _startNfcSession();
//   }
//
//   void _initApduCommands() {
//     _apduSendCommand = Uint8List.fromList([
//       0x00, // Class byte
//       0x01, // Instruction byte
//       0x00, // Parameter 1 byte
//       0x00, // Parameter 2 byte
//       0x01, // Length of command data byte
//       _textToSend.codeUnits.length,
//       ..._textToSend.codeUnits,
//     ]);
//
//     _apduReceiveResponse = Uint8List.fromList([
//       0x00, // Class byte
//       0x02, // Instruction byte
//       0x00, // Parameter 1 byte
//       0x00, // Parameter 2 byte
//       0x00, // Maximum length of response data byte
//     ]);
//   }
//
//   void _startNfcSession() {
//     _nfcManager.startSession(
//       onDiscovered: (NfcTag tag) async {
//         try {
//           if (tag.data['techList']?.contains('android.nfc.tech.IsoDep')??
//               false) {
//             setState(() {
//               _statusMessage = 'NFC Tag discovered';
//             });
//             _isoDep = IsoDep.from(tag);
//           } else {
//             setState(() {
//               _statusMessage = 'Unsupported NFC Tag';
//             });
//             return;
//           }
//         } catch (e) {
//           setState(() {
//             _statusMessage = 'Error discovering tag: $e';
//           });
//         }
//       },
//       onError: (error) async {
//         setState(() {
//           _statusMessage = 'Error starting NFC session: $error';
//         });
//       },
//     );
//   }
//
//   void _sendMessage() async {
//     if (_isoDep == null) {
//       setState(() {
//         _statusMessage = 'NFC not initialized';
//       });
//       return;
//     }
//
//     try {
//       final response = await _isoDep!.transceive(data: _apduSendCommand);
//       setState(() {
//         _statusMessage = 'Message sent successfully!';
//         _receiveMessage(response);
//       });
//       print('Sent command: $_apduSendCommand, Response: $response');
//     } catch (e) {
//       setState(() {
//         _statusMessage = 'Error sending message: $e';
//       });
//     }
//   }
//
//   void _receiveMessage(Uint8List response) {
//     setState(() {
//       _receivedText = String.fromCharCodes(response);
//       _statusMessage = 'Message received!';
//     });
//     _sendReceiveResponse();
//   }
//
//   void _sendReceiveResponse() async {
//     if (_isoDep == null) {
//       print('Error: _isoDep is null');
//       return;
//     }
//
//     try {
//       final response = await _isoDep!.transceive(data: _apduReceiveResponse);
//       print(
//           'Sent receive response command: $_apduReceiveResponse, Response: $response');
//     } catch (e) {
//       print('Error sending receive response: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('NFC Peer-to-Peer Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Send: $_textToSend'),
//             Text('Received: $_receivedText'),
//             Text('Status: $_statusMessage'),
//             ElevatedButton(
//               onPressed: _sendMessage,
//               child: const Text('Send Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
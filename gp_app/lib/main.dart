import 'package:flutter/material.dart';
import 'package:gp_app/screens/Login_Signup/screens/welcome_screen.dart';
import 'package:gp_app/screens/Login_Signup/themes/theme.dart';
import 'package:gp_app/screens/mm/Navigation_Bar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  runApp(const MyApp());
  await dotenv.load(fileName: ".env");
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
//
// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:nfc_manager/nfc_manager.dart';
// import 'package:nfc_manager/platform_tags.dart';
//
// class IsoDepNfcReaderWriter extends StatefulWidget {
//   @override
//   _IsoDepNfcReaderWriterState createState() => _IsoDepNfcReaderWriterState();
// }
//
// class _IsoDepNfcReaderWriterState extends State<IsoDepNfcReaderWriter> {
//   String _readFromNfcTag = "";
//   final TextEditingController _writeController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ISO-DEP NFC Reader Writer"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _writeController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () => _writeIsoDepNfcTag(_writeController.text),
//               child: const Text("Write"),
//             ),
//             Text(_readFromNfcTag),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _writeIsoDepNfcTag(String record) async {
//     NfcManager.instance.startSession(onDiscovered: (NfcTag badge) async {
//       IsoDep? isoDep = IsoDep.from(badge);
//       if (isoDep!= null) {
//         try {
//           await isoDep.connect();
//           await isoDep.transceive(Uint8List.fromList([0x90, 0x00, 0x00, 0x00, 0x05]));
//           await isoDep.transceive(Uint8List.fromList(record.codeUnits));
//           await isoDep.close();
//         } catch (e) {
//           NfcManager.instance.stopSession(errorMessage: "Error while writing to badge");
//         }
//       }
//       NfcManager.instance.stopSession();
//     });
//   }
//
//   void _readIsoDepNfcTag() async {
//     NfcManager.instance.startSession(onDiscovered: (NfcTag badge) async {
//       IsoDep isoDep = IsoDep.from(badge);
//       if (isoDep!= null) {
//         try {
//           await isoDep.connect();
//           Uint8List response = await isoDep.transceive(Uint8List.fromList([0x90, 0x00, 0x00, 0x00, 0x05]));
//           setState(() {
//             _readFromNfcTag = String.fromCharCodes(response);
//           });
//           await isoDep.close();
//         } catch (e) {
//           // Show a snackbar for example
//         }
//       }
//       NfcManager.instance.stopSession();
//     });
//   }
// }
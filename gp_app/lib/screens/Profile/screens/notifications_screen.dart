import 'package:flutter/material.dart';
// import '../components/custom_text_field.dart';
import '../components/custom_switch.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen();

  @override
  State<NotificationsScreen> createState() => _ChangeUsernameScreenState();
}

class _ChangeUsernameScreenState extends State<NotificationsScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notication settings',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.025)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.03),
                            child: Text(
                              'Enable notifications?',
                              style:TextStyle(
                                fontSize: MediaQuery.of(context).size.height *
                                    0.025,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        CustomSwitch(
                          isSwitched: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = !isSwitched;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

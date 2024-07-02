import 'package:flutter/material.dart';
import 'package:gp_app/screens/Login_Signup/screens/signin_screen.dart';
import '../components/profile_tile.dart';
import 'my_account_screen.dart';
import 'notifications_screen.dart';
import 'help_center_screen.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.025)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    //   backgroundImage: AssetImage(
                    //       'assets/images/profile_pic.png'), // Replace with your image URL
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {
                        // Handle camera button press
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Expanded(
              child: ListView(
                children: [
                  profile_tile(
                      context: context,
                      icon: Icons.person_outline,
                      title: 'My Account',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyAccountScreen()));
                      }),
                  profile_tile(
                      context: context,
                      icon: Icons.notifications_outlined,
                      title: 'Notifications',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationsScreen()));
                      }),
                  profile_tile(
                      context: context,
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {
                        // Navigate to Settings
                      }),
                  profile_tile(
                      context: context,
                      icon: Icons.help_outline,
                      title: 'Help Center',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpCenterScreen()));
                      }),
                  profile_tile(
                      context: context,
                      icon: Icons.logout,
                      title: 'Log Out',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text('Log out of your account?',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.025,
                                      fontWeight: FontWeight.w500)),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('CANCEL',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          fontWeight: FontWeight.w500,
                                          color: Colors
                                              .red)), // Changed to red color
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('LOG OUT',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue)),
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (e) => SignInScreen(),
                                        ),
                                        (Route<dynamic> route) => false);
                                    // Handle log out action
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

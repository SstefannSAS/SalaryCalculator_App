import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/features/user_auth/presentation/pages/homepage/home_page.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  _SettingspageState createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  bool valueNotify1 = true;
  bool valueNotify2 = false;
  bool valueNotify3 = true;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valueNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valueNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valueNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            const SizedBox(height: 10),
            buildAccountOption(context, 'Change Password'),
            buildAccountOption(context, 'Content Settings'),
            buildAccountOption(context, 'Social'),
            buildAccountOption(context, 'Language'),
            buildAccountOption(context, 'Privacy and Security'),
            const SizedBox(height: 40),
            const Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.blue,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            const SizedBox(height: 10),
            buildNotificationOption(
                'Theme Dark', valueNotify1, onChangeFunction1),
            buildNotificationOption(
                'Acount Activity', valueNotify2, onChangeFunction2),
            buildNotificationOption(
                'Opportunity', valueNotify3, onChangeFunction3),
            const SizedBox(height: 50),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'SIGN OUT',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Sign Out'),
                          content: const Text('Dou you want to Sign Out?'),
                          actions: [
                            TextButton(
                              child: const Text('No'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: const Text('Yes'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

GestureDetector buildAccountOption(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Option1'),
                    Text('Option2'),
                  ]),
              actions: [
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}

Padding buildNotificationOption(
    String title, bool value, Function onChangeMethod) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              }),
        ),
      ],
    ),
  );
}

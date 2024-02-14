import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/global/common/toast.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime today = DateTime.now();
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SALARY CALCULATOR"),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 22, 116, 192),
        child: Column(
          children: [
            const DrawerHeader(
              child: Icon(
                Icons.wallet,
                color: Colors.white,
                size: 50,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('H O M E'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/homepage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('S E T T I N G S'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settingspage');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign Out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/login');
                showToast(message: 'Successfully signed out');
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Worked Hours:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff1D1617).withOpacity(0.20),
                  blurRadius: 40,
                  spreadRadius: 0.0,
                )
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                hintStyle:
                    const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Overtime Hours:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff1D1617).withOpacity(0.20),
                  blurRadius: 40,
                  spreadRadius: 0.0,
                )
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                hintStyle:
                    const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                child: TableCalendar(
                  locale: "en_US",
                  rowHeight: 43,
                  headerStyle: const HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  firstDay: DateTime.utc(2023, 01, 01),
                  lastDay: DateTime.utc(2024, 12, 31),
                  focusedDay: today,
                  onDaySelected: (selectedDay, focusedDay) async {
                    var result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Enter your schedule'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Start time',
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'End time',
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );

                    // Do something with the result
                    print(result);
                  },
                  calendarStyle: const CalendarStyle(
                    outsideDaysVisible: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 290),
                child: FloatingActionButton(
                  onPressed: () {
                    // Deschide o fereastră pentru introducerea salariului
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Enter your salary'),
                          content: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Salary',
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // Salvați salariul
                                Navigator.pop(context);
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  backgroundColor: const Color.fromARGB(255, 25, 196, 226),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

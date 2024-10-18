import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  Widget myContacts = const MyContacts();
  Widget myEmails = const MyEmails();
  Widget myProfile = const MyProfile();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomNavigationBar Example"),
      ),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.amber[800],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: "Emails",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          )
        ],
        onTap: (int index) {
          onTapHandler(index);
        },
      ),
    );
  }

  Widget getBody() {
    if (selectedIndex == 0) {
      return myContacts;
    } else if (selectedIndex == 1) {
      return myEmails;
    } else {
      return myProfile;
    }
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class MyContacts extends StatelessWidget {
  const MyContacts({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Contacts"));
  }
}

class MyEmails extends StatelessWidget {
  const MyEmails({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Emails"));
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile"));
  }
}

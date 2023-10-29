import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: const Color.fromARGB(255, 144, 255, 244),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _icon(),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(height: 5),
              DashboardIconsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: const Color.fromARGB(255, 98, 255, 239), width: 2),
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/risa.jpg'),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "Tarisa Ramadhani",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.teal),
                )),
            const Text(
              "21670080",
              style: TextStyle(fontSize: 18, color: Colors.teal),
            ),
            const Text(
              "5A",
              style: TextStyle(fontSize: 18, color: Colors.teal),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DashboardIconsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      children: <Widget>[
        DashboardIcon(
          icon: Icons.person,
          label: "Profile",
          iconColor: Colors.teal,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
        ),
        DashboardIcon(
          icon: Icons.phone,
          label: "Phone",
          iconColor: Colors.teal,
        ),
        DashboardIcon(
          icon: Icons.email,
          label: "Email",
          iconColor: Colors.teal,
        ),
        DashboardIcon(
          icon: Icons.settings,
          label: "Settings",
          iconColor: Colors.teal,
        ),
      ],
    );
  }
}

class DashboardIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color iconColor;

  DashboardIcon({
    required this.icon,
    required this.label,
    this.onPressed = _dummyOnPressed,
    this.iconColor = const Color.fromARGB(255, 67, 73, 78),
  });

  static void _dummyOnPressed() {
    print("Tombol belum dikonfigurasi.");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              icon,
              color: iconColor,
            ),
            iconSize: 50,
            onPressed: onPressed,
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.teal),
          )
        ],
      ),
    );
  }
}

Widget _icon() {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal, width: 2),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.person, color: Colors.teal, size: 150),
      ),
    ],
  );
}

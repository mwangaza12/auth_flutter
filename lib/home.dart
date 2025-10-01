import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green.shade900,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Welcome to the Home Screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65, // narrower drawer
        child: Drawer(
          elevation: 2, // small shadow
          child: Column(
            children: [
              Container(
                color: Colors.green.shade900,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 35, color: Colors.green),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "John Doe",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      "john.doe@email.com",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              _buildDrawerItem(
                icon: Icons.home,
                text: "Home",
                onTap: () => Navigator.pushReplacementNamed(context, '/home'),
              ),
              _buildDrawerItem(
                icon: Icons.person,
                text: "Profile",
                onTap: () {},
              ),
              _buildDrawerItem(
                icon: Icons.settings,
                text: "Settings",
                onTap: () {},
              ),
              const Spacer(),
              const Divider(),
              _buildDrawerItem(
                icon: Icons.logout,
                text: "Logout",
                color: Colors.red,
                onTap: () => Navigator.pushReplacementNamed(context, '/login'),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  // helper widget for drawer items
  static Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, size: 20, color: color ?? Colors.green.shade900),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 14, // smaller font size
          fontWeight: FontWeight.w500,
          color: color ?? Colors.black87,
        ),
      ),
      onTap: onTap,
      dense: true, // makes tile more compact
      visualDensity: const VisualDensity(vertical: -2), // reduce height
    );
  }
}

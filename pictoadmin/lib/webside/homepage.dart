import 'package:flutter/material.dart';
import 'package:pictoadmin/webside/postpage.dart';
import 'package:pictoadmin/webside/userpage.dart';
import 'package:pictoadmin/webside/adminlogin.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({Key? key}) : super(key: key);

  // Function to log out admin and redirect to admin login page
  void logoutAdmin(BuildContext context) {
    // Add any additional logout logic here (e.g., clear session, tokens, etc.)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const AdminLogin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            onPressed: () => logoutAdmin(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserPage()),
                );
              },
              child: const Text('View Users'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ManagePosts()),
                );
              },
              child: const Text('View Posts'),
            ),
          ],
        ),
      ),
    );
  }
}

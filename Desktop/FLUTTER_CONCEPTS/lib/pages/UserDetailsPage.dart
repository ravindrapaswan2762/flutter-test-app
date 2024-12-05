import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserDetailsPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.orange.shade100,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.orange,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user['name'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Divider(thickness: 1, height: 30, color: Colors.grey.shade300),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user['email'],
                  style: TextStyle(fontSize: 16),
                ),
                Divider(thickness: 1, height: 30, color: Colors.grey.shade300),
                Text(
                  'Phone',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user['phone'] ?? "N/A",
                  style: TextStyle(fontSize: 16),
                ),
                Divider(thickness: 1, height: 30, color: Colors.grey.shade300),
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user['address'] ?? "N/A",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '© 2024 My Application | Footer Text',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),

    );
  }
}

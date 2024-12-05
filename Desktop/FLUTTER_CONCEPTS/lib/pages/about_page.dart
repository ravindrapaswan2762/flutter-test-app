import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Welcome to the About Page!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade700,
              ),
            ),
            SizedBox(height: 20),

            // Description text
            Text(
              'We are excited to introduce you to our app. It is designed to help users manage data effectively and efficiently. Whether you are looking to track progress, analyze statistics, or visualize data, our app has got you covered.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),
            SizedBox(height: 20),

            // Section Title
            Text(
              'Key Features:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade700,
              ),
            ),
            SizedBox(height: 10),

            // Feature List
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFeatureItem('• Easy Data Management'),
                _buildFeatureItem('• Visualize Progress in Real-time'),
                _buildFeatureItem('• User-friendly Interface'),
                _buildFeatureItem('• Secure Data Storage'),
              ],
            ),
            SizedBox(height: 20),

            // Contact Us Section
            Text(
              'Contact Us:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'For any questions or support, feel free to reach out to us at:',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.email, color: Colors.orange, size: 30),
                SizedBox(width: 10),
                Text(
                  'support@app.com',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Footer Section
            Spacer(),
            Divider(),
            SizedBox(height: 10),
            Text(
              'App Version 1.0.0',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create a feature item
  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        feature,
        style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
      ),
    );
  }
}

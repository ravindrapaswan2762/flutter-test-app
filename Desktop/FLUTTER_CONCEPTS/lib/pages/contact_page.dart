import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../helper/database_helper.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  late DatabaseHelper _dbHelper;

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper();
  }

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _submitForm() async {
    final _dbHelper = DatabaseHelper();
    print("submit form called");

    if (_formKey.currentState!.validate()) {
      // Collect form data
      final Map<String, dynamic> newUser = {
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'address': addressController.text,
        'message': messageController.text, // Add the 'message' field
      };
      print("newUser: $newUser");

      // Save data locally in SQLite
      try {
        int res = await _dbHelper.addUser(newUser); // Get the inserted row ID
        print("Inserted Row ID: $res");

        if (res > 0) {
          // Show success dialog
          // _showDialog(context, 'Success', 'Your data has been saved locally.');
          print("Your data has been saved locally.");

          // Clear form fields
          nameController.clear();
          emailController.clear();
          phoneController.clear();
          addressController.clear();
          messageController.clear();
        } else {
          // _showDialog(context, 'Error', 'Failed to save data. Please try again.');
          print("Failed to save data. Please try again.");
        }
      } catch (e) {
        print("Error while saving data: $e");
        // _showDialog(context, 'Error', 'An unexpected error occurred.');
        print("An unexpected error occurred.");
      }
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Page'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Get in Touch',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'We’d love to hear from you! Please fill out the form below.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            buildTextField(
                              controller: nameController,
                              label: 'Name',
                              icon: Icons.person,
                              hintText: 'Enter your full name',
                            ),
                            buildTextField(
                              controller: emailController,
                              label: 'Email',
                              icon: Icons.email,
                              hintText: 'Enter your email address',
                              keyboardType: TextInputType.emailAddress,
                            ),
                            buildTextField(
                              controller: phoneController,
                              label: 'Phone',
                              icon: Icons.phone,
                              hintText: 'Enter your phone number',
                              keyboardType: TextInputType.phone,
                            ),
                            buildTextField(
                              controller: addressController,
                              label: 'Address',
                              icon: Icons.location_on,
                              hintText: 'Enter your address',
                            ),
                            buildTextField(
                              controller: messageController,
                              label: 'Message',
                              icon: Icons.message,
                              hintText: 'Enter your message',
                              maxLines: 4,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 32),
                              ),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.orange),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $label';
          }
          return null;
        },
      ),
    );
  }
}

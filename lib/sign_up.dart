import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';

  void _submitForm() {
    // Check if the form is valid
    if (_formKey.currentState!.validate()) {
      // Save the form data
      _formKey.currentState!.save();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // Title of the dialog
            title: Text('Form Submitted'),

            content: Text(
              'Name: $_name\nEmail: $_email\n Password: $_password',
            ),

            // Display the entered name and email
            actions: <Widget>[
              TextButton(
                child: Text('OK', style: TextStyle(color: Colors.green)),

                // Button to close the dialog
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        backgroundColor: Colors.green.shade900,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter name',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your name";
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Email',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your email";
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Enter password',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your password";
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/Authprovider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // User registered successfully, handle the registered user
      // Navigate to the home screen or perform any other necessary actions
    } catch (e) {
      // Handle registration errors
      print(e.toString());
    }
  }

  void _goToLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
        'Register',
        style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
    ),
    ),
    centerTitle: true,
    ),
    body: Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    TextField(
    controller: _emailController,
    decoration: InputDecoration(
    labelText: 'Email',
    filled: true,
    fillColor: Colors.grey[200],
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide.none,
    ),
    ),
    ),
    SizedBox(height: 16.0),
    TextField(
    controller: _passwordController,
    decoration: InputDecoration(
    labelText: 'Password',
    filled: true,
    fillColor: Colors.grey[200],
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide.none,
    ),
    ),
    obscureText: true,
    ),
    SizedBox(height: 24.0),
    ElevatedButton(
    onPressed: () async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    // Perform registration logic
    await authProvider.register();

    // Check if registration was successful
    if (authProvider.isLoggedIn) {
    // Navigate to the login screen
    Navigator.pushReplacementNamed(context, '/login');
    } else {
    // Handle registration failure
    // Show an error message or perform any necessary action
    }},
    style: ElevatedButton.styleFrom(
    primary: Colors.blue,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
    ),
    padding: EdgeInsets.symmetric(vertical: 16.0),
    ),
    child: Text(
    'Register',
    style: TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    SizedBox(height: 16.0),
    TextButton(
    onPressed: _goToLoginScreen,
    child: Text(
    'Already have an account? Login',
    style: TextStyle(
    color: Colors.blue,
    fontSize: 16,
    ),
    ),
    ),
    ],
    ),
    ),
    );
    }
  }

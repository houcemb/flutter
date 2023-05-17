import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/screens/auth/login_screen.dart';
import 'package:todo_app/screens/tasks/task_list_screen.dart';
import 'package:todo_app/main.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  HomeScreen({required this.user});

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _goToTasksScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskListScreen(user: user,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${user.displayName}!', // Display the user's name
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _goToTasksScreen(context),
              // Navigate to TasksScreen
              child: Text('Tasks'),
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _logout(context),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/tasks/add_task_screen.dart';
import 'screens/tasks/edit_task_screen.dart';
import 'screens/tasks/task_detail_screen.dart';
import 'screens/tasks/task_list_screen.dart';
import 'screens/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> checkLoggedIn() async {
    return _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<User?>(
        future: checkLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading spinner while checking the user's login status
            return CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              // User is logged in, navigate to home screen
              return HomeScreen(user: snapshot.data!);
            } else {
              // User is not logged in, navigate to login screen
              return LoginScreen();
            }
          }
        },
      ),
      routes: {
        '/register': (context) => RegisterScreen(),
        '/addTask': (context) => AddTaskScreen(),


      },
    );
  }
}

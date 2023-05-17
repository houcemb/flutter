import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/screens/tasks/add_task_screen.dart';
import 'package:todo_app/screens/tasks/edit_task_screen.dart';
import 'package:todo_app/screens/tasks/task_detail_screen.dart';

class TaskListScreen extends StatelessWidget {
  final User? user;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TaskListScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Task List'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _firestore
              .collection('tasks')
              .where('userId', isEqualTo: user?.uid)
              .orderBy('category')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error fetching tasks');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            List<QueryDocumentSnapshot> tasks = snapshot.data?.docs ?? [];

            if (tasks.isEmpty) {
              return Center(
                child: Text('No tasks found'),
              );
            }

            // Create a map to group tasks by category
            Map<String, List<QueryDocumentSnapshot>> tasksByCategory = {};
            for (var task in tasks) {
              final taskCategory = task['category'];
              if (tasksByCategory.containsKey(taskCategory)) {
                tasksByCategory[taskCategory]!.add(task);
              } else {
                tasksByCategory[taskCategory] = [task];
              }
            }

            return ListView.builder(
              itemCount: tasksByCategory.length,
              itemBuilder: (context, index) {
                final category = tasksByCategory.keys.elementAt(index);
                final categoryTasks = tasksByCategory[category]!;

                return ExpansionTile(
                  title: Text(category),
                  children: categoryTasks.map((task) {
                    final taskId = task.id;
                    final taskName = task['title'];
                    final isCompleted = task['isCompleted'] ?? false;

                    return ListTile(
                      title: Text(taskName),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              _firestore
                                  .collection('tasks')
                                  .doc(taskId)
                                  .delete()
                                  .then((_) {
                                print('Task deleted');
                              }).catchError((error) {
                                print('Error deleting task: $error');
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditTaskScreen(task: task),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ],
                      ),
                      leading: Checkbox(
                        value: isCompleted,
                        onChanged: (value) {
                          _firestore
                              .collection('tasks')
                              .doc(taskId)
                              .update({'isCompleted': value})
                              .then((_) {
                            print('Task completion status updated');
                          }).catchError((error) {
                            print(
                                'Error updating task completion status: $error');
                          });
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TaskDetailsScreen(task: task),
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
      Navigator.push(            context,
        MaterialPageRoute(builder: (context) => AddTaskScreen()),
      );
        },
          child: Icon(Icons.add),
        ),
    );
  }
}


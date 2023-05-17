import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addTask(Task task) async {
    try {
      await _firestore.collection('tasks').doc(task.id).set({
        'title': task.title,
        'description': task.description,
        'dueDate': task.dueDate,
        'isCompleted': task.isCompleted,
      });
    } catch (e) {
      // Handle add task errors
      print(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _firestore.collection('tasks').doc(task.id).update({
        'title': task.title,
        'description': task.description,
        'dueDate': task.dueDate,
        'isCompleted': task.isCompleted,
      });
    } catch (e) {
      // Handle update task errors
      print(e.toString());
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await _firestore.collection('tasks').doc(taskId).delete();
    } catch (e) {
      // Handle delete task errors
      print(e.toString());
    }
  }

  Stream<List<Task>> getTaskList() {
    return _firestore.collection('tasks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Task(
          id: doc.id,
          title: doc['title'],
          description: doc['description'],
          dueDate: doc['dueDate'],
          isCompleted: doc['isCompleted'],
          userId: doc['userId'],
          category: doc['category']

        );
      }).toList();
    });
  }
}

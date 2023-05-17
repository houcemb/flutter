import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../services/firestore_service.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  FirestoreService _firestoreService = FirestoreService();

  List<Task> get tasks => _tasks;

  Stream<List<Task>> get taskStream => _firestoreService.getTaskList();

  Future<void> fetchTasks() async {
    try {
      _tasks = await _firestoreService.getTaskList().first;
      notifyListeners();
    } catch (e) {
      // Handle error
      print(e.toString());
    }
  }

  Future<void> addTask(Task task) async {
    try {
      await _firestoreService.addTask(task);
    } catch (e) {
      // Handle error
      print(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _firestoreService.updateTask(task);
    } catch (e) {
      // Handle error
      print(e.toString());
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await _firestoreService.deleteTask(taskId);
    } catch (e) {
      // Handle error
      print(e.toString());
    }
  }
}

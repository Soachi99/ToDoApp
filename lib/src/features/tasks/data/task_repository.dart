import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/common/firebase_cloud_service.dart';
import 'package:todoapp/src/features/tasks/domain/task.dart';

class TaskRepository {
  Future<List<Task>> getTasks({required String id}) async {
    List<Task> tasks = [];
    try {
      var response =
          await firebaseService.getCollection(collection: "Task/$id/Tasks");

      tasks = response.docs.map((e) => Task.fromMap(e.data())).toList();
    } catch (e) {
      log("No se encontraron tareas");
    }

    return tasks;
  }

  updateTask({required String id, required Task task}) async {
    await firebaseService.updateDocument(
        documentID: task.id, data: task.toMap(), collection: "Task/$id/Tasks");
  }
}

final taskRepositoryProvider = Provider<TaskRepository>(
  (ref) => TaskRepository(),
);

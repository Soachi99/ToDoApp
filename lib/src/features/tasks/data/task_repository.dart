import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskRepository {}

final splashRepositoryProvider = Provider.autoDispose<TaskRepository>(
  (ref) => TaskRepository(),
);

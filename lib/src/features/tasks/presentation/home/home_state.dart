// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todoapp/src/features/tasks/domain/task.dart';

class HomeState {
  final List<Task>? tasks;

  HomeState({this.tasks});

  HomeState copyWith({
    List<Task>? tasks,
  }) {
    return HomeState(
      tasks: tasks ?? this.tasks,
    );
  }
}

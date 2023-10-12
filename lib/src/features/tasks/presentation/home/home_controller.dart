import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/src/features/tasks/data/task_repository.dart';
import 'package:todoapp/src/features/tasks/domain/task.dart';
import 'home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  final TaskRepository taskRepository;

  int filterStateAux = 0;

  HomeController({required this.taskRepository}) : super(HomeState());

  Future<void> getTasks() async {
    state = state.copyWith(tasks: await taskRepository.getTasks(id: "12345"));
  }

  Future<void> updateTask(
      {required bool currentState, required String taskId}) async {
    Task task = state.tasks!.firstWhere((element) => element.id == taskId);
    task.state = currentState;

    await taskRepository.updateTask(id: "12345", task: task);
    await filterByState(filterStateAux);
  }

  filterByState(int filterState) async {
    List<Task> tasks = await taskRepository.getTasks(id: "12345");
    state = state.copyWith(tasks: []);
    filterStateAux = filterState;
    switch (filterState) {
      case 1:
        state = state.copyWith(
            tasks: tasks.where((element) => element.state == true).toList());
        break;
      case 2:
        state = state.copyWith(
            tasks: tasks.where((element) => element.state == false).toList());
        break;
      default:
        state = state.copyWith(tasks: tasks);
        break;
    }
  }
}

final homeController = StateNotifierProvider<HomeController, HomeState>((ref) {
  return HomeController(taskRepository: ref.watch(taskRepositoryProvider));
});

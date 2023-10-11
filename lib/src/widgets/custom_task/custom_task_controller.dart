import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/src/widgets/custom_task/custom_task_state.dart';

class CustomTaskController extends StateNotifier<CustomTaskState> {
  CustomTaskController() : super(CustomTaskState());

  toogleExpand() {
    state = state.copyWith(expand: !state.expand, completed: state.completed);
  }

  toogleCompleted() {
    state = state.copyWith(expand: state.expand, completed: !state.completed);
  }
}

final customTaskController = StateNotifierProvider.autoDispose
    .family<CustomTaskController, CustomTaskState, int>(
        (ref, arg) => CustomTaskController());

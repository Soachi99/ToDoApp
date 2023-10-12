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

  setCurrentState(bool currentState) {
    state = state.copyWith(expand: false, completed: currentState);
  }
}

final customTaskController = StateNotifierProvider.autoDispose
    .family<CustomTaskController, CustomTaskState, String>(
        (ref, arg) => CustomTaskController());

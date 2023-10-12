import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/src/widgets/custom_filter/custom_filter_state.dart';

class CustomFilterController extends StateNotifier<CustomFilterState> {
  CustomFilterController() : super(CustomFilterState());

  /// Funcion para cambiar el estado de filtro
  /// 0 -> Todas
  /// 1 -> Tareas Completadas
  /// 2 -> Tareas Incompletas
  setFilterState(int filterState) {
    state = state.copyWith(filterState: filterState);
  }
}

final customFilterController = StateNotifierProvider.autoDispose<
    CustomFilterController,
    CustomFilterState>((ref) => CustomFilterController());

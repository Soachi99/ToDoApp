import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/generated/l10n.dart';
import 'package:todoapp/src/tools/tools.dart';

import 'package:todoapp/src/widgets/custom_button.dart';
import 'package:todoapp/src/widgets/custom_filter/custom_filter_controller.dart';

typedef Callback = void Function(int filterState);

class CustomFilter extends ConsumerWidget {
  final Callback callback;

  const CustomFilter({required this.callback, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(customFilterController.notifier);
    var state = ref.watch(customFilterController);
    double standartWidht = (dimens.fullWidth(context) - 32) / 3;

    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 16, left: 16),
      child: Row(
        children: [
          CustomButton(
              width: standartWidht,
              label: S.of(context).filterCompleted,
              color: state.filterState == 1 ? customColors.colors[2] : null,
              textColor: state.filterState == 1 ? customColors.colors[1] : null,
              onPressed: () => onOptionSelected(
                  filterState: 1, controller: controller, callback: callback)),
          CustomButton(
              width: standartWidht,
              label: S.of(context).filterIncompleted,
              color: state.filterState == 2 ? customColors.colors[2] : null,
              textColor: state.filterState == 2 ? customColors.colors[1] : null,
              onPressed: () => onOptionSelected(
                  filterState: 2, controller: controller, callback: callback)),
          CustomButton(
              width: standartWidht,
              label: S.of(context).filterAll,
              color: state.filterState == 0 ? customColors.colors[2] : null,
              textColor: state.filterState == 0 ? customColors.colors[1] : null,
              onPressed: () => onOptionSelected(
                  filterState: 0, controller: controller, callback: callback))
        ],
      ),
    );
  }
}

onOptionSelected(
    {required int filterState,
    required CustomFilterController controller,
    required Callback callback}) {
  controller.setFilterState(filterState);
  callback(filterState);
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/src/tools/tools.dart';
import 'package:todoapp/src/widgets/custom_task/custom_task_controller.dart';
import 'package:todoapp/src/widgets/custom_text.dart';

typedef Callback = void Function(bool response, int taskNumber);

class CustomTask extends ConsumerWidget {
  /// Titulo del botón
  final String label;

  /// Numero de la tarea
  final int taskNumber;

  /// Callback
  final Callback callback;
  const CustomTask({
    super.key,
    required this.label,
    required this.callback,
    required this.taskNumber,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(customTaskController(taskNumber).notifier);
    var state = ref.watch(customTaskController(taskNumber));

    return Material(
      borderRadius: dimens.borderRadiusContainer(10),
      color: state.expand ? customColors.colors[2] : customColors.colors[3],
      child: InkWell(
        borderRadius: dimens.borderRadiusContainer(10),
        onTap: () => controller.toogleExpand(),
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        radius: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: dimens.fullWidth(context) * .7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(label,
                        overflow: TextOverflow.ellipsis,
                        maxLines: state.expand ? 100 : 1,
                        textColor:
                            state.expand ? customColors.colors[1] : null),
                    CustomText(state.completed ? "Completa" : "Incompleta",
                        fontSize: 12,
                        textColor: state.expand ? customColors.colors[1] : null)
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  controller.toogleCompleted();
                  callback(state.completed, taskNumber);
                },
                child: Image.asset(
                  state.completed ? images.check : images.late,
                  height: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

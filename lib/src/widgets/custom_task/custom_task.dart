import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/generated/l10n.dart';
import 'package:todoapp/src/tools/tools.dart';
import 'package:todoapp/src/widgets/custom_task/custom_task_controller.dart';
import 'package:todoapp/src/widgets/custom_text.dart';

typedef Callback = void Function(bool response, String taskId);

class CustomTask extends ConsumerStatefulWidget {
  final String label;

  /// Numero de la tarea
  final String taskId;

  /// Estado actual de la tarea
  final bool currentState;

  /// Callback
  final Callback callback;
  const CustomTask(
      {required this.label,
      required this.taskId,
      required this.currentState,
      required this.callback,
      Key? key})
      : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomTaskState();
}

class _CustomTaskState extends ConsumerState<CustomTask> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref
          .watch(customTaskController(widget.taskId).notifier)
          .setCurrentState(widget.currentState);
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomTask oldWidget) {
    super.didUpdateWidget(oldWidget);
    Future.delayed(Duration.zero, () {
      ref
          .watch(customTaskController(widget.taskId).notifier)
          .setCurrentState(widget.currentState);
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(customTaskController(widget.taskId).notifier);
    var state = ref.watch(customTaskController(widget.taskId));
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Material(
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
                      CustomText(widget.label,
                          overflow: TextOverflow.ellipsis,
                          maxLines: state.expand ? 100 : 1,
                          textColor:
                              state.expand ? customColors.colors[1] : null),
                      CustomText(
                          state.completed
                              ? S.of(context).completed
                              : S.of(context).incompleted,
                          fontSize: 12,
                          textColor:
                              state.expand ? customColors.colors[1] : null)
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    widget.callback(!state.completed, widget.taskId);
                    controller.toogleCompleted();
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todoapp/src/features/tasks/domain/task.dart';
import 'package:todoapp/src/features/tasks/presentation/home/home_controller.dart';
import 'package:todoapp/src/tools/tools.dart';
import 'package:todoapp/src/widgets/custom_filter/custom_filter.dart';
import 'package:todoapp/src/widgets/custom_task/custom_task.dart';

class TasksContainer extends StatelessWidget {
  final HomeController controller;
  final List<Task> tasks;

  const TasksContainer({
    Key? key,
    required this.tasks,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimens.fullHeight(context) * .8,
      decoration: BoxDecoration(
        color: customColors.colors[1],
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50)),
      ),
      child: Column(
        children: [
          CustomFilter(
            callback: (filterState) => controller.filterByState(filterState),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => CustomTask(
                        label: tasks[index].name,
                        taskId: tasks[index].id,
                        currentState: tasks[index].state,
                        callback: (response, taskId) async =>
                            await controller.updateTask(
                          currentState: response,
                          taskId: taskId,
                        ),
                      ),
                      childCount: tasks.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

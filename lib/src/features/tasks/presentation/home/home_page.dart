import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/generated/l10n.dart';
import 'package:todoapp/src/features/tasks/presentation/home/widgets/custom_bar.dart';
import 'package:todoapp/src/tools/custom_colors.dart';
import 'package:todoapp/src/tools/dimens.dart';
import 'package:todoapp/src/widgets/custom_button.dart';
import 'package:todoapp/src/widgets/custom_task/custom_task.dart';
import 'package:todoapp/src/widgets/custom_text.dart';

import 'home_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(homeController.notifier);
    var state = ref.watch(homeController);
    var text = S.of(context);

    return Scaffold(
      backgroundColor: customColors.colors[2],
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                  child: CustomText(
                "${DateTime.now().day} ${DateFormat('MMMM').format(DateTime.now())}",
                textColor: customColors.colors[1],
                fontWeight: FontWeight.w700,
              )),
              const SizedBox(height: 30),
              CustomBar(text: text),
              const SizedBox(height: 30),
              const TasksContainer()
            ],
          ),
        ),
      ),
    );
  }
}

class TasksContainer extends StatelessWidget {
  const TasksContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: customColors.colors[1],
            borderRadius:
                const BorderRadius.only(topLeft: Radius.circular(50))),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomTask(
                    label: "Tarea $index",
                    taskNumber: index,
                    callback: (response, taskNumber) =>
                        log("Tarea $taskNumber, estado completado = $response"),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                itemCount: 10)),
      ),
    );
  }
}

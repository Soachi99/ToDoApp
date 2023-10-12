import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:todoapp/generated/l10n.dart';

import 'package:todoapp/src/features/tasks/presentation/home/widgets/custom_bar.dart';
import 'package:todoapp/src/features/tasks/presentation/home/widgets/tasks_container.dart';
import 'package:todoapp/src/tools/custom_colors.dart';
import 'package:todoapp/src/widgets/custom_text.dart';

import 'home_controller.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<HomePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await ref.watch(homeController.notifier).getTasks();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              TasksContainer(
                tasks: state.tasks ?? [],
                controller: controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/src/tools/custom_colors.dart';
import 'package:todoapp/src/tools/dimens.dart';
import 'package:todoapp/src/widgets/custom_button.dart';
import 'package:todoapp/src/widgets/custom_text.dart';

import 'home_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(homeController.notifier);
    var state = ref.watch(homeController);

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      "Tus Tareas",
                      textColor: customColors.colors[1],
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                    CustomButton(
                        label: "Nueva Tarea", width: 120, onPressed: () {})
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: customColors.colors[1],
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

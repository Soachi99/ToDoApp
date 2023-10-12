import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/generated/l10n.dart';
import 'package:todoapp/src/tools/tools.dart';
import 'package:todoapp/src/widgets/custom_button.dart';
import 'package:todoapp/src/widgets/custom_text.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({
    super.key,
    required this.text,
  });

  final S text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text.yourTasks,
            textColor: customColors.colors[1],
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          CustomButton(
              label: text.newTask,
              width: 120,
              onPressed: () => Fluttertoast.showToast(msg: S.of(context).soon))
        ],
      ),
    );
  }
}

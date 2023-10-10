import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/generated/l10n.dart';
import 'package:todoapp/src/tools/custom_colors.dart';
import 'package:todoapp/src/tools/paths_images.dart';
import 'package:todoapp/src/tools/router.dart';
import 'package:todoapp/src/widgets/custom_text.dart';

// import 'splash_controller.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashState();
}

class _SplashState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => context.go(Routes.home));
  }

  @override
  Widget build(BuildContext context) {
    var text = S.of(context);
    return Scaffold(
      backgroundColor: customColors.colors[1],
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              images.icon,
              width: 200,
            ),
            const SizedBox(height: 20),
            CustomText(
              text.welcome,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              textColor: customColors.colors[2],
            ),
            const SpinKitSquareCircle(
              color: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

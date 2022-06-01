import 'package:ecommerce/controllers/launcher/launcher_controller.dart';
import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/global_methods.dart';
import 'package:ecommerce/screens/auth/auth_scene.dart';
import 'package:ecommerce/screens/home/sales/sales_scene.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LauncherScreen extends StatelessWidget {
  LauncherScreen({Key? key}) : super(key: key);
  final controller = LauncherController();

  @override
  Widget build(BuildContext context) {
    controller.hasValidAccssToken((isValid) {
      if (!isValid) {
        showAuthScreen(context);
      } else {
        showMainScreen(context);
      }
      appLog("Is valid token $isValid");
    });
    return Scaffold(
      backgroundColor: ColorPack.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCircle(color: Colors.white),
            SizedBox(
              height: 20,
            ),
            Text('Initializing',
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  void showAuthScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return AuthScreen();
        },
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  void showMainScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SalesScene();
        },
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}

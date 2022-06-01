import 'package:ecommerce/controllers/auth/auth_controller.dart';
import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/global_methods.dart';
import 'package:ecommerce/helpers/metrics.dart';
import 'package:ecommerce/screens/home/sales/sales_scene.dart';
import 'package:ecommerce/widgets/common/widgets/buttons/submit_button.dart';
import 'package:ecommerce/widgets/common/widgets/fields/input_field.dart';
import 'package:ecommerce/widgets/common/widgets/segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var controller = AuthController();
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    AlertController.onTabListener(
        (Map<String, dynamic>? payload, TypeAlert type) {
      print("$payload - $type");
    });
  }

  List<SegmentedControlItem> loginTypeSegments = [
    SegmentedControlItem(
      key: Key('login'),
      id: 0,
      title: 'Login',
    ),
    SegmentedControlItem(
      key: Key('register'),
      id: 1,
      title: 'Register',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPack.primary,
        body: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: loginForm(context),
              ),
            ),
            DropdownAlert(),
          ],
        ));
  }

  Widget loginForm(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPack.background,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      width: Design.responsiveWidth(375),
      margin: EdgeInsets.only(left: 16, right: 16, top: 120, bottom: 24),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child: _form(),
            padding: EdgeInsets.all(16),
          ),
          Positioned.fill(
              child: Visibility(
            child: Container(
              decoration: BoxDecoration(
                color: ColorPack.background.withAlpha(100),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: SpinKitCircle(
                color: ColorPack.primary,
                size: 40,
              ),
            ),
            visible: this.isLoading,
          ))
        ],
      ),
    );
  }

  Widget _form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SegmentedControl(items: loginTypeSegments),
        // Text("Gamers"),
        SizedBox(height: 16),
        InputField(controller.loginController, "Login", "Enter username"),
        SizedBox(height: 16),
        InputField(controller.passwordController, "Password", "••••••••••",
            isPassword: true),
        SizedBox(height: 16),
        TextButton(onPressed: () {}, child: Text("Forgot passwod ?")),
        SizedBox(height: 60),
        SubmitButton(formKey, "Login", () {
          login();
        }),
        SizedBox(height: 12),
      ],
    );
  }

  void login() {
    this.showLoading();
    controller.signIn((isOK) {
      this.hideLoading();
      isOK ? this.showSuccessLogin() : this.showFaliureLogin();
    });
  }

  void showFaliureLogin() {
    AlertController.show(
        "Failure!", "Incorrect login or password!", TypeAlert.error);
  }

  void showSuccessLogin() {
    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) {
      return SalesScene();
    }));
    // AlertController.show(
    // "Success!", "You have logged in successfully!", TypeAlert.success);
  }

  void showLoading() {
    setState(() {
      this.isLoading = true;
    });
  }

  void hideLoading() {
    setState(() {
      this.isLoading = false;
    });
  }
}

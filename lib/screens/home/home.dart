import 'package:ecommerce/helpers/media_provider.dart';
import 'package:ecommerce/helpers/metrics.dart';
import 'package:ecommerce/widgets/common/widgets/buttons/reduceable_button.dart';
import 'package:ecommerce/widgets/home/home_screen_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:screen/screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    var window = WidgetsBinding.instance.window;

    window.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance.handlePlatformBrightnessChanged();
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return scaffold(context);
  }

  Widget scaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: nav(context),
      body: HomeScreenBody(),
    );
  }

  PreferredSize nav(BuildContext context) {
    WidthType widthType = widthTypeWith(context);

    return PreferredSize(
      preferredSize: widthType == WidthType.large
          ? Size.fromHeight(60)
          : Size.fromHeight(44),
      child: SafeArea(
        left: false,
        right: false,
        child: navBody(context),
      ),
    );
  }

  Widget navBody(BuildContext context) {
    WidthType widthType = widthTypeWith(context);

    return Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.only(left: 16, right: 16),
      height: widthType == WidthType.large ? 60 : 44,
      child: Row(
        children: [
          (widthType == WidthType.large || widthType == WidthType.medium)
              ? Image.asset(Media.logo)
              : Text(
                  "Dashboard",
                  style: Theme.of(context).textTheme.headline6,
                ),
          Spacer(),
          ReduceableButton(
              widthType: widthType,
              title: "English",
              iconName: Media.iconGlobe),
          ReduceableButton(
              widthType: widthType,
              title: "My profile",
              iconName: Media.iconDefAvatar)
        ],
      ),
    );
  }

  HomeScreenState() {
    super.initState();
  }
}

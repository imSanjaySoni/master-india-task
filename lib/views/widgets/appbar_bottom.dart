import 'package:flutter/material.dart';
import 'package:masters_india/data/constants.dart';

class AppbarBottom extends StatelessWidget {
  const AppbarBottom({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      textStyle: TextStyle(color: Colors.white),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(22),
      ),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18),
          ),
          color: primaryColor,
        ),
        child: child,
      ),
    );
  }
}

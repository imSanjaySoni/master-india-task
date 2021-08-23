import 'package:flutter/material.dart';
import 'package:masters_india/data/constants.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.onPressed,
    required this.title,
    this.isBusy = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String title;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Material(
          type: MaterialType.button,
          borderRadius: BorderRadius.circular(4),
          color: isBusy ? primaryColor.withOpacity(0.6) : primaryColor,
          child: InkWell(
            onTap: isBusy ? null : onPressed,
            child: Container(
              height: 46,
              width: double.maxFinite,
              child: isBusy
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

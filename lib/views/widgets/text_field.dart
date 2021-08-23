import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    this.title,
    this.hintText,
    this.controller,
    this.onSubmit,
  }) : super(key: key);

  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final Function(String?)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...{
            Text(
              title ?? '',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 6),
          },
          TextFormField(
            controller: controller,
            onFieldSubmitted: onSubmit,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              filled: true,
              fillColor: Color(0xFFDDDDDD),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }
}

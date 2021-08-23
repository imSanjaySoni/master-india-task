import 'package:flutter/material.dart';

class TextContent extends StatelessWidget {
  const TextContent({
    Key? key,
    required this.title,
    this.content,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  final String title;
  final String? content;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        style: cardTitleStyle,
        children: [
          TextSpan(text: '$title\n'),
          TextSpan(text: '$content', style: cardTextStyle),
        ],
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  const ContentCard({Key? key, this.child, this.margin}) : super(key: key);
  final Widget? child;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(12),
      constraints: const BoxConstraints(
        minHeight: 70,
        minWidth: double.maxFinite,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}

const TextStyle cardTitleStyle = TextStyle(
  color: Colors.black,
  fontSize: 11,
  fontWeight: FontWeight.w300,
  height: 1.6,
);

final TextStyle cardTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

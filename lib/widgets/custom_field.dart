import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final Widget child;
  const CustomField({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

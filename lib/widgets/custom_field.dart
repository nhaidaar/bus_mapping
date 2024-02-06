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

class CustomDropdownField extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final Function(dynamic)? onChanged;
  const CustomDropdownField({super.key, required this.items, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        fillColor: Theme.of(context).highlightColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: items,
      value: items.first.value.toString(),
      onChanged: onChanged,
    );
  }
}

import 'package:flutter/material.dart';

import '../shared/theme.dart';

class CustomButtonWithArrow extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const CustomButtonWithArrow({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).focusColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Text(
              text,
              style: semiboldTS.copyWith(fontSize: 20),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String? iconUrl;
  final String text;
  final VoidCallback? onTap;
  const CustomButton({super.key, this.iconUrl, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).focusColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (iconUrl != null)
              Image.asset(
                iconUrl!,
                scale: 2,
              ),
            Text(
              text,
              style: semiboldTS.copyWith(fontSize: 18),
            ),
            if (iconUrl != null) Container(),
          ],
        ),
      ),
    );
  }
}

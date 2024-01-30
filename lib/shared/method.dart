import 'dart:math';

String randomDouble() {
  double randomNumber = Random().nextDouble() * (0.95 - 0.4) + 0.4;
  return randomNumber.toStringAsFixed(1);
}

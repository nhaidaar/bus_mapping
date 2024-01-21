import 'dart:math';

String randomDouble() {
  double randomNumber = Random().nextDouble() * 100.0;
  return randomNumber.toStringAsFixed(1);
}

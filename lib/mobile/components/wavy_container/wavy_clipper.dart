import 'package:flutter/material.dart';

const waveWidth = 20.0;
const waveHeight = 10.0;

class WavyClipper extends CustomClipper<Path> {
  final Size waveConstraints;

  const WavyClipper({
    Size? waveConstraints,
  }) : waveConstraints = waveConstraints ?? const Size(waveWidth, waveHeight);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    final wavesCount = size.width / waveConstraints.width;
    var currentWidthPointer = size.width;

    for (int i = 0; i < wavesCount / 2; i++) {
      currentWidthPointer -= waveConstraints.width;
      path.lineTo(currentWidthPointer, size.height - waveConstraints.height);
      currentWidthPointer -= waveConstraints.width;
      path.lineTo(currentWidthPointer, size.height);
    }

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

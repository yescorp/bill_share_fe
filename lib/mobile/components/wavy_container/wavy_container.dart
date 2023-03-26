import 'package:bill_share/mobile/components/wavy_container/wavy_clipper.dart';
import 'package:flutter/material.dart';

class WavyContainer extends StatelessWidget {
  final Container container;
  final Size? waveConstraints;
  const WavyContainer({
    super.key,
    required this.container,
    this.waveConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WavyClipper(waveConstraints: waveConstraints),
      child: container,
    );
  }
}

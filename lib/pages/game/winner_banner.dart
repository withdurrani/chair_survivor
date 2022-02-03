import 'package:flutter/material.dart';

class WinnerBanner extends StatelessWidget {
  const WinnerBanner({Key? key, required this.child, required this.opacity})
      : super(key: key);
  final Widget child;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Banner(
        message: 'Winner',
        location: BannerLocation.topStart,
        child: child,
      ),
    );
  }
}

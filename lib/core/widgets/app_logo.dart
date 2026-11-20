import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool withShadow;

  const AppLogo({
    Key? key,
    this.size = 36,
    this.withShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(size * 0.22),
      child: Image.asset(
        'assets/images/app_logo.png',
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );

    if (!withShadow) return image;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.22),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF025193).withOpacity(0.18),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: image,
    );
  }
}

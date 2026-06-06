import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';

class DuneLogo extends StatelessWidget {
  const DuneLogo({
    super.key,
    this.height,
    this.showImage = true,
    this.color,
  });

  final double? height;
  final bool showImage;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final double logoHeight = height ??
        Responsive.value<double>(
          context: context,
          mobile: 48,
          tablet: 56,
          desktop: 64,
        );

    if (showImage) {
      return Image.asset(
        'assets/images/logo.png',
        height: logoHeight,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => _TextLogo(height: logoHeight, color: color),
      );
    }

    return _TextLogo(height: logoHeight, color: color);
  }
}

class _TextLogo extends StatelessWidget {
  const _TextLogo({required this.height, this.color});

  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final brandColor = color ?? AppColors.terracotta;
    final duneSize = height * 0.55;
    final womenSize = height * 0.18;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'DUNE',
          style: TextStyle(
            fontSize: duneSize,
            fontWeight: FontWeight.w700,
            color: brandColor,
            letterSpacing: duneSize * 0.12,
            height: 1,
          ),
        ),
        SizedBox(height: height * 0.08),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: womenSize * 2.5,
              height: 1,
              color: brandColor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: womenSize * 0.8),
              child: Text(
                'WOMEN',
                style: TextStyle(
                  fontSize: womenSize,
                  fontWeight: FontWeight.w500,
                  color: brandColor,
                  letterSpacing: womenSize * 0.35,
                ),
              ),
            ),
            Container(
              width: womenSize * 2.5,
              height: 1,
              color: brandColor,
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';

class PriceBadge extends StatelessWidget {
  const PriceBadge({
    super.key,
    this.size = 140,
    this.animate = true,
  });

  final double size;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    Widget badge = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.terracotta,
        border: Border.all(color: AppColors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: AppColors.terracotta.withValues(alpha: 0.35),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '1kg',
            style: GoogleFonts.playfairDisplay(
              fontSize: size * 0.22,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
              height: 1,
            ),
          ),
          Container(
            width: size * 0.35,
            height: 1.5,
            margin: EdgeInsets.symmetric(vertical: size * 0.04),
            color: AppColors.white.withValues(alpha: 0.8),
          ),
          Text(
            '899.',
            style: GoogleFonts.playfairDisplay(
              fontSize: size * 0.28,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              height: 1,
            ),
          ),
        ],
      ),
    );

    if (animate) {
      badge = badge
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scale(
            begin: const Offset(1, 1),
            end: const Offset(1.06, 1.06),
            duration: 2.seconds,
            curve: Curves.easeInOut,
          )
          .then()
          .shimmer(
            duration: 3.seconds,
            color: AppColors.white.withValues(alpha: 0.15),
          );
    }

    return badge;
  }
}

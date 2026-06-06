import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.alignment = CrossAxisAlignment.center,
  });

  final String title;
  final String? subtitle;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final isCenter = alignment == CrossAxisAlignment.center;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          title,
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
          style: Theme.of(context).textTheme.headlineLarge,
        )
            .animate()
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.3, end: 0, curve: Curves.easeOutCubic),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.value(
                context: context,
                mobile: 320,
                desktop: 560,
              ),
            ),
            child: Text(
              subtitle!,
              textAlign: isCenter ? TextAlign.center : TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge,
            )
                .animate(delay: 150.ms)
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.2, end: 0),
          ),
        ],
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.terracotta,
            borderRadius: BorderRadius.circular(2),
          ),
        )
            .animate(delay: 300.ms)
            .fadeIn()
            .scaleX(begin: 0, end: 1, alignment: isCenter ? Alignment.center : Alignment.centerLeft),
      ],
    );
  }
}

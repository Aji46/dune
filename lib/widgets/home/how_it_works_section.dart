import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../common/section_header.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  static const _steps = [
    (
      Icons.checkroom_outlined,
      'Browse',
      'Explore our curated collection of surplus women\'s dresses.',
    ),
    (
      Icons.scale_outlined,
      'Weigh',
      'Each dress is weighed on the spot for transparent pricing.',
    ),
    (
      Icons.payments_outlined,
      'Pay ₹899/kg',
      'Simple, fair pricing — only ₹899 per kilogram. No hidden costs.',
    ),
    (
      Icons.shopping_bag_outlined,
      'Take Home',
      'Walk out with premium fashion at surplus prices.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);
    final columns = Responsive.value(
      context: context,
      mobile: 1,
      tablet: 2,
      desktop: 4,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 64),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Responsive.maxContentWidth(context),
          ),
          child: Column(
            children: [
              const SectionHeader(
                title: 'How It Works',
                subtitle:
                    'DUNE Women makes premium fashion accessible through our unique weigh-and-pay surplus model.',
              ),
              const SizedBox(height: 48),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: isMobile ? 2.2 : 0.85,
                ),
                itemCount: _steps.length,
                itemBuilder: (context, index) {
                  final (icon, title, desc) = _steps[index];
                  return _StepCard(
                    icon: icon,
                    title: title,
                    description: desc,
                    index: index,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.index,
  });

  final IconData icon;
  final String title;
  final String description;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.terracotta.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.terracotta, size: 26),
          ),
          const SizedBox(height: 16),
          Text(
            '${index + 1}. $title',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.terracotta,
                ),
          ),
          const SizedBox(height: 8),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    )
        .animate(delay: (index * 120).ms)
        .fadeIn(duration: 500.ms)
        .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/theme/app_colors.dart';
import '../core/utils/responsive.dart';
import '../widgets/common/price_badge.dart';
import '../widgets/common/section_header.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 64),
            color: AppColors.cream,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Responsive.maxContentWidth(context),
                ),
                child: Column(
                  children: [
                    Text(
                      'CLOTHING STORE',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Our Story',
                      style: Theme.of(context).textTheme.displayMedium,
                    )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: 0.2, end: 0),
                    const SizedBox(height: 16),
                    Text(
                      'DUNE Women was born from a simple idea — make beautiful '
                      'women\'s fashion accessible to everyone in Edavanna and beyond.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 64),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Responsive.maxContentWidth(context),
                ),
                child: Column(
                  children: [
                    _storyBlock(
                      context,
                      'The DUNE Vision',
                      'We curate premium surplus dresses — factory overruns, export '
                      'extras, and quality stock — and offer them at a revolutionary '
                      'price: ₹899 per kilogram. No complicated discounts, no markup games. '
                      'Just honest, weight-based pricing.',
                      Icons.visibility_outlined,
                      0,
                    ),
                    const SizedBox(height: 32),
                    _storyBlock(
                      context,
                      'Why Surplus?',
                      'Surplus fashion is premium quality clothing that never made it '
                      'to regular retail shelves. At DUNE, we give these beautiful pieces '
                      'a second life — reducing waste while dressing women in style.',
                      Icons.eco_outlined,
                      1,
                    ),
                    const SizedBox(height: 32),
                    _storyBlock(
                      context,
                      'Our Promise',
                      'Every dress is inspected, weighed, and priced transparently. '
                      'Walk into our Edavanna store near SHMGVHSS School and experience '
                      'boutique-quality shopping with surplus savings.',
                      Icons.favorite_outline,
                      2,
                    ),
                    const SizedBox(height: 48),
                    const SectionHeader(
                      title: 'The DUNE Difference',
                      subtitle: 'Premium fashion shouldn\'t cost a fortune.',
                    ),
                    const SizedBox(height: 40),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      alignment: WrapAlignment.center,
                      children: [
                        _valueCard(
                          context,
                          Icons.scale_outlined,
                          'Weigh & Pay',
                          'Transparent pricing at ₹899/kg',
                        ),
                        _valueCard(
                          context,
                          Icons.verified_outlined,
                          'Quality Checked',
                          'Every piece hand-inspected',
                        ),
                        _valueCard(
                          context,
                          Icons.style_outlined,
                          'Trendy Styles',
                          'Dresses for every occasion',
                        ),
                        const PriceBadge(size: 130, animate: true),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _storyBlock(
    BuildContext context,
    String title,
    String body,
    IconData icon,
    int index,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.terracotta.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.terracotta, size: 28),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(body, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    )
        .animate(delay: (index * 150).ms)
        .fadeIn(duration: 500.ms)
        .slideX(begin: 0.1, end: 0);
  }

  Widget _valueCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.charcoal.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.terracotta, size: 32),
          const SizedBox(height: 12),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

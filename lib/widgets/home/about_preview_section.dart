import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../common/section_header.dart';

class AboutPreviewSection extends StatelessWidget {
  const AboutPreviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 64),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Responsive.maxContentWidth(context),
          ),
          child: isMobile
              ? _buildContent(context)
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _imageBlock()),
                    const SizedBox(width: 48),
                    Expanded(child: _buildContent(context)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'About DUNE',
          subtitle:
              'A women\'s clothing store bringing surplus fashion to Edavanna with style, warmth, and honesty.',
          alignment: CrossAxisAlignment.start,
        ),
        if (Responsive.isMobile(context)) ...[
          const SizedBox(height: 32),
          _imageBlock(),
          const SizedBox(height: 24),
        ],
        const SizedBox(height: 24),
        Text(
          'At DUNE Women, we believe every woman deserves access to beautiful, '
          'quality dresses without the premium price tag. Our surplus model lets '
          'you shop by weight — transparent, simple, and fair at ₹899 per kilogram.',
          style: Theme.of(context).textTheme.bodyLarge,
        )
            .animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: 0.1, end: 0),
        const SizedBox(height: 16),
        _statRow(context, '500+', 'Dresses Available'),
        const SizedBox(height: 12),
        _statRow(context, '₹899', 'Per Kilogram'),
        const SizedBox(height: 12),
        _statRow(context, '100%', 'Surplus Quality'),
      ],
    );
  }

  Widget _imageBlock() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=800&q=80',
            height: 320,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColors.terracotta.withValues(alpha: 0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 700.ms)
        .scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
        );
  }

  Widget _statRow(BuildContext context, String value, String label) {
    return Row(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.terracotta,
              ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(label, style: Theme.of(context).textTheme.bodyLarge),
        ),
      ],
    );
  }
}

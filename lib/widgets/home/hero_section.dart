import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../common/price_badge.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onShopNow,
  });

  final VoidCallback onShopNow;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.cream, AppColors.creamLight],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 48),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.maxContentWidth(context),
            ),
            child: isMobile
                ? _buildMobileLayout(context)
                : _buildDesktopLayout(context),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _heroText(context),
        const SizedBox(height: 32),
        _heroImage(context, height: 380),
        const SizedBox(height: 24),
        const Center(child: PriceBadge(size: 120)),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _heroText(context)),
        const SizedBox(width: 48),
        Expanded(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              _heroImage(context, height: 520),
              const Positioned(
                left: -20,
                bottom: 40,
                child: PriceBadge(size: 150),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _heroText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CLOTHING STORE',
          style: Theme.of(context).textTheme.labelLarge,
        )
            .animate()
            .fadeIn(duration: 500.ms)
            .slideX(begin: -0.2, end: 0),
        const SizedBox(height: 16),
        Text(
          'DUNE',
          style: GoogleFonts.montserrat(
            fontSize: Responsive.value(
              context: context,
              mobile: 52,
              tablet: 64,
              desktop: 80,
            ),
            fontWeight: FontWeight.w700,
            color: AppColors.terracotta,
            letterSpacing: 12,
            height: 1,
          ),
        )
            .animate(delay: 100.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.3, end: 0, curve: Curves.easeOutCubic),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 1, color: AppColors.charcoal),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'WOMEN',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      letterSpacing: 6,
                    ),
              ),
            ),
            Container(width: 40, height: 1, color: AppColors.charcoal),
          ],
        )
            .animate(delay: 200.ms)
            .fadeIn(duration: 500.ms),
        const SizedBox(height: 24),
        Text(
          'Premium surplus dresses weighed & priced at just ₹899 per kilogram. '
          'Elegant fashion, unbeatable value.',
          style: Theme.of(context).textTheme.bodyLarge,
        )
            .animate(delay: 300.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.2, end: 0),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: onShopNow,
              icon: const Icon(Icons.shopping_bag_outlined, size: 20),
              label: const Text('SHOP NOW'),
            )
                .animate(delay: 400.ms)
                .fadeIn()
                .slideX(begin: -0.2, end: 0),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_circle_outline, size: 20),
              label: const Text('HOW IT WORKS'),
            )
                .animate(delay: 500.ms)
                .fadeIn()
                .slideX(begin: -0.2, end: 0),
          ],
        ),
      ],
    );
  }

  Widget _heroImage(BuildContext context, {required double height}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/poster.png',
            height: height,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              height: height,
              color: AppColors.cream,
              child: const Icon(
                Icons.image_outlined,
                size: 64,
                color: AppColors.terracotta,
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.charcoal.withValues(alpha: 0.15),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )
        .animate(delay: 200.ms)
        .fadeIn(duration: 800.ms)
        .scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
          curve: Curves.easeOutCubic,
        );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_colors.dart';
import '../core/utils/responsive.dart';
import '../data/mock_products.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.productId,
    required this.onBack,
  });

  final String productId;
  final VoidCallback onBack;

  Product? get product {
    for (final p in products) {
      if (p.id == productId) return p;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final p = product;
    if (p == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Product not found'),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: onBack, child: const Text('Go Back')),
          ],
        ),
      );
    }

    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(padding, 24, padding, 48),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Responsive.maxContentWidth(context),
                ),
                child: isMobile
                    ? _buildMobile(context, p)
                    : _buildDesktop(context, p),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobile(BuildContext context, Product p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _backButton(),
        const SizedBox(height: 16),
        _imageSection(p),
        const SizedBox(height: 24),
        _detailsSection(context, p),
      ],
    );
  }

  Widget _buildDesktop(BuildContext context, Product p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _backButton(),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 5, child: _imageSection(p)),
            const SizedBox(width: 48),
            Expanded(flex: 4, child: _detailsSection(context, p)),
          ],
        ),
      ],
    );
  }

  Widget _backButton() {
    return TextButton.icon(
      onPressed: onBack,
      icon: const Icon(Icons.arrow_back, size: 18),
      label: const Text('Back to Shop'),
      style: TextButton.styleFrom(foregroundColor: AppColors.terracotta),
    );
  }

  Widget _imageSection(Product p) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: Image.network(
          p.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: AppColors.cream,
            child: const Icon(
              Icons.checkroom_outlined,
              size: 80,
              color: AppColors.terracotta,
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
          curve: Curves.easeOutCubic,
        );
  }

  Widget _detailsSection(BuildContext context, Product p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (p.isNew)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.terracotta,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'NEW ARRIVAL',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
          ),
        const SizedBox(height: 12),
        Text(
          p.name,
          style: Theme.of(context).textTheme.headlineLarge,
        )
            .animate(delay: 100.ms)
            .fadeIn()
            .slideX(begin: 0.1, end: 0),
        const SizedBox(height: 8),
        Text(
          p.category,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.terracotta,
              ),
        ),
        const SizedBox(height: 20),
        Text(p.description, style: Theme.of(context).textTheme.bodyLarge)
            .animate(delay: 200.ms)
            .fadeIn(),
        const SizedBox(height: 32),
        _priceCard(context, p),
        const SizedBox(height: 24),
        _detailRow(context, 'Size', p.size),
        _detailRow(context, 'Color', p.color),
        _detailRow(context, 'Weight', '${p.weightKg} kg'),
        _detailRow(
          context,
          'Rate',
          '₹${p.pricePerKg.toStringAsFixed(0)} per kg',
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _showVisitDialog(context),
            icon: const Icon(Icons.store_outlined),
            label: const Text('VISIT STORE TO BUY'),
          ),
        )
            .animate(delay: 400.ms)
            .fadeIn()
            .slideY(begin: 0.1, end: 0),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
            label: const Text('SAVE TO WISHLIST'),
          ),
        ),
      ],
    );
  }

  Widget _priceCard(BuildContext context, Product p) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.terracotta, AppColors.terracottaDark],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Estimated Price',
                  style: TextStyle(
                    color: AppColors.white.withValues(alpha: 0.8),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '₹${p.totalPrice.toStringAsFixed(0)}',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 50,
            color: AppColors.white.withValues(alpha: 0.3),
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              Text(
                '1kg',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 16,
                  color: AppColors.white.withValues(alpha: 0.8),
                ),
              ),
              Text(
                '899.',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    )
        .animate(delay: 300.ms)
        .fadeIn()
        .slideY(begin: 0.1, end: 0);
  }

  Widget _detailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Text(value, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }

  void _showVisitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Visit Our Store'),
        content: const Text(
          'DUNE Women operates as a physical surplus store. '
          'Visit us at Edavanna, near SHMGVHSS School to try on and purchase this dress. '
          'Final price is calculated by weight at ₹899/kg.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

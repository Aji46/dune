import 'package:flutter/material.dart';

import '../data/mock_products.dart';
import '../widgets/home/hero_section.dart';
import '../widgets/home/how_it_works_section.dart';
import '../widgets/home/location_section.dart';
import '../widgets/products/featured_products_section.dart';
import '../widgets/home/about_preview_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.onShopNow,
    required this.onProductTap,
    required this.scrollController,
  });

  final VoidCallback onShopNow;
  final void Function(String productId) onProductTap;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final featured = products.where((p) => p.isFeatured).toList();

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          HeroSection(onShopNow: onShopNow),
          FeaturedProductsSection(
            products: featured,
            onViewAll: onShopNow,
            onProductTap: onProductTap,
          ),
          const HowItWorksSection(),
          const AboutPreviewSection(),
          const LocationSection(),
        ],
      ),
    );
  }
}

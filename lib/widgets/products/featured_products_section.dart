import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../models/product.dart';
import '../common/section_header.dart';
import 'product_card.dart';

class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({
    super.key,
    required this.products,
    required this.onViewAll,
    required this.onProductTap,
  });

  final List<Product> products;
  final VoidCallback onViewAll;
  final void Function(String productId) onProductTap;

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final columns = Responsive.gridColumns(context);
    final isMobile = Responsive.isMobile(context);

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
                title: 'Featured Dresses',
                subtitle:
                    'Handpicked surplus styles — weighed fresh, priced at ₹899 per kg.',
              ),
              const SizedBox(height: 40),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: isMobile ? 0.62 : 0.68,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    product: product,
                    index: index,
                    onTap: () => onProductTap(product.id),
                  );
                },
              ),
              const SizedBox(height: 32),
              OutlinedButton(
                onPressed: onViewAll,
                child: const Text('VIEW ALL DRESSES'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

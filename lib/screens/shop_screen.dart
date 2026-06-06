import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/theme/app_colors.dart';
import '../core/utils/responsive.dart';
import '../data/mock_products.dart';
import '../models/product.dart';
import '../widgets/common/price_badge.dart';
import '../widgets/common/section_header.dart';
import '../widgets/products/product_card.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({
    super.key,
    required this.onProductTap,
    required this.scrollController,
  });

  final void Function(String productId) onProductTap;
  final ScrollController scrollController;

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String _selectedCategory = 'All';
  String _searchQuery = '';
  final _searchController = TextEditingController();

  List<Product> get _filteredProducts {
    return products.where((p) {
      final matchesCategory =
          _selectedCategory == 'All' || p.category == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty ||
          p.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.color.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final columns = Responsive.gridColumns(context);
    final isMobile = Responsive.isMobile(context);
    final filtered = _filteredProducts;

    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 48),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.cream, AppColors.creamLight],
              ),
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Responsive.maxContentWidth(context),
                ),
                child: isMobile
                    ? Column(
                        children: [
                          const SectionHeader(
                            title: 'Shop Dresses',
                            subtitle:
                                'Browse our surplus collection. Every piece priced at ₹899/kg.',
                          ),
                          const SizedBox(height: 24),
                          const PriceBadge(size: 110, animate: false),
                        ],
                      )
                    : Row(
                        children: [
                          const Expanded(
                            child: SectionHeader(
                              title: 'Shop Dresses',
                              subtitle:
                                  'Browse our surplus collection. Every piece priced at ₹899/kg.',
                              alignment: CrossAxisAlignment.start,
                            ),
                          ),
                          const PriceBadge(size: 120, animate: false),
                        ],
                      ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 32),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Responsive.maxContentWidth(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _searchController,
                      onChanged: (v) => setState(() => _searchQuery = v),
                      decoration: InputDecoration(
                        hintText: 'Search dresses, colors...',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.terracotta,
                        ),
                        suffixIcon: _searchQuery.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() => _searchQuery = '');
                                },
                              )
                            : null,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 400.ms)
                        .slideY(begin: 0.1, end: 0),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 42,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final cat = categories[index];
                          final isSelected = cat == _selectedCategory;
                          return FilterChip(
                            label: Text(cat),
                            selected: isSelected,
                            onSelected: (_) =>
                                setState(() => _selectedCategory = cat),
                            backgroundColor: AppColors.white,
                            selectedColor:
                                AppColors.terracotta.withValues(alpha: 0.15),
                            labelStyle: TextStyle(
                              color: isSelected
                                  ? AppColors.terracotta
                                  : AppColors.charcoal,
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                            ),
                            side: BorderSide(
                              color: isSelected
                                  ? AppColors.terracotta
                                  : AppColors.divider,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          )
                              .animate(delay: (index * 50).ms)
                              .fadeIn(duration: 300.ms)
                              .slideX(begin: 0.1, end: 0);
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: filtered.isEmpty
                          ? _emptyState()
                          : GridView.builder(
                              key: ValueKey(
                                '$_selectedCategory-$_searchQuery',
                              ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: columns,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: isMobile ? 0.62 : 0.68,
                              ),
                              itemCount: filtered.length,
                              itemBuilder: (context, index) {
                                final product = filtered[index];
                                return ProductCard(
                                  product: product,
                                  index: index,
                                  onTap: () =>
                                      widget.onProductTap(product.id),
                                );
                              },
                            ),
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

  Widget _emptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64),
        child: Column(
          children: [
            Icon(
              Icons.search_off_outlined,
              size: 64,
              color: AppColors.terracotta.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No dresses found',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Try a different search or category',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

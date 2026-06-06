import 'package:flutter/material.dart';

import '../widgets/layout/app_footer.dart';
import '../widgets/layout/app_nav_bar.dart';
import 'about_screen.dart';
import 'home_screen.dart';
import 'product_detail_screen.dart';
import 'shop_screen.dart';
import 'visit_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;
  String? _selectedProductId;
  final _scrollController = ScrollController();

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
      _selectedProductId = null;
    });
    _scrollToTop();
  }

  void _openShop() => _navigateTo(1);

  void _openProduct(String productId) {
    setState(() {
      _selectedProductId = productId;
      _currentIndex = 1;
    });
    _scrollToTop();
  }

  void _closeProduct() {
    setState(() => _selectedProductId = null);
    _scrollToTop();
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppNavBar(
            currentIndex: _selectedProductId != null ? 1 : _currentIndex,
            onNavigate: _navigateTo,
          ),
          Expanded(
            child: _selectedProductId != null
                ? ProductDetailScreen(
                    productId: _selectedProductId!,
                    onBack: _closeProduct,
                  )
                : _buildCurrentPage(),
          ),
          const AppFooter(),
        ],
      ),
    );
  }

  Widget _buildCurrentPage() {
    return switch (_currentIndex) {
      0 => HomeScreen(
          onShopNow: _openShop,
          onProductTap: _openProduct,
          scrollController: _scrollController,
        ),
      1 => ShopScreen(
          onProductTap: _openProduct,
          scrollController: _scrollController,
        ),
      2 => AboutScreen(scrollController: _scrollController),
      3 => VisitScreen(scrollController: _scrollController),
      _ => HomeScreen(
          onShopNow: _openShop,
          onProductTap: _openProduct,
          scrollController: _scrollController,
        ),
    };
  }
}

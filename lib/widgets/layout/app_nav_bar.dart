import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../common/dune_logo.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({
    super.key,
    required this.currentIndex,
    required this.onNavigate,
  });

  final int currentIndex;
  final ValueChanged<int> onNavigate;

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  final _navItems = const [
    ('Home', Icons.home_outlined),
    ('Shop', Icons.shopping_bag_outlined),
    ('About', Icons.info_outline),
    ('Visit', Icons.location_on_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.creamLight.withValues(alpha: 0.97),
        border: const Border(
          bottom: BorderSide(color: AppColors.divider, width: 1),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 12),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => widget.onNavigate(0),
                child: const DuneLogo(height: 44),
              )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .slideX(begin: -0.2, end: 0),
              const Spacer(),
              if (!isMobile) ..._buildDesktopNav(),
              if (isMobile)
                IconButton(
                  icon: const Icon(Icons.menu_rounded, size: 28),
                  onPressed: () => _showMobileMenu(context),
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDesktopNav() {
    return _navItems.asMap().entries.map((entry) {
      final index = entry.key;
      final (label, icon) = entry.value;
      final isActive = widget.currentIndex == index;

      return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: TextButton.icon(
          onPressed: () => widget.onNavigate(index),
          icon: Icon(
            icon,
            size: 18,
            color: isActive ? AppColors.terracotta : AppColors.charcoalMuted,
          ),
          label: Text(
            label,
            style: TextStyle(
              color: isActive ? AppColors.terracotta : AppColors.charcoal,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: isActive
                ? AppColors.terracotta.withValues(alpha: 0.1)
                : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      )
          .animate(delay: (index * 80).ms)
          .fadeIn(duration: 400.ms)
          .slideY(begin: -0.3, end: 0);
    }).toList();
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.creamLight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _navItems.asMap().entries.map((entry) {
              final index = entry.key;
              final (label, icon) = entry.value;
              final isActive = widget.currentIndex == index;

              return ListTile(
                leading: Icon(
                  icon,
                  color: isActive ? AppColors.terracotta : AppColors.charcoal,
                ),
                title: Text(
                  label,
                  style: TextStyle(
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                    color: isActive ? AppColors.terracotta : AppColors.charcoal,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  widget.onNavigate(index);
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

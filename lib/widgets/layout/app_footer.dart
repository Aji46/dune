import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/constants/contact_info.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../common/contact_links.dart';
import '../common/dune_logo.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.charcoal,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Responsive.maxContentWidth(context),
          ),
          child: isMobile ? _buildMobile(context) : _buildDesktop(context),
        ),
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      children: [
        const DuneLogo(height: 56, color: AppColors.terracottaLight),
        const SizedBox(height: 24),
        _footerText(context),
      ],
    ).animate().fadeIn(duration: 600.ms);
  }

  Widget _buildDesktop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: DuneLogo(height: 64, color: AppColors.terracottaLight),
        ),
        Expanded(child: _footerText(context)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'CLOTHING STORE',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.cream.withValues(alpha: 0.6),
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Surplus Dresses\nBy Weight',
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.cream.withValues(alpha: 0.8),
                    ),
              ),
            ],
          ),
        ),
      ],
    ).animate().fadeIn(duration: 600.ms);
  }

  Widget _footerText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '© ${DateTime.now().year} DUNE Women',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.cream.withValues(alpha: 0.7),
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Edavanna · Near SHMGVHSS School',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.terracottaLight,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'Premium surplus fashion at ₹899 per kg',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.cream.withValues(alpha: 0.5),
              ),
        ),
        const SizedBox(height: 16),
        ...ContactInfo.phones.map(
          (phone) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                _footerLink(
                  label: phone.display,
                  onTap: () => launchExternalUrl(phone.telUri),
                ),
                const SizedBox(width: 8),
                _footerLink(
                  label: 'WA',
                  onTap: () => launchExternalUrl(phone.whatsappUri),
                  color: const Color(0xFF25D366),
                ),
              ],
            ),
          ),
        ),
        _footerLink(
          label: ContactInfo.email,
          onTap: () => launchExternalUrl('mailto:${ContactInfo.email}'),
        ),
        const SizedBox(height: 4),
        _footerLink(
          label: ContactInfo.instagramHandle,
          onTap: () => launchExternalUrl(ContactInfo.instagramUrl),
        ),
      ],
    );
  }

  Widget _footerLink({
    required String label,
    required VoidCallback onTap,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
          color: color ?? AppColors.cream.withValues(alpha: 0.75),
          fontSize: 13,
          decoration: TextDecoration.underline,
          decorationColor: (color ?? AppColors.cream).withValues(alpha: 0.4),
        ),
      ),
    );
  }
}

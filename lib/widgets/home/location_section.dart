import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/contact_info.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../common/contact_links.dart';
import '../common/section_header.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  Future<void> _openMaps() async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=Edavanna+SHMGVHSS+School',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.cream,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 64),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.maxContentWidth(context),
            ),
            child: isMobile
                ? _buildMobile(context)
                : _buildDesktop(context),
          ),
        ),
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: 'Visit & Contact',
          subtitle:
              'Come experience DUNE Women in person, or reach us anytime.',
        ),
        const SizedBox(height: 40),
        _locationCard(context),
        const SizedBox(height: 32),
        _contactCard(context),
        const SizedBox(height: 32),
        const InstagramQrCard(),
      ],
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: 'Visit & Contact',
          subtitle:
              'Come experience DUNE Women in person, or reach us anytime.',
        ),
        const SizedBox(height: 48),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _locationCard(context)),
            const SizedBox(width: 32),
            Expanded(child: _contactCard(context)),
            const SizedBox(width: 32),
            const InstagramQrCard(),
          ],
        ),
      ],
    );
  }

  Widget _locationCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.terracotta.withValues(alpha: 0.12),
            blurRadius: 32,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.location_on_rounded,
            size: 48,
            color: AppColors.terracotta,
          )
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.15, 1.15),
                duration: 1.5.seconds,
              ),
          const SizedBox(height: 20),
          Text(
            'EDAVANNA',
            style: GoogleFonts.montserrat(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.terracotta,
              letterSpacing: 4,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.2, end: 0),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 30, height: 1, color: AppColors.charcoal),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'NEAR',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Container(width: 30, height: 1, color: AppColors.charcoal),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'SHMGVHSS SCHOOL',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _openMaps,
              icon: const Icon(Icons.directions_outlined),
              label: const Text('GET DIRECTIONS'),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 700.ms)
        .slideY(begin: 0.15, end: 0, curve: Curves.easeOutCubic);
  }

  Widget _contactCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get in Touch',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          ContactLinkRow(
            icon: Icons.access_time_outlined,
            label: 'Mon – Sat: 10:00 AM – 8:00 PM',
            onTap: () {},
          ),
          const Divider(height: 24),
          ...ContactInfo.phones.map(
            (phone) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: PhoneContactRow(phone: phone),
            ),
          ),
          const Divider(height: 12),
          const EmailContactRow(),
          const SizedBox(height: 8),
          const InstagramContactRow(),
        ],
      ),
    )
        .animate(delay: 150.ms)
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.1, end: 0);
  }
}

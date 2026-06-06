import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/contact_info.dart';
import '../../core/theme/app_colors.dart';

Future<void> launchExternalUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class ContactLinkRow extends StatelessWidget {
  const ContactLinkRow({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
          child: Row(
            children: [
              Icon(icon, size: 20, color: AppColors.terracotta),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.charcoalMuted,
                    fontSize: 14,
                  ),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneContactRow extends StatelessWidget {
  const PhoneContactRow({super.key, required this.phone});

  final ContactPhone phone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContactLinkRow(
          icon: Icons.phone_outlined,
          label: phone.display,
          onTap: () => launchExternalUrl(phone.telUri),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32, top: 2),
          child: TextButton.icon(
            onPressed: () => launchExternalUrl(phone.whatsappUri),
            icon: const Icon(Icons.chat_outlined, size: 16),
            label: const Text('WhatsApp'),
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF25D366),
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmailContactRow extends StatelessWidget {
  const EmailContactRow({super.key});

  @override
  Widget build(BuildContext context) {
    return ContactLinkRow(
      icon: Icons.email_outlined,
      label: ContactInfo.email,
      onTap: () => launchExternalUrl('mailto:${ContactInfo.email}'),
    );
  }
}

class InstagramContactRow extends StatelessWidget {
  const InstagramContactRow({super.key});

  @override
  Widget build(BuildContext context) {
    return ContactLinkRow(
      icon: Icons.camera_alt_outlined,
      label: ContactInfo.instagramHandle,
      onTap: () => launchExternalUrl(ContactInfo.instagramUrl),
      trailing: const Icon(
        Icons.open_in_new,
        size: 16,
        color: AppColors.terracotta,
      ),
    );
  }
}

class InstagramQrCard extends StatelessWidget {
  const InstagramQrCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchExternalUrl(ContactInfo.instagramUrl),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.divider),
          boxShadow: [
            BoxShadow(
              color: AppColors.charcoal.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/instagram_qr.png',
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Follow us on Instagram',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              ContactInfo.instagramHandle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.terracotta,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => launchExternalUrl(ContactInfo.instagramUrl),
              icon: const Icon(Icons.camera_alt_outlined, size: 18),
              label: const Text('OPEN INSTAGRAM'),
            ),
          ],
        ),
      ),
    );
  }
}

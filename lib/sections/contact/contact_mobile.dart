import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/configs.dart';
import '../../constants.dart';
import '../../provider/app_provider.dart';
import '../../text/textfile.dart';
import '../../widget/custom_text_heading.dart';
import 'widgets/contact_form.dart';

class ContactMobileTab extends StatelessWidget {
  const ContactMobileTab({Key? key}) : super(key: key);

  Widget _buildContactCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String detail,
    required String subtitle,
    required String actionLabel,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xff18181f) : const Color(0xfff8fafc),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.06),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                size: 22,
                color: AppTheme.c!.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: isDark ? Colors.white60 : const Color(0xff64748b),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    detail,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: isDark ? Colors.white : const Color(0xff0f172a),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 11.5,
                      color: isDark ? Colors.white54 : const Color(0xff64748b),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: AppTheme.c!.primary,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: "\nGet in Touch",
          ),
          const CustomSectionSubHeading(
            text: "Have a project in mind? Let's connect!\n\n",
          ),
          Space.y!,
          _buildContactCard(
            context: context,
            icon: Icons.location_on_rounded,
            title: "Location",
            detail: "Gujarat, India",
            subtitle: "Open to Remote & Relocation",
            actionLabel: "View on Map",
            onTap: () => openURL("https://maps.app.goo.gl/tSYvps71TbiKzrV7A"),
            isDark: isDark,
          ),
          const SizedBox(height: 14),
          _buildContactCard(
            context: context,
            icon: Icons.phone_iphone_rounded,
            title: "Phone & WhatsApp",
            detail: valuePhone,
            subtitle: "Available on WhatsApp & Call",
            actionLabel: "Call or Chat",
            onTap: () => openURL("tel:$valuePhone"),
            isDark: isDark,
          ),
          const SizedBox(height: 14),
          _buildContactCard(
            context: context,
            icon: Icons.alternate_email_rounded,
            title: "Direct Email",
            detail: valueEmail,
            subtitle: "Quick response within 24 hours",
            actionLabel: "Send Email",
            onTap: () => openURL("mailto:$valueEmail"),
            isDark: isDark,
          ),
          const SizedBox(height: 28),

          // Direct Working Contact Form
          const DirectContactForm(),
          const SizedBox(height: 28),

          // Callout banner on mobile
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppTheme.c!.primary!.withValues(alpha: isDark ? 0.15 : 0.08),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppTheme.c!.primary!.withValues(alpha: 0.25),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Ready to build your next mobile app?",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: isDark ? Colors.white : const Color(0xff0f172a),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "From MVPs to enterprise apps, let's create something remarkable.",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 13,
                    color: isDark ? Colors.white70 : const Color(0xff475569),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => openURL("mailto:$valueEmail"),
                      icon: const Icon(
                        Icons.mail_rounded,
                        size: 15,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Email Me",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.c!.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 11,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      onPressed: () => openURL(myCVLink),
                      icon: Icon(
                        Icons.download_rounded,
                        size: 15,
                        color: AppTheme.c!.primary,
                      ),
                      label: Text(
                        "Resume",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: AppTheme.c!.primary,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppTheme.c!.primary!,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 11,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Space.y2!,
        ],
      ),
    );
  }
}

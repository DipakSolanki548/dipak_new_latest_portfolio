import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/configs.dart';
import '../../constants.dart';
import '../../provider/app_provider.dart';
import '../../text/textfile.dart';
import '../../widget/custom_text_heading.dart';
import 'widgets/contact_form.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({Key? key}) : super(key: key);

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
    return _HoverContactCard(
      icon: icon,
      title: title,
      detail: detail,
      subtitle: subtitle,
      actionLabel: actionLabel,
      onTap: onTap,
      isDark: isDark,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;

    return Center(
      child: Container(
        padding: Space.h,
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            const CustomSectionHeading(
              text: "\nGet in Touch",
            ),
            const CustomSectionSubHeading(
              text: "Have a project in mind or want to collaborate? Let's connect!\n\n",
            ),
            Space.y!,
            Row(
              children: [
                Expanded(
                  child: _buildContactCard(
                    context: context,
                    icon: Icons.location_on_rounded,
                    title: "Location",
                    detail: "Gujarat, India",
                    subtitle: "Open to Remote & Relocation",
                    actionLabel: "View on Map",
                    onTap: () => openURL("https://maps.app.goo.gl/tSYvps71TbiKzrV7A"),
                    isDark: isDark,
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: _buildContactCard(
                    context: context,
                    icon: Icons.phone_iphone_rounded,
                    title: "Phone & WhatsApp",
                    detail: valuePhone,
                    subtitle: "Available on WhatsApp & Call",
                    actionLabel: "Call or Chat",
                    onTap: () => openURL("tel:$valuePhone"),
                    isDark: isDark,
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: _buildContactCard(
                    context: context,
                    icon: Icons.alternate_email_rounded,
                    title: "Direct Email",
                    detail: valueEmail,
                    subtitle: "Quick response within 24 hours",
                    actionLabel: "Send Email",
                    onTap: () => openURL("mailto:$valueEmail"),
                    isDark: isDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),

            // Direct Working Contact Form
            const DirectContactForm(),
            const SizedBox(height: 36),

            // Callout Banner
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.c!.primary!.withValues(alpha: isDark ? 0.2 : 0.1),
                    AppTheme.c!.primary!.withValues(alpha: isDark ? 0.05 : 0.02),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: AppTheme.c!.primary!.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ready to bring your mobile app idea to life?",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: isDark ? Colors.white : const Color(0xff0f172a),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Whether you need an MVP from scratch or enterprise-grade cross-platform apps, let's talk.",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: isDark ? Colors.white70 : const Color(0xff475569),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => openURL("mailto:$valueEmail"),
                        icon: const Icon(
                          Icons.mail_rounded,
                          size: 16,
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
                            horizontal: 22,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton.icon(
                        onPressed: () => openURL(myCVLink),
                        icon: Icon(
                          Icons.download_rounded,
                          size: 16,
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
                            horizontal: 20,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
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
      ),
    );
  }
}

class _HoverContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String detail;
  final String subtitle;
  final String actionLabel;
  final VoidCallback onTap;
  final bool isDark;

  const _HoverContactCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.detail,
    required this.subtitle,
    required this.actionLabel,
    required this.onTap,
    required this.isDark,
  }) : super(key: key);

  @override
  State<_HoverContactCard> createState() => _HoverContactCardState();
}

class _HoverContactCardState extends State<_HoverContactCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, isHover ? -6 : 0, 0),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isHover
                ? (widget.isDark ? const Color(0xff22222b) : Colors.white)
                : (widget.isDark ? const Color(0xff18181f) : const Color(0xfff8fafc)),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHover
                  ? AppTheme.c!.primary!
                  : (widget.isDark
                      ? Colors.white.withValues(alpha: 0.08)
                      : Colors.black.withValues(alpha: 0.06)),
              width: isHover ? 1.5 : 1.0,
            ),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      color: AppTheme.c!.primary!.withValues(alpha: 0.2),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    )
                  ]
                : [
                    BoxShadow(
                      color: widget.isDark
                          ? Colors.black.withValues(alpha: 0.3)
                          : Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    )
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  widget.icon,
                  size: 24,
                  color: AppTheme.c!.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: widget.isDark ? Colors.white60 : const Color(0xff64748b),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.detail,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: widget.isDark ? Colors.white : const Color(0xff0f172a),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                widget.subtitle,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  color: widget.isDark ? Colors.white54 : const Color(0xff64748b),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    widget.actionLabel,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: AppTheme.c!.primary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 14,
                    color: AppTheme.c!.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

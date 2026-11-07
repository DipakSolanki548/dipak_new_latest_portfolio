import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../configs/configs.dart';
import '../constants.dart';
import '../provider/app_provider.dart';
import '../text/textfile.dart';
import '../utils/utils.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff0c0c10) : const Color(0xfff1f5f9),
        border: Border(
          top: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.06),
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 16,
                  runSpacing: 12,
                  children: [
                    // Brand Logo / Name
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.c!.primary!.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "< DS />",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: AppTheme.c!.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          myName,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: isDark ? Colors.white : const Color(0xff0f172a),
                          ),
                        ),
                      ],
                    ),

                    // Quick links
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.facebook, size: 18),
                          color: isDark ? Colors.white70 : const Color(0xff475569),
                          onPressed: () => openURL(StaticUtils.socialLinks[0]),
                        ),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.instagram, size: 18),
                          color: isDark ? Colors.white70 : const Color(0xff475569),
                          onPressed: () => openURL(StaticUtils.socialLinks[1]),
                        ),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.xTwitter, size: 18),
                          color: isDark ? Colors.white70 : const Color(0xff475569),
                          onPressed: () => openURL(StaticUtils.socialLinks[2]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Divider(
                color: isDark ? Colors.white10 : Colors.black12,
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 14,
                  runSpacing: 8,
                  children: [
                    Text(
                      "© ${DateTime.now().year} $myName. All rights reserved.",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: isDark ? Colors.white54 : const Color(0xff64748b),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Built with ",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: isDark ? Colors.white54 : const Color(0xff64748b),
                          ),
                        ),
                        Text(
                          "Flutter & Dart",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppTheme.c!.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

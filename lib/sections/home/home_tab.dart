import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/configs.dart';
import '../../constants.dart';
import '../../provider/app_provider.dart';
import '../../provider/scroll_provider.dart';
import '../../text/textfile.dart';
import '../../utils/experience_utils.dart';
import '../../utils/utils.dart';
import '../../widget/social_links.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  Widget _buildMetricItem(String value, String label, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w800,
            fontSize: 17,
            color: AppTheme.c!.primary,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 11.5,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.white60 : const Color(0xff64748b),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final appProvider = Provider.of<AppProvider>(context);
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final isDark = appProvider.isDark;

    return Container(
      constraints: BoxConstraints(minHeight: size.height * 0.9),
      padding: Space.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Opacity(
              opacity: isDark ? 0.95 : 1.0,
              child: Image.asset(
                StaticUtils.blackWhitePhoto,
                height: size.height * 0.75,
                filterQuality: FilterQuality.high,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              size.width * 0.05,
              size.height * 0.08,
              0,
              40,
            ),
            constraints: const BoxConstraints(maxWidth: 580),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppTheme.c!.primary!.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        StaticUtils.hi,
                        height: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "WELCOME TO MY PORTFOLIO",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                          color: AppTheme.c!.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  lblDipak,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 44,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 1.4,
                    height: 1.0,
                    color: isDark ? Colors.white : const Color(0xff0f172a),
                  ),
                ),
                Text(
                  lblSolanki,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 46,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.4,
                    height: 1.05,
                    color: AppTheme.c!.primary,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      size: 18,
                      color: AppTheme.c!.primary!,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            "Sr. Android & Flutter Developer",
                            speed: const Duration(milliseconds: 60),
                            textStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? Colors.white70
                                  : const Color(0xff334155),
                            ),
                          ),
                          TyperAnimatedText(
                            "Project Leader (68+ Apps Built)",
                            speed: const Duration(milliseconds: 60),
                            textStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? Colors.white70
                                  : const Color(0xff334155),
                            ),
                          ),
                        ],
                        repeatForever: true,
                        isRepeatingAnimation: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => scrollProvider.scroll(4),
                      icon: const Icon(
                        Icons.rocket_launch_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Explore Projects (68)",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
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
                    OutlinedButton.icon(
                      onPressed: () => openURL(myCVLink),
                      icon: Icon(
                        Icons.download_rounded,
                        size: 16,
                        color: AppTheme.c!.primary,
                      ),
                      label: Text(
                        "Download CV",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: AppTheme.c!.primary,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppTheme.c!.primary!,
                          width: 1.5,
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
                const SizedBox(height: 24),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xff18181f)
                        : const Color(0xfff8fafc),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.08)
                          : Colors.black.withValues(alpha: 0.06),
                    ),
                  ),
                  child: Wrap(
                    spacing: 24,
                    runSpacing: 8,
                    children: [
                      _buildMetricItem(ExperienceUtils.totalExperienceYears, "Experience", isDark),
                      _buildMetricItem("68+", "Apps & Games", isDark),
                      _buildMetricItem("100K+", "Installs", isDark),
                      _buildMetricItem("99.8%", "Crash-Free", isDark),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                const SocialLinks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

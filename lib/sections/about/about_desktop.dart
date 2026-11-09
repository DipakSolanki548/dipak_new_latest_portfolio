import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/configs.dart';
import '../../constants.dart';
import '../../provider/app_provider.dart';
import '../../text/textfile.dart';
import '../../utils/about_utils.dart';
import '../../utils/experience_utils.dart';
import '../../utils/utils.dart';
import '../../widget/about_me_data.dart';
import '../../widget/custom_text_heading.dart';
import '../../widget/tech_widget.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({Key? key}) : super(key: key);

  Widget _buildStrengthCard(
      IconData icon, String title, String desc, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff18181b) : const Color(0xfff8fafc),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.06),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppTheme.c!.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 13.5,
                    color: isDark ? Colors.white : const Color(0xff0f172a),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  desc,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    height: 1.4,
                    color: isDark ? Colors.white60 : const Color(0xff64748b),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
              text: '\nAbout Me',
            ),
            const CustomSectionSubHeading(
              text: 'Get to know my journey, skills & background :)',
            ),
            Space.y2!,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: Photo with frame
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 380),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: AppTheme.c!.primary!.withValues(alpha: 0.35),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.c!.primary!.withValues(
                                alpha: isDark ? 0.25 : 0.15),
                            blurRadius: 24,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: Image.asset(
                          StaticUtils.coloredPhoto,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48),

                // Right: Content
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          "WHO AM I?",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            letterSpacing: 1.1,
                            color: AppTheme.c!.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        AboutUtils.aboutMeHeadline,
                        style: AppText.h2b!.copyWith(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                          color: isDark ? Colors.white : const Color(0xff0f172a),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        AboutUtils.aboutMeDetail,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.5,
                          height: 1.7,
                          color:
                              isDark ? Colors.white70 : const Color(0xff475569),
                        ),
                      ),
                      const SizedBox(height: 18),

                      // Quick Info Grid
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 18),
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xff18181b)
                              : const Color(0xfff8fafc),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.08)
                                : Colors.black.withValues(alpha: 0.06),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AboutMeData(data: "Name", information: myName),
                                  const SizedBox(height: 8),
                                  AboutMeData(
                                    data: "Email",
                                    information: valueEmail,
                                    onTap: () => openURL("mailto:$valueEmail"),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AboutMeData(
                                    data: "Experience",
                                    information:
                                        "${ExperienceUtils.totalExperienceYears} (${ExperienceUtils.totalExperienceDuration})",
                                  ),
                                  const SizedBox(height: 8),
                                  AboutMeData(
                                    data: "Location",
                                    information: myLocationAddress,
                                    onTap: () => openURL(myLocationLink),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Core Engineering Highlights
                      Row(
                        children: [
                          Expanded(
                            child: _buildStrengthCard(
                              Icons.architecture_rounded,
                              "Clean Architecture",
                              "Decoupled BLoC/Provider & Repository patterns for testable code.",
                              isDark,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildStrengthCard(
                              Icons.speed_rounded,
                              "Performance First",
                              "60fps smooth animations, memory profiling & 99.8% crash-free rate.",
                              isDark,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _buildStrengthCard(
                              Icons.cloud_sync_rounded,
                              "Offline-First Sync",
                              "Local SQLite & Hive caching with seamless background cloud sync.",
                              isDark,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildStrengthCard(
                              Icons.rocket_launch_rounded,
                              "Store Deployment",
                              "CI/CD release management on Google Play & Apple App Store.",
                              isDark,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Technologies
                      Text(
                        'Core Frameworks & Tools:',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: AppTheme.c!.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: kTools
                            .map((e) => ToolTechWidget(techName: e))
                            .toList(),
                      ),
                      const SizedBox(height: 16),

                      Text(
                        'Technical Skills & Architecture:',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: AppTheme.c!.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ...technicalSkills,
                          ...technicalSkills1,
                        ].map((e) => ToolTechWidget(techName: e)).toList(),
                      ),
                      const SizedBox(height: 16),

                      Text(
                        'Databases & Cloud:',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: AppTheme.c!.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ...dbList,
                          ...dbList1,
                        ].map((e) => ToolTechWidget(techName: e)).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Space.y2!,
          ],
        ),
      ),
    );
  }
}

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

class AboutMobile extends StatelessWidget {
  const AboutMobile({Key? key}) : super(key: key);

  Widget _buildStrengthCard(
      IconData icon, String title, String desc, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff18181f) : const Color(0xfff8fafc),
        borderRadius: BorderRadius.circular(14),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final imgWidth = (screenWidth * 0.74).clamp(260.0, 310.0);
    final imgHeight = imgWidth * 1.16;

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: '\nAbout Me',
          ),
          const CustomSectionSubHeading(
            text: 'Get to know my journey, skills & background :)',
          ),
          Space.y1!,

          // Profile Image Squircle
          Container(
            width: imgWidth,
            height: imgHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              border: Border.all(
                color: AppTheme.c!.primary!.withValues(alpha: 0.45),
                width: 3.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.c!.primary!.withValues(
                      alpha: isDark ? 0.35 : 0.2),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(33),
              child: Image.asset(
                StaticUtils.coloredPhoto,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Who am I Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: AppTheme.c!.primary!.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              "WHO AM I?",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 11,
                letterSpacing: 1.1,
                color: AppTheme.c!.primary,
              ),
            ),
          ),
          const SizedBox(height: 12),

          Text(
            AboutUtils.aboutMeHeadline,
            style: AppText.h3b!.copyWith(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              height: 1.3,
              color: isDark ? Colors.white : const Color(0xff0f172a),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),

          Text(
            AboutUtils.aboutMeDetail,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 13.5,
              height: 1.65,
              color: isDark ? Colors.white70 : const Color(0xff475569),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Quick Info Grid
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xff18181b) : const Color(0xfff8fafc),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.06),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutMeData(data: "Name", information: myName),
                AboutMeData(
                    data: "Experience",
                    information:
                        "${ExperienceUtils.totalExperienceYears} (${ExperienceUtils.totalExperienceDuration})"),
                AboutMeData(
                  data: "Email",
                  information: valueEmail,
                  onTap: () => openURL("mailto:$valueEmail"),
                ),
                AboutMeData(
                  data: "Location",
                  information: myLocationAddress,
                  onTap: () => openURL(myLocationLink),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Core Engineering Highlights
          _buildStrengthCard(
            Icons.architecture_rounded,
            "Clean Architecture",
            "Decoupled BLoC/Provider & Repository patterns for testable code.",
            isDark,
          ),
          const SizedBox(height: 10),
          _buildStrengthCard(
            Icons.speed_rounded,
            "Performance First",
            "60fps smooth animations, memory profiling & 99.8% crash-free rate.",
            isDark,
          ),
          const SizedBox(height: 10),
          _buildStrengthCard(
            Icons.cloud_sync_rounded,
            "Offline-First Sync",
            "Local SQLite & Hive caching with seamless background cloud sync.",
            isDark,
          ),
          const SizedBox(height: 10),
          _buildStrengthCard(
            Icons.rocket_launch_rounded,
            "Store Deployment",
            "CI/CD release management on Google Play & Apple App Store.",
            isDark,
          ),
          const SizedBox(height: 24),

          // Technologies
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Core Frameworks & Tools:',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: AppTheme.c!.primary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 8,
              children: kTools
                  .map((e) => ToolTechWidget(techName: e))
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Technical Skills & Architecture:',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: AppTheme.c!.primary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 8,
              children: [
                ...technicalSkills,
                ...technicalSkills1,
              ].map((e) => ToolTechWidget(techName: e)).toList(),
            ),
          ),
          const SizedBox(height: 16),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Databases & Cloud:',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: AppTheme.c!.primary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 8,
              children: [
                ...dbList,
                ...dbList1,
              ].map((e) => ToolTechWidget(techName: e)).toList(),
            ),
          ),
          Space.y2!,
        ],
      ),
    );
  }
}

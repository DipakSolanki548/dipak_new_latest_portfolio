import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/app_theme.dart';
import '../../configs/space.dart';
import '../../provider/app_provider.dart';
import '../../text/textfile.dart';
import '../../utils/experience_utils.dart';
import '../../widget/custom_text_heading.dart';
import '../../widget/experience_view.dart';

class ExperienceMobile extends StatelessWidget {
  const ExperienceMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: CustomSectionHeading(
              text: '\nExperience & Education',
            ),
          ),
          Center(
            child: CustomSectionSubHeading(
              text: lblExperienceSubTitle,
            ),
          ),
          Space.y2!,

          // Professional Experience
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.work_rounded,
                  size: 18,
                  color: AppTheme.c!.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  lblProfessionalExperience,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: isDark ? Colors.white : const Color(0xff0f172a),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...ExperienceUtils.experienceList
              .map((e) => ExperienceView(data: e, isEducation: false)),

          const SizedBox(height: 24),

          // Education
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.school_rounded,
                  size: 18,
                  color: AppTheme.c!.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  lblEducation,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: isDark ? Colors.white : const Color(0xff0f172a),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...ExperienceUtils.educationList
              .map((e) => ExperienceView(data: e, isEducation: true)),

          Space.y2!,
        ],
      ),
    );
  }
}

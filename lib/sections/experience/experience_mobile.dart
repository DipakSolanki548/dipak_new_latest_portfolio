import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/app_theme.dart';
import '../../configs/app_typography.dart';
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
      padding: Space.h,
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
            children: [
              Icon(
                Icons.work_rounded,
                size: 20,
                color: AppTheme.c!.primary,
              ),
              Expanded(
                child: Text(
                  lblProfessionalExperience,
                  style: AppText.h3b!.copyWith(
                    fontFamily: 'Montserrat',
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
            children: [
              Icon(
                Icons.school_rounded,
                size: 20,
                color: AppTheme.c!.primary,
              ),
              const SizedBox(width: 10),
              Text(
                lblEducation,
                style: AppText.h3b!.copyWith(
                  fontFamily: 'Montserrat',
                  color: isDark ? Colors.white : const Color(0xff0f172a),
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

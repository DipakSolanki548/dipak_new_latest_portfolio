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

class ExperienceDesktop extends StatelessWidget {
  const ExperienceDesktop({Key? key}) : super(key: key);

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
              text: '\nExperience & Education',
            ),
            CustomSectionSubHeading(
              text: lblExperienceSubTitle,
            ),
            Space.y2!,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Professional Experience
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.work_rounded,
                            size: 20,
                            color: AppTheme.c!.primary,
                          ),
                          const SizedBox(width: 10),
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
                      const SizedBox(height: 20),
                      ...ExperienceUtils.experienceList
                          .map((e) => ExperienceView(data: e, isEducation: false)),
                    ],
                  ),
                ),
                const SizedBox(width: 40),

                // Education
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.school_rounded,
                            size: 20,
                            color: AppTheme.c!.primary,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              lblEducation,
                              style: AppText.h3b!.copyWith(
                                fontFamily: 'Montserrat',
                                color: isDark ? Colors.white : const Color(0xff0f172a),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ...ExperienceUtils.educationList
                          .map((e) => ExperienceView(data: e, isEducation: true)),
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

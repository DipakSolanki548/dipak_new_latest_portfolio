import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';
import '../../responsive/responsive.dart';
import '../../utils/utils.dart';
import 'experience_desktop.dart';
import 'experience_mobile.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Container(
        color: appProvider.isDark ? null : experienceBackgroundColor,
        padding: const EdgeInsets.only(bottom: 50),
        child: const Responsive(
          tablet: ExperienceDesktop(),
          mobile: ExperienceMobile(),
          desktop: ExperienceDesktop(),
        ));
  }
}

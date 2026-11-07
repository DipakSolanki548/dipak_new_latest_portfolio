import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';
import '../../responsive/responsive.dart';
import '../../utils/utils.dart';
import 'about_desktop.dart';
import 'about_mobile.dart';
import 'about_tablet.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Container(
      color: appProvider.isDark ? null : aboutBackgroundColor,
      padding: const EdgeInsets.only(bottom: 50),
      child: const Responsive(
        tablet: AboutTab(),
        mobile: AboutMobile(),
        desktop: AboutDesktop(),
      ),
    );
  }
}

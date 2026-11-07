import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/configs.dart';
import '../../provider/app_provider.dart';
import '../../responsive/responsive.dart';
import '../../utils/services_utils.dart';
import '../../utils/utils.dart';
import '../../widget/custom_text_heading.dart';

part 'services_desktop.dart';

part 'services_mobile.dart';

part 'widgets/_services_card.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Container(
        color: appProvider.isDark ? null : serviceBackgroundColor,
        padding: const EdgeInsets.only(bottom: 50),
        child: const Responsive(
          mobile: ServiceMobile(),
          tablet: ServiceMobile(),
          desktop: ServiceDesktop(),
        ));
  }
}

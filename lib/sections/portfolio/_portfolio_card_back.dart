import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/app_typography.dart';
import '../../constants.dart';
import '../../provider/app_provider.dart';

class PortFolioCardBackWidget extends StatelessWidget {
  const PortFolioCardBackWidget(
      {Key? key, required this.title, required this.desc, required this.link})
      : super(key: key);

  final String title;
  final String desc;
  final String link;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppText.h3!.copyWith(
            color: appProvider.isDark ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Text(
            desc,
            textAlign: TextAlign.center,
            maxLines: 4,
            style: AppText.l1!.copyWith(
              color: appProvider.isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ),
        link.isNotEmpty
            ? Divider(
                color: appProvider.isDark ? Colors.white : Colors.black38,
              )
            : const SizedBox.shrink(),
        link.isNotEmpty
            ? MaterialButton(
                height: 40.0,
                onPressed: () => openURL(link),
                color: const Color(0xff34CB62),
                child: Text(
                  'View',
                  style: AppText.l1!.copyWith(
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}

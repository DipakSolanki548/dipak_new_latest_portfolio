import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/configs.dart';
import '../provider/app_provider.dart';
import '../provider/scroll_provider.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final isDark = appProvider.isDark;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => scrollProvider.scroll(0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.c!.primary!.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppTheme.c!.primary!.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                "<DS>",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                  color: AppTheme.c!.primary,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "Dipak Solanki",
              style: TextStyle(
                fontFamily: 'Agustina',
                fontSize: 20,
                color: isDark ? Colors.white : const Color(0xff0f172a),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/configs.dart';
import '../provider/app_provider.dart';
import '../provider/scroll_provider.dart';

class NavBarActionButton extends StatefulWidget {
  final String label;
  final int index;
  const NavBarActionButton({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);

  @override
  State<NavBarActionButton> createState() => _NavBarActionButtonState();
}

class _NavBarActionButtonState extends State<NavBarActionButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => scrollProvider.scroll(widget.index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isHover
                ? AppTheme.c!.primary!.withValues(alpha: 0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: isHover ? FontWeight.w700 : FontWeight.w600,
              fontSize: 13.5,
              color: isHover
                  ? AppTheme.c!.primary
                  : (isDark ? Colors.white70 : const Color(0xff334155)),
            ),
          ),
        ),
      ),
    );
  }
}

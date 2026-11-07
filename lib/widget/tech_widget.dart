import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/configs.dart';
import '../provider/app_provider.dart';

class ToolTechWidget extends StatefulWidget {
  final String techName;
  final IconData? icon;

  const ToolTechWidget({
    Key? key,
    required this.techName,
    this.icon,
  }) : super(key: key);

  @override
  State<ToolTechWidget> createState() => _ToolTechWidgetState();
}

class _ToolTechWidgetState extends State<ToolTechWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isHover
              ? AppTheme.c!.primary!.withValues(alpha: 0.15)
              : (isDark
                  ? const Color(0xff1f1f26)
                  : const Color(0xfff1f5f9)),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isHover
                ? AppTheme.c!.primary!
                : (isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.06)),
            width: isHover ? 1.2 : 1.0,
          ),
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: AppTheme.c!.primary!.withValues(alpha: 0.18),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isHover ? AppTheme.c!.primary : Colors.tealAccent,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              widget.techName,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12.5,
                fontWeight: isHover ? FontWeight.w600 : FontWeight.w500,
                color: isDark ? Colors.white : const Color(0xff1e293b),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

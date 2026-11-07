import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/configs.dart';
import '../model/experience_model.dart';
import '../provider/app_provider.dart';

class ExperienceView extends StatefulWidget {
  final ExperienceModel data;
  final bool isEducation;

  const ExperienceView({
    Key? key,
    required this.data,
    this.isEducation = false,
  }) : super(key: key);

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;

    final lines = widget.data.description
        .split('\n')
        .where((l) => l.trim().isNotEmpty)
        .toList();
    final String summary = lines.isNotEmpty ? lines.first : "";
    final List<String> bulletPoints = lines.length > 1
        ? lines.sublist(1).map((l) => l.replaceAll(RegExp(r'^[•\-\*]\s*'), '').trim()).toList()
        : [];

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: isHover
              ? (isDark ? const Color(0xff22222b) : Colors.white)
              : (isDark ? const Color(0xff18181f) : const Color(0xfff8fafc)),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isHover
                ? AppTheme.c!.primary!
                : (isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.06)),
            width: isHover ? 1.5 : 1.0,
          ),
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: AppTheme.c!.primary!.withValues(alpha: 0.2),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withValues(alpha: 0.3)
                        : Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    widget.isEducation
                        ? Icons.school_rounded
                        : Icons.work_rounded,
                    size: 20,
                    color: AppTheme.c!.primary,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.title,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: isDark ? Colors.white : const Color(0xff0f172a),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.data.subTitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 13.5,
                          color: AppTheme.c!.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    size: 11,
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.data.duration,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white70 : const Color(0xff475569),
                    ),
                  ),
                ],
              ),
            ),
            if (summary.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                summary,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 13.5,
                  height: 1.6,
                  color: isDark ? Colors.white70 : const Color(0xff475569),
                ),
              ),
            ],
            if (bulletPoints.isNotEmpty) ...[
              const SizedBox(height: 10),
              ...bulletPoints.map((b) => Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_right_rounded,
                          size: 18,
                          color: AppTheme.c!.primary,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            b,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13,
                              height: 1.5,
                              color: isDark
                                  ? Colors.white60
                                  : const Color(0xff334155),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../configs/configs.dart';
import '../../../constants.dart';
import '../../../model/portfolio_model.dart';
import '../../../provider/app_provider.dart';

class ModernPortfolioCard extends StatefulWidget {
  final PortfolioModel project;

  const ModernPortfolioCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<ModernPortfolioCard> createState() => _ModernPortfolioCardState();
}

class _ModernPortfolioCardState extends State<ModernPortfolioCard> {
  bool isHover = false;

  void _showProjectDetails(BuildContext context, AppProvider appProvider) {
    final isDark = appProvider.isDark;
    final isGame = widget.project.isGame;
    final accentColor = isGame ? const Color(0xff8b5cf6) : AppTheme.c!.primary!;

    showDialog(
      context: context,
      builder: (ctx) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: isDark ? const Color(0xff18181f) : Colors.white,
          elevation: 24,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top Gradient Header Bar
                  Container(
                    height: 5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isGame
                            ? [const Color(0xff8b5cf6), const Color(0xffec4899)]
                            : [AppTheme.c!.primary!, const Color(0xff06b6d4)],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 82,
                              height: 82,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: isGame
                                      ? [
                                          const Color(0xffc084fc),
                                          const Color(0xfff472b6)
                                        ]
                                      : [accentColor, const Color(0xff38bdf8)],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: accentColor.withValues(alpha: 0.35),
                                    blurRadius: 18,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(2.5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(19.5),
                                child: Container(
                                  color: isDark
                                      ? const Color(0xff27272a)
                                      : const Color(0xfff1f5f9),
                                  child: Image.asset(
                                    widget.project.projectIcon,
                                    cacheWidth: 320,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                    errorBuilder: (c, e, s) => Container(
                                      color: isDark
                                          ? const Color(0xff27272a)
                                          : const Color(0xfff1f5f9),
                                      child: Icon(
                                        isGame
                                            ? Icons.sports_esports_rounded
                                            : Icons.apps_rounded,
                                        size: 40,
                                        color: accentColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    spacing: 6,
                                    runSpacing: 6,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 3.5),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: isGame
                                                ? [
                                                    const Color(0xff8b5cf6),
                                                    const Color(0xffd946ef)
                                                  ]
                                                : [
                                                    const Color(0xff0284c7),
                                                    const Color(0xff06b6d4)
                                                  ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              isGame
                                                  ? Icons.sports_esports_rounded
                                                  : Icons.phone_android_rounded,
                                              size: 11,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              isGame ? "GAME" : "APP",
                                              style: const TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: 0.6,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 3.5),
                                        decoration: BoxDecoration(
                                          color: isDark
                                              ? const Color(0xff27272a)
                                              : const Color(0xfff1f5f9),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          border: Border.all(
                                            color: isDark
                                                ? Colors.white12
                                                : Colors.black12,
                                          ),
                                        ),
                                        child: Text(
                                          widget.project.domain,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: isDark
                                                ? Colors.white70
                                                : const Color(0xff334155),
                                          ),
                                        ),
                                      ),
                                      if (widget.project.category.isNotEmpty &&
                                          widget.project.category !=
                                              widget.project.domain)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 9, vertical: 3.5),
                                          decoration: BoxDecoration(
                                            color: accentColor
                                                .withValues(alpha: 0.12),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          child: Text(
                                            widget.project.category,
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 10.5,
                                              fontWeight: FontWeight.w600,
                                              color: accentColor,
                                            ),
                                          ),
                                        ),
                                      ...widget.project.techStack.map((t) => Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 9, vertical: 3.5),
                                            decoration: BoxDecoration(
                                              color: isDark
                                                  ? const Color(0xff22222a)
                                                  : const Color(0xfff1f5f9),
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              border: Border.all(
                                                color: isDark
                                                    ? Colors.white12
                                                    : Colors.black12,
                                              ),
                                            ),
                                            child: Text(
                                              t,
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 10.5,
                                                fontWeight: FontWeight.w600,
                                                color: isDark
                                                    ? Colors.white70
                                                    : const Color(0xff334155),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    widget.project.projectTitle,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                      color: isDark
                                          ? Colors.white
                                          : const Color(0xff0f172a),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.close_rounded,
                                color: isDark ? Colors.white60 : Colors.black54,
                              ),
                              onPressed: () => Navigator.of(ctx).pop(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Divider(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.08)
                              : Colors.black.withValues(alpha: 0.06),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "ABOUT THIS PROJECT",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 11.5,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0,
                            color: accentColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.project.projectDescription,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            height: 1.65,
                            color: isDark
                                ? Colors.white70
                                : const Color(0xff334155),
                          ),
                        ),
                        const SizedBox(height: 26),
                        Wrap(
                          alignment: WrapAlignment.end,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 12,
                          runSpacing: 10,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: Text(
                                "Close",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: isDark ? Colors.white60 : Colors.black54,
                                ),
                              ),
                            ),
                            if (widget.project.appleStoreLink.isNotEmpty)
                              ElevatedButton.icon(
                                icon: const Icon(
                                  FontAwesomeIcons.apple,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "App Store",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff000000),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  openURL(widget.project.appleStoreLink);
                                },
                              ),
                            if (widget.project.projectLink.isNotEmpty)
                              ElevatedButton.icon(
                                icon: const Icon(
                                  FontAwesomeIcons.googlePlay,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Google Play",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff01875f),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  openURL(widget.project.projectLink);
                                },
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStorePill({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return InkWell(
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4.5),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xff22222a) : const Color(0xfff1f5f9),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isDark ? Colors.white12 : Colors.black12,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 11, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: isDark ? Colors.white : const Color(0xff0f172a),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsButton(bool isDark, bool isGame) {
    final accentColor = isGame ? const Color(0xff8b5cf6) : AppTheme.c!.primary!;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(
        color: isHover
            ? accentColor
            : (isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.05)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Details",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: isHover
                  ? Colors.white
                  : (isDark ? Colors.white70 : const Color(0xff334155)),
            ),
          ),
          const SizedBox(width: 4),
          AnimatedSlide(
            duration: const Duration(milliseconds: 200),
            offset: isHover ? const Offset(0.2, 0) : Offset.zero,
            child: Icon(
              Icons.arrow_forward_rounded,
              size: 13,
              color: isHover
                  ? Colors.white
                  : (isDark ? Colors.white70 : const Color(0xff334155)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;
    final isGame = widget.project.isGame;
    final accentColor = isGame ? const Color(0xff8b5cf6) : AppTheme.c!.primary!;

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showProjectDetails(context, appProvider),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, isHover ? -6 : 0, 0),
          decoration: BoxDecoration(
            color: isDark
                ? (isHover ? const Color(0xff1d1d26) : const Color(0xff16161c))
                : (isHover ? Colors.white : const Color(0xfffbfcfd)),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHover
                  ? (isGame ? const Color(0xffc084fc) : accentColor)
                  : (isDark
                      ? Colors.white.withValues(alpha: 0.08)
                      : Colors.black.withValues(alpha: 0.07)),
              width: isHover ? 1.6 : 1.0,
            ),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      color: (isGame ? const Color(0xffa855f7) : accentColor)
                          .withValues(alpha: isDark ? 0.32 : 0.20),
                      blurRadius: 22,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: isDark
                          ? Colors.black.withValues(alpha: 0.4)
                          : Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Ambient Accent Stripe
                AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  height: 3.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isGame
                          ? [
                              const Color(0xff8b5cf6),
                              const Color(0xffec4899),
                            ]
                          : [
                              accentColor,
                              const Color(0xff06b6d4),
                            ],
                    ),
                  ),
                ),

                // Card Body (compact, snug, no wasted space)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top Block: Big 74x74 Icon on left + Badges & Title on right
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Big Prominent App Squircle Icon
                            AnimatedScale(
                              scale: isHover ? 1.06 : 1.0,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeOutCubic,
                              child: Container(
                                width: 74,
                                height: 74,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: isHover
                                        ? (isGame
                                            ? [
                                                const Color(0xffc084fc),
                                                const Color(0xfff472b6)
                                              ]
                                            : [
                                                accentColor,
                                                const Color(0xff38bdf8)
                                              ])
                                        : (isDark
                                            ? [
                                                Colors.white.withValues(alpha: 0.18),
                                                Colors.white.withValues(alpha: 0.06),
                                              ]
                                            : [
                                                Colors.black.withValues(alpha: 0.12),
                                                Colors.black.withValues(alpha: 0.04),
                                              ]),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: (isGame
                                              ? const Color(0xffa855f7)
                                              : accentColor)
                                          .withValues(
                                              alpha: isHover
                                                  ? 0.45
                                                  : (isDark ? 0.35 : 0.12)),
                                      blurRadius: isHover ? 18 : 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Container(
                                    color: isDark
                                        ? const Color(0xff18181f)
                                        : const Color(0xfff8fafc),
                                    child: Image.asset(
                                      widget.project.projectIcon,
                                      cacheWidth: 280,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                      errorBuilder: (ctx, err, stack) =>
                                          Container(
                                      color: isDark
                                          ? const Color(0xff27272a)
                                          : const Color(0xfff1f5f9),
                                      child: Icon(
                                        isGame
                                            ? Icons.sports_esports_rounded
                                            : Icons.apps_rounded,
                                        color: isGame
                                            ? const Color(0xffc084fc)
                                            : accentColor,
                                        size: 34,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ),
                            ),
                            const SizedBox(width: 14),

                            // Right Column: Badges + Title + Category
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Badges row
                                  Row(
                                    children: [
                                      // APP / GAME Pill
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 3),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: isGame
                                                ? [
                                                    const Color(0xff8b5cf6),
                                                    const Color(0xffd946ef)
                                                  ]
                                                : [
                                                    const Color(0xff0284c7),
                                                    const Color(0xff06b6d4)
                                                  ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: (isGame
                                                      ? const Color(0xff8b5cf6)
                                                      : const Color(0xff0284c7))
                                                  .withValues(alpha: 0.35),
                                              blurRadius: 4,
                                              offset: const Offset(0, 1.5),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              isGame
                                                  ? Icons
                                                      .sports_esports_rounded
                                                  : Icons
                                                      .phone_android_rounded,
                                              size: 9.5,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(width: 3),
                                            Text(
                                              isGame ? "GAME" : "APP",
                                              style: const TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 8.5,
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: 0.6,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 5),

                                      // Domain Tag
                                      Flexible(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: isDark
                                                ? const Color(0xff22222a)
                                                : const Color(0xfff1f5f9),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: isDark
                                                  ? Colors.white12
                                                  : Colors.black12,
                                            ),
                                          ),
                                          child: Text(
                                            widget.project.domain.toUpperCase(),
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 8.5,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.5,
                                              color: isDark
                                                  ? Colors.white70
                                                  : const Color(0xff475569),
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6),

                                      // Store mini icons
                                      if (widget.project.projectLink.isNotEmpty) ...[
                                        const Icon(
                                          FontAwesomeIcons.googlePlay,
                                          size: 11,
                                          color: Color(0xff01875f),
                                        ),
                                        const SizedBox(width: 4),
                                      ],
                                      if (widget.project.appleStoreLink.isNotEmpty)
                                        Icon(
                                          FontAwesomeIcons.apple,
                                          size: 11.5,
                                          color: isDark
                                              ? Colors.white70
                                              : Colors.black87,
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),

                                  // Project Title
                                  Text(
                                    widget.project.projectTitle,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16.5,
                                      height: 1.2,
                                      color: isHover
                                          ? (isGame
                                              ? const Color(0xffc084fc)
                                              : accentColor)
                                          : (isDark
                                              ? Colors.white
                                              : const Color(0xff0f172a)),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 3),

                                  // Category Subtitle
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.label_outline_rounded,
                                        size: 10.5,
                                        color: (isGame
                                                ? const Color(0xffc084fc)
                                                : accentColor)
                                            .withValues(alpha: 0.8),
                                      ),
                                      const SizedBox(width: 3.5),
                                      Expanded(
                                        child: Text(
                                          widget.project.category.isNotEmpty
                                              ? widget.project.category
                                              : widget.project.domain,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: (isGame
                                                    ? const Color(0xffc084fc)
                                                    : accentColor)
                                                .withValues(alpha: 0.9),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Project Description (Full Width)
                        Text(
                          widget.project.projectDescription,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            height: 1.45,
                            color: isDark
                                ? Colors.white60
                                : const Color(0xff64748b),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),

                        // Tech Stack tags
                        Wrap(
                          spacing: 4,
                          runSpacing: 3,
                          children: widget.project.techStack.take(3).map((t) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.white.withValues(alpha: 0.06)
                                    : Colors.black.withValues(alpha: 0.04),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                t,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 9.5,
                                  fontWeight: FontWeight.w600,
                                  color: isDark
                                      ? Colors.white70
                                      : const Color(0xff475569),
                                ),
                              ),
                            );
                          }).toList(),
                        ),

                        const Spacer(),

                        // Bottom Action Bar
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Divider(
                              color: isDark
                                  ? Colors.white.withValues(alpha: 0.08)
                                  : Colors.black.withValues(alpha: 0.06),
                              height: 1,
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 6,
                              runSpacing: 4,
                              children: [
                                // Left: Store action pills
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (widget.project.projectLink.isNotEmpty)
                                      _buildStorePill(
                                        icon: FontAwesomeIcons.googlePlay,
                                        label: "Play",
                                        color: const Color(0xff01875f),
                                        onTap: () =>
                                            openURL(widget.project.projectLink),
                                        isDark: isDark,
                                      ),
                                    if (widget.project.appleStoreLink
                                        .isNotEmpty) ...[
                                      if (widget.project.projectLink.isNotEmpty)
                                        const SizedBox(width: 6),
                                      _buildStorePill(
                                        icon: FontAwesomeIcons.apple,
                                        label: "iOS",
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black87,
                                        onTap: () => openURL(
                                            widget.project.appleStoreLink),
                                        isDark: isDark,
                                      ),
                                    ],
                                    if (widget.project.projectLink.isEmpty &&
                                        widget.project.appleStoreLink.isEmpty)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 3.5),
                                        decoration: BoxDecoration(
                                          color: isDark
                                              ? Colors.white
                                                  .withValues(alpha: 0.05)
                                              : Colors.black
                                                  .withValues(alpha: 0.04),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.verified_rounded,
                                              size: 11,
                                              color: accentColor,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              "Live Project",
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 10.5,
                                                fontWeight: FontWeight.w600,
                                                color: isDark
                                                    ? Colors.white54
                                                    : const Color(0xff64748b),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),

                                // Right: Details button with animated sliding arrow
                                _buildDetailsButton(isDark, isGame),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

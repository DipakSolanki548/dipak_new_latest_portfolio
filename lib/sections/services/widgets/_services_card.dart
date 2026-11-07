part of '../services.dart';

class _ServiceCard extends StatefulWidget {
  final String serviceIcon;
  final String serviceTitle;
  final String serviceDescription;

  const _ServiceCard({
    Key? key,
    required this.serviceIcon,
    required this.serviceTitle,
    required this.serviceDescription,
  }) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;

    // Parse bullet points if description contains newlines or hyphens
    final lines = widget.serviceDescription
        .split('\n')
        .where((l) => l.trim().isNotEmpty)
        .toList();
    final String summary = lines.isNotEmpty ? lines.first : "";
    final List<String> bulletPoints = lines.length > 1
        ? lines.sublist(1).map((l) => l.replaceAll(RegExp(r'^-\s*'), '').trim()).toList()
        : [];

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, isHover ? -8 : 0, 0),
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: isHover
              ? (isDark ? const Color(0xff22222b) : Colors.white)
              : (isDark ? const Color(0xff18181f) : const Color(0xfff8fafc)),
          borderRadius: BorderRadius.circular(22),
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
                    color: AppTheme.c!.primary!.withValues(alpha: 0.22),
                    blurRadius: 22,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withValues(alpha: 0.3)
                        : Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon squircle
                Container(
                  width: 58,
                  height: 58,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppTheme.c!.primary!.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Image.asset(
                    widget.serviceIcon,
                    fit: BoxFit.contain,
                    errorBuilder: (c, e, s) => Icon(
                      Icons.apps_rounded,
                      size: 28,
                      color: AppTheme.c!.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                // Title
                Text(
                  widget.serviceTitle,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: isDark ? Colors.white : const Color(0xff0f172a),
                  ),
                ),
                const SizedBox(height: 8),

                // Summary
                Text(
                  summary,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 13.5,
                    height: 1.5,
                    color: isDark ? Colors.white70 : const Color(0xff475569),
                  ),
                ),
                const SizedBox(height: 16),

                // Bullet points
                ...bulletPoints.map((point) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            size: 15,
                            color: AppTheme.c!.primary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              point,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 13,
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
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../configs/configs.dart';
import '../constants.dart';
import '../provider/app_provider.dart';
import '../utils/utils.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({Key? key}) : super(key: key);

  static const List<IconData> _icons = [
    FontAwesomeIcons.facebook,
    FontAwesomeIcons.instagram,
    FontAwesomeIcons.xTwitter,
  ];

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;

    return Wrap(
      spacing: 12,
      runSpacing: 10,
      children: _icons.asMap().entries.map((e) {
        return _SocialIconBtn(
          icon: e.value,
          url: StaticUtils.socialLinks[e.key],
          isDark: isDark,
        );
      }).toList(),
    );
  }
}

class _SocialIconBtn extends StatefulWidget {
  final IconData icon;
  final String url;
  final bool isDark;

  const _SocialIconBtn({
    Key? key,
    required this.icon,
    required this.url,
    required this.isDark,
  }) : super(key: key);

  @override
  State<_SocialIconBtn> createState() => _SocialIconBtnState();
}

class _SocialIconBtnState extends State<_SocialIconBtn> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: () => openURL(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isHover
                ? AppTheme.c!.primary
                : (widget.isDark
                    ? const Color(0xff1f1f26)
                    : const Color(0xfff1f5f9)),
            border: Border.all(
              color: isHover
                  ? AppTheme.c!.primary!
                  : (widget.isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.black.withValues(alpha: 0.08)),
            ),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      color: AppTheme.c!.primary!.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    )
                  ]
                : null,
          ),
          child: Center(
            child: Icon(
              widget.icon,
              size: 17,
              color: isHover
                  ? Colors.white
                  : (widget.isDark ? Colors.white70 : const Color(0xff334155)),
            ),
          ),
        ),
      ),
    );
  }
}

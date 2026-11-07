part of '../main_section.dart';

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final isDark = appProvider.isDark;

    return Drawer(
      child: Material(
        color: isDark ? const Color(0xff121217) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 40.0, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: NavBarLogo(),
              ),
              const SizedBox(height: 16),
              Divider(color: isDark ? Colors.white10 : Colors.black12),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xff1a1a22) : const Color(0xfff8fafc),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: Icon(
                    isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                    color: isDark ? Colors.amber : AppTheme.c!.primary,
                  ),
                  title: Text(
                    isDark ? "Dark Theme" : "Light Theme",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: isDark ? Colors.white : const Color(0xff0f172a),
                    ),
                  ),
                  trailing: Switch(
                    inactiveTrackColor: Colors.grey.shade400,
                    value: isDark,
                    onChanged: (value) {
                      appProvider.setTheme(
                        value ? ThemeMode.dark : ThemeMode.light,
                      );
                    },
                    activeThumbColor: AppTheme.c!.primary,
                  ),
                ),
              ),
              Divider(color: isDark ? Colors.white10 : Colors.black12),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  children: [
                    ...NavBarUtils.names.asMap().entries.map(
                          (e) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              mouseCursor: SystemMouseCursors.click,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hoverColor:
                                  AppTheme.c!.primary!.withValues(alpha: 0.12),
                              leading: Icon(
                                NavBarUtils.icons[e.key],
                                color: AppTheme.c!.primary,
                                size: 20,
                              ),
                              title: Text(
                                e.value,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: isDark
                                      ? Colors.white
                                      : const Color(0xff0f172a),
                                ),
                              ),
                              onTap: () {
                                if (Responsive.isMobile(context)) {
                                  scrollProvider.scrollMobile(e.key);
                                } else {
                                  scrollProvider.scrollTablet(e.key);
                                }
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        openURL(myCVLink);
                      },
                      icon: const Icon(
                        Icons.download_rounded,
                        size: 16,
                      ),
                      label: const Text(
                        "Download Resume",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppTheme.c!.primary!),
                        foregroundColor: AppTheme.c!.primary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

part of 'services.dart';

class ServiceMobile extends StatelessWidget {
  const ServiceMobile({Key? key}) : super(key: key);

  Widget _buildStepItem(String num, String title, String desc, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff121217) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.06),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            num,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: AppTheme.c!.primary,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: isDark ? Colors.white : const Color(0xff0f172a),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    height: 1.4,
                    color: isDark ? Colors.white60 : const Color(0xff64748b),
                  ),
                ),
              ],
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

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: '\nWhat I Offer',
          ),
          const CustomSectionSubHeading(
            text: 'Specialized mobile engineering, scalable architecture & rapid MVP solutions.\n\n',
          ),
          Space.y!,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ServicesUtils.servicesTitles.length,
            separatorBuilder: (context, index) => const SizedBox(height: 18),
            itemBuilder: (context, index) {
              return _ServiceCard(
                serviceIcon: ServicesUtils.servicesIcons[index],
                serviceTitle: ServicesUtils.servicesTitles[index],
                serviceDescription: ServicesUtils.servicesDescription[index],
              );
            },
          ),
          const SizedBox(height: 32),

          // Development Workflow
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xff18181f) : const Color(0xfff8fafc),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.06),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.alt_route_rounded,
                        size: 18,
                        color: AppTheme.c!.primary,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Development Workflow",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: isDark ? Colors.white : const Color(0xff0f172a),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                _buildStepItem(
                  "01",
                  "Discovery & Architecture",
                  "Analyzing business goals, clean architecture & state management.",
                  isDark,
                ),
                _buildStepItem(
                  "02",
                  "UI/UX & Prototyping",
                  "Building interactive responsive Flutter prototypes with 60fps micro-interactions.",
                  isDark,
                ),
                _buildStepItem(
                  "03",
                  "Robust Engineering",
                  "Clean code, SOLID principles, offline caching, and unit/widget testing.",
                  isDark,
                ),
                _buildStepItem(
                  "04",
                  "Store Launch & Scale",
                  "Google Play & App Store submissions, CI/CD, and scaling.",
                  isDark,
                ),
              ],
            ),
          ),
          Space.y2!,
        ],
      ),
    );
  }
}

part of 'services.dart';

class ServiceDesktop extends StatefulWidget {
  const ServiceDesktop({Key? key}) : super(key: key);

  @override
  ServiceDesktopState createState() => ServiceDesktopState();
}

class ServiceDesktopState extends State<ServiceDesktop> {
  Widget _buildStepCard(String num, String title, String desc, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff121217) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.06),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            num,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w900,
              fontSize: 22,
              color: AppTheme.c!.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: isDark ? Colors.white : const Color(0xff0f172a),
            ),
          ),
          const SizedBox(height: 6),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;

    return Center(
      child: Container(
        padding: Space.h,
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            const CustomSectionHeading(
              text: '\nWhat I Offer',
            ),
            const CustomSectionSubHeading(
              text: 'Specialized mobile engineering, scalable architecture & rapid MVP solutions.\n\n',
            ),
            Space.y!,
            LayoutBuilder(
              builder: (context, constraints) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ServicesUtils.servicesTitles.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    mainAxisExtent: 370,
                  ),
                  itemBuilder: (context, index) {
                    return _ServiceCard(
                      serviceIcon: ServicesUtils.servicesIcons[index],
                      serviceTitle: ServicesUtils.servicesTitles[index],
                      serviceDescription:
                          ServicesUtils.servicesDescription[index],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 40),

            // Development Workflow Process
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xff18181f)
                    : const Color(0xfff8fafc),
                borderRadius: BorderRadius.circular(22),
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
                          size: 20,
                          color: AppTheme.c!.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "My End-to-End Development Workflow",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color:
                              isDark ? Colors.white : const Color(0xff0f172a),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStepCard(
                          "01",
                          "Discovery & Architecture",
                          "Analyzing business goals, designing clean architecture & selecting the optimal state management.",
                          isDark,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _buildStepCard(
                          "02",
                          "UI/UX & Prototyping",
                          "Building interactive responsive Flutter prototypes with smooth 60fps micro-interactions.",
                          isDark,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _buildStepCard(
                          "03",
                          "Robust Engineering",
                          "Clean code, SOLID principles, offline caching, API security & unit/widget testing.",
                          isDark,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _buildStepCard(
                          "04",
                          "Store Launch & Scale",
                          "Google Play & App Store submissions, CI/CD pipelines, analytics & post-launch scaling.",
                          isDark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Space.y2!,
          ],
        ),
      ),
    );
  }
}

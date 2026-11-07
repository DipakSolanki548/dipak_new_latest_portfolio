import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/app_theme.dart';
import '../../configs/space.dart';
import '../../model/testimonial_model.dart';
import '../../provider/app_provider.dart';
import '../../responsive/responsive.dart';
import '../../widget/custom_text_heading.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({Key? key}) : super(key: key);

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  int _currentIndex = 0;
  Timer? _autoPlayTimer;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _autoPlayTimer?.cancel();
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 6), (timer) {
      if (!_isHovered && mounted) {
        final nextIndex =
            (_currentIndex + 1) % TestimonialsData.testimonials.length;
        _pageController.animateToPage(
          nextIndex,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _goTo(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1100),
        padding: Space.h,
        child: Column(
          children: [
            const CustomSectionHeading(text: '\nClient Testimonials'),
            const CustomSectionSubHeading(
              text:
                  'Hear from founders, directors, and tech leads who trusted my mobile engineering.',
            ),
            Space.y1!,
            MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: Column(
                children: [
                  SizedBox(
                    height: isMobile ? 320 : (isTablet ? 290 : 260),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: TestimonialsData.testimonials.length,
                      onPageChanged: (index) {
                        setState(() => _currentIndex = index);
                      },
                      itemBuilder: (context, index) {
                        final item = TestimonialsData.testimonials[index];
                        final isActive = index == _currentIndex;

                        return AnimatedScale(
                          scale: isActive ? 1.0 : 0.95,
                          duration: const Duration(milliseconds: 300),
                          child: _buildTestimonialCard(
                            item: item,
                            isDark: isDark,
                            isMobile: isMobile,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Carousel Controls (Previous / Dots / Next)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Prev Button
                      _buildNavArrow(
                        icon: Icons.chevron_left_rounded,
                        isDark: isDark,
                        onTap: () {
                          final prevIndex = _currentIndex > 0
                              ? _currentIndex - 1
                              : TestimonialsData.testimonials.length - 1;
                          _goTo(prevIndex);
                        },
                      ),
                      const SizedBox(width: 14),

                      // Indicators
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          TestimonialsData.testimonials.length,
                          (idx) {
                            final isSel = idx == _currentIndex;
                            return MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => _goTo(idx),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  height: 8,
                                  width: isSel ? 26 : 8,
                                  decoration: BoxDecoration(
                                    color: isSel
                                        ? AppTheme.c!.primary
                                        : (isDark
                                            ? Colors.white24
                                            : Colors.black26),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 14),

                      // Next Button
                      _buildNavArrow(
                        icon: Icons.chevron_right_rounded,
                        isDark: isDark,
                        onTap: () {
                          final nextIndex = (_currentIndex + 1) %
                              TestimonialsData.testimonials.length;
                          _goTo(nextIndex);
                        },
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

  Widget _buildNavArrow({
    required IconData icon,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        mouseCursor: SystemMouseCursors.click,
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark ? const Color(0xff1f1f26) : const Color(0xfff1f5f9),
            border: Border.all(
              color: isDark ? Colors.white12 : Colors.black12,
            ),
          ),
          child: Icon(
            icon,
            size: 22,
            color: isDark ? Colors.white70 : const Color(0xff334155),
          ),
        ),
      ),
    );
  }

  Widget _buildTestimonialCard({
    required TestimonialModel item,
    required bool isDark,
    required bool isMobile,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      padding: EdgeInsets.all(isMobile ? 18 : 24),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff18181f) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.06),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.35)
                : Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header: Stars + Project Tag
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 6,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  5,
                  (_) => const Icon(
                    Icons.star_rounded,
                    size: 18,
                    color: Color(0xfff59e0b),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item.projectType,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.c!.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Quote Text
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Text(
                "“${item.review}”",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: isMobile ? 13 : 14.5,
                  height: 1.6,
                  fontStyle: FontStyle.italic,
                  color: isDark ? Colors.white70 : const Color(0xff334155),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Client Info
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.c!.primary!,
                      AppTheme.c!.primary!.withValues(alpha: 0.7),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    item.avatarInitials,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.clientName,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: isDark ? Colors.white : const Color(0xff0f172a),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "${item.clientRole} • ${item.clientCompany}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white54 : const Color(0xff64748b),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

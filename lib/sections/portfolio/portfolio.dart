import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../animations/entrance_fader.dart';
import '../../configs/configs.dart';
import '../../model/portfolio_model.dart';
import '../../provider/app_provider.dart';
import '../../utils/project_utils.dart';
import '../../utils/utils.dart';
import 'widgets/modern_portfolio_card.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  String _selectedCategory = "All";
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  int _visibleCount = 9;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  int _getCount(String category) {
    if (category == "All") return ProjectUtils.projectList.length;
    if (category == "Applications") {
      return ProjectUtils.projectList.where((p) => !p.isGame).length;
    }
    if (category == "Games") {
      return ProjectUtils.projectList.where((p) => p.isGame).length;
    }
    return ProjectUtils.projectList
        .where((p) => p.domain.toLowerCase() == category.toLowerCase())
        .length;
  }

  List<PortfolioModel> _getFilteredProjects() {
    List<PortfolioModel> list = ProjectUtils.projectList;

    // Filter by Category
    if (_selectedCategory == "Applications") {
      list = list.where((p) => !p.isGame).toList();
    } else if (_selectedCategory == "Games") {
      list = list.where((p) => p.isGame).toList();
    } else if (_selectedCategory != "All") {
      list = list
          .where((p) => p.domain.toLowerCase() == _selectedCategory.toLowerCase())
          .toList();
    }

    // Filter by Search Query
    if (_searchQuery.trim().isNotEmpty) {
      final q = _searchQuery.toLowerCase().trim();
      list = list.where((p) {
        return p.projectTitle.toLowerCase().contains(q) ||
            p.projectDescription.toLowerCase().contains(q) ||
            p.domain.toLowerCase().contains(q) ||
            p.category.toLowerCase().contains(q) ||
            p.techStack.any((t) => t.toLowerCase().contains(q));
      }).toList();
    }

    return list;
  }

  Widget _buildCategoryChip({
    required String category,
    required int count,
    required bool isSelected,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    final primary = AppTheme.c!.primary!;
    return InkWell(
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
      borderRadius: BorderRadius.circular(24),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? primary
              : (isDark ? const Color(0xff27272a) : const Color(0xfff1f5f9)),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected
                ? primary
                : (isDark ? Colors.white12 : Colors.black12),
            width: 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: primary.withValues(alpha: 0.32),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (category == "Games") ...[
              Icon(
                Icons.sports_esports_rounded,
                size: 14,
                color: isSelected ? Colors.white : primary,
              ),
              const SizedBox(width: 6),
            ] else if (category == "Applications") ...[
              Icon(
                Icons.phone_android_rounded,
                size: 14,
                color: isSelected ? Colors.white : primary,
              ),
              const SizedBox(width: 6),
            ],
            Text(
              category,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected
                    ? Colors.white
                    : (isDark ? Colors.white70 : const Color(0xff475569)),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.25)
                    : (isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.black.withValues(alpha: 0.06)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "$count",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: isSelected
                      ? Colors.white
                      : (isDark ? Colors.white60 : const Color(0xff64748b)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required bool isDark,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: AppTheme.c!.primary),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white70 : const Color(0xff52525b),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDark;

    return Container(
      color: isDark ? null : portfolioBackgroundColor,
      padding: const EdgeInsets.only(top: 40, bottom: 60),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final isMobile = width < 680;
          final isTablet = width >= 680 && width < 1080;
          final isDesktop = width >= 1080;

          final int columns = isDesktop ? 3 : (isTablet ? 2 : 1);
          final double cardHeight = isMobile ? 228 : 220;
          final double gridSpacing = isMobile ? 16 : (isTablet ? 20 : 22);

          // Center bounds on ultrawide monitors
          final double horizontalPadding = isDesktop
              ? max(32.0, (width - 1200) / 2)
              : (isTablet ? 24.0 : 16.0);

          final filteredProjects = _getFilteredProjects();
          final int initialLimit = isDesktop ? 9 : 6;
          final displayedProjects =
              filteredProjects.take(_visibleCount).toList();

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top Pill
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppTheme.c!.primary!.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        size: 13,
                        color: AppTheme.c!.primary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "68 APPLICATIONS & GAMES",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                          color: AppTheme.c!.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Main Heading
                Text(
                  "Applications & Games",
                  style: (isMobile ? AppText.h2b : AppText.h1b)!.copyWith(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w800,
                    color: isDark ? Colors.white : const Color(0xff0f172a),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                // Live Search Bar
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xff18181f)
                          : const Color(0xfff8fafc),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: _searchQuery.isNotEmpty
                            ? AppTheme.c!.primary!
                            : (isDark
                                ? Colors.white.withValues(alpha: 0.1)
                                : Colors.black.withValues(alpha: 0.08)),
                        width: _searchQuery.isNotEmpty ? 1.5 : 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                              alpha: isDark ? 0.2 : 0.03),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (val) {
                        setState(() {
                          _searchQuery = val;
                          _visibleCount = initialLimit;
                        });
                      },
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13.5,
                        color: isDark ? Colors.white : const Color(0xff0f172a),
                      ),
                      decoration: InputDecoration(
                        hintText: "Search among 68 apps & games (e.g. bal, workerz, game)...",
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          color: isDark ? Colors.white38 : const Color(0xff94a3b8),
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          size: 20,
                          color: _searchQuery.isNotEmpty
                              ? AppTheme.c!.primary
                              : (isDark ? Colors.white54 : Colors.black45),
                        ),
                        suffixIcon: _searchQuery.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.close_rounded, size: 18),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() {
                                    _searchQuery = "";
                                    _visibleCount = initialLimit;
                                  });
                                },
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Category Filter Chips
                if (isMobile)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: ProjectUtils.categories.map((category) {
                        final isSelected = _selectedCategory == category;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: _buildCategoryChip(
                            category: category,
                            count: _getCount(category),
                            isSelected: isSelected,
                            isDark: isDark,
                            onTap: () {
                              setState(() {
                                _selectedCategory = category;
                                _visibleCount = initialLimit;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  )
                else
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: ProjectUtils.categories.map((category) {
                      final isSelected = _selectedCategory == category;
                      return _buildCategoryChip(
                        category: category,
                        count: _getCount(category),
                        isSelected: isSelected,
                        isDark: isDark,
                        onTap: () {
                          setState(() {
                            _selectedCategory = category;
                            _visibleCount = initialLimit;
                          });
                        },
                      );
                    }).toList(),
                  ),
                const SizedBox(height: 20),

                // Result counter label
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Showing ${displayedProjects.length} of ${filteredProjects.length} Projects",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white54 : const Color(0xff64748b),
                      ),
                    ),
                    if (_searchQuery.isNotEmpty) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.c!.primary!.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Filtered by '$_searchQuery'",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.c!.primary,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 24),

                // Responsive Projects Grid
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 280),
                  child: displayedProjects.isEmpty
                      ? Padding(
                          key: const ValueKey('empty_state'),
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Column(
                            children: [
                              Icon(
                                Icons.search_off_rounded,
                                size: 48,
                                color: isDark ? Colors.white24 : Colors.black26,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "No projects match your search or filter",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  color:
                                      isDark ? Colors.white54 : Colors.black45,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextButton(
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() {
                                    _searchQuery = "";
                                    _selectedCategory = "All";
                                    _visibleCount = initialLimit;
                                  });
                                },
                                child: const Text("Reset Filters"),
                              ),
                            ],
                          ),
                        )
                      : GridView.builder(
                          key: ValueKey('$_selectedCategory-$_searchQuery'),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: displayedProjects.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: columns,
                            crossAxisSpacing: gridSpacing,
                            mainAxisSpacing: gridSpacing,
                            mainAxisExtent: cardHeight,
                          ),
                          itemBuilder: (context, index) {
                            final project = displayedProjects[index];
                            return EntranceFader(
                              key: ValueKey(project.projectTitle),
                              delay: Duration(
                                  milliseconds: min(240, (index % 6) * 40)),
                              duration: const Duration(milliseconds: 320),
                              offset: const Offset(0, 18),
                              child: ModernPortfolioCard(project: project),
                            );
                          },
                        ),
                ),

                // Pagination & Incremental Loading Controls
                if (filteredProjects.length > initialLimit) ...[
                  const SizedBox(height: 36),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 10,
                    children: [
                      // Load More Button
                      if (_visibleCount < filteredProjects.length)
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _visibleCount = min(
                                  _visibleCount + 6, filteredProjects.length);
                            });
                          },
                          icon: const Icon(
                            Icons.add_circle_outline_rounded,
                            size: 16,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Load More (+6)",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.c!.primary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 13,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            elevation: 3,
                          ),
                        ),

                      // Show All Button
                      if (_visibleCount < filteredProjects.length)
                        OutlinedButton.icon(
                          onPressed: () {
                            setState(() {
                              _visibleCount = filteredProjects.length;
                            });
                          },
                          icon: Icon(
                            Icons.visibility_rounded,
                            size: 16,
                            color: AppTheme.c!.primary,
                          ),
                          label: Text(
                            "Show All (${filteredProjects.length})",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.c!.primary,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: AppTheme.c!.primary!.withValues(alpha: 0.5),
                              width: 1.5,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 13,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            backgroundColor:
                                AppTheme.c!.primary!.withValues(alpha: 0.05),
                          ),
                        ),

                      // Show Less Button
                      if (_visibleCount > initialLimit)
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _visibleCount = initialLimit;
                            });
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_up_rounded,
                            size: 18,
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                          label: Text(
                            "Show Less",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13,
                              color: isDark ? Colors.white70 : Colors.black54,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],

                // Portfolio Stats Summary Banner
                Container(
                  margin: const EdgeInsets.only(top: 48),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xff18181b).withValues(alpha: 0.7)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.08)
                          : Colors.black.withValues(alpha: 0.06),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isDark
                            ? Colors.black.withValues(alpha: 0.3)
                            : Colors.black.withValues(alpha: 0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 28,
                    runSpacing: 14,
                    children: [
                      _buildStatItem(
                        icon: Icons.apps_rounded,
                        label: "52+ Applications",
                        isDark: isDark,
                      ),
                      _buildStatItem(
                        icon: Icons.sports_esports_rounded,
                        label: "16+ Engaging Games",
                        isDark: isDark,
                      ),
                      _buildStatItem(
                        icon: Icons.shop_rounded,
                        label: "Google Play & App Store",
                        isDark: isDark,
                      ),
                      _buildStatItem(
                        icon: Icons.devices_rounded,
                        label: "Cross-Platform Ready",
                        isDark: isDark,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

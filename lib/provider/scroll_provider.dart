import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollProvider extends ChangeNotifier {
  final scrollController = ScrollController();

  ScrollController get controller => scrollController;

  final GlobalKey homeKey = GlobalKey(debugLabel: 'home_section');
  final GlobalKey aboutKey = GlobalKey(debugLabel: 'about_section');
  final GlobalKey experienceKey = GlobalKey(debugLabel: 'experience_section');
  final GlobalKey servicesKey = GlobalKey(debugLabel: 'services_section');
  final GlobalKey projectsKey = GlobalKey(debugLabel: 'projects_section');
  final GlobalKey contactKey = GlobalKey(debugLabel: 'contact_section');

  List<GlobalKey> get sectionKeys => [
        homeKey,
        aboutKey,
        experienceKey,
        servicesKey,
        projectsKey,
        contactKey,
      ];

  void scrollToSection(int index) {
    if (index == 0) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 650),
          curve: Curves.easeInOutCubic,
        );
      }
      return;
    }

    if (index < 0 || index >= sectionKeys.length) return;

    final targetContext = sectionKeys[index].currentContext;
    if (targetContext != null) {
      final box = targetContext.findRenderObject() as RenderBox?;
      if (box != null && box.hasSize && scrollController.hasClients) {
        final viewport = RenderAbstractViewport.of(box);
        final revealedOffset = viewport.getOffsetToReveal(box, 0.0);
        double target = revealedOffset.offset - 65.0; // compensate for navbar
        if (target < 0) target = 0;
        if (target > scrollController.position.maxScrollExtent) {
          target = scrollController.position.maxScrollExtent;
        }
        scrollController.animateTo(
          target,
          duration: const Duration(milliseconds: 650),
          curve: Curves.easeInOutCubic,
        );
        return;
      }

      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
        alignment: 0.0,
      );
    }
  }

  void scroll(int index) => scrollToSection(index);

  void scrollMobile(int index) => scrollToSection(index);

  void scrollTablet(int index) => scrollToSection(index);
}

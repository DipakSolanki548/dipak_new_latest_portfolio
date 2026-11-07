part of '../main_section.dart';

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);

    // Map each view index to its dedicated section key
    final Map<int, GlobalKey> keyMap = {
      0: scrollProvider.homeKey,
      1: scrollProvider.aboutKey,
      2: scrollProvider.experienceKey,
      3: scrollProvider.servicesKey,
      4: scrollProvider.projectsKey,
      6: scrollProvider.contactKey,
    };

    return SingleChildScrollView(
      controller: scrollProvider.controller,
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(
          BodyUtils.views.length,
          (index) => Container(
            key: keyMap[index],
            child: BodyUtils.views[index],
          ),
        ),
      ),
    );
  }
}

class PortfolioModel {
  final String projectTitle;
  final String projectIcon;
  final String projectDescription;
  final String projectLink;
  final String appleStoreLink;
  final String category;
  final String domain;
  final bool isGame;
  final List<String> _explicitTechStack;

  const PortfolioModel({
    required this.projectTitle,
    required this.projectIcon,
    required this.projectDescription,
    required this.projectLink,
    this.appleStoreLink = "",
    this.category = "Applications",
    this.domain = "Applications",
    this.isGame = false,
    List<String> techStack = const [],
  }) : _explicitTechStack = techStack;

  List<String> get techStack {
    if (_explicitTechStack.isNotEmpty) return _explicitTechStack;
    if (isGame) {
      return const ["BLoC", "Hive"];
    }
    if (domain.contains("Enterprise")) {
      return const ["BLoC", "Rest API", "Firebase"];
    }
    if (domain.contains("Tools") || domain.contains("Utilities")) {
      return const ["BLoC", "Hive", "Rest API"];
    }
    if (domain.contains("Social") || domain.contains("Media")) {
      return const ["BLoC", "Firebase", "Rest API"];
    }
    if (domain.contains("Health") || domain.contains("Lifestyle")) {
      return const ["BLoC", "Firebase", "Rest API"];
    }
    if (domain.contains("Education") || domain.contains("Faith")) {
      return const ["BLoC", "Hive", "Rest API"];
    }
    return const ["BLoC", "Rest API", "Firebase"];
  }
}

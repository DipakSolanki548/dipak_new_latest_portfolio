import '../model/experience_model.dart';

class ExperienceUtils {
  static final DateTime careerStartDate = DateTime(2018, 3, 1);

  static int get totalExperienceYearsNumber {
    final difference = DateTime.now().difference(careerStartDate).inDays;
    return difference ~/ 365;
  }

  static String get totalExperienceYears => "$totalExperienceYearsNumber+ Years";

  static String get totalExperienceDuration =>
      calculationBetweenDuration(careerStartDate, DateTime.now());

  static String calculationBetweenDuration(DateTime startDateTime, DateTime endTime) {
    final difference = endTime.difference(startDateTime).inDays;
    int years = difference ~/ 365;
    int months = (difference - years * 365) ~/ 30;

    if (years == 0) {
      return "$months Months";
    } else if (years > 1) {
      return "$years Years, $months Months";
    } else {
      return "$years Year, $months Months";
    }
  }

  static List<ExperienceModel> experienceList = [
    ExperienceModel(
      title: "Lead / Sr. Android & Flutter Developer",
      subTitle: "Skywave Info Solutions",
      duration:
          "Aug 2019 - Present (${calculationBetweenDuration(DateTime(2019, 8, 1), DateTime.now())})",
      description:
          "Lead cross-platform mobile engineer directing end-to-end architecture and release cycles across 50+ published Flutter & Android applications.\n• Architected scalable state management (BLoC, Provider) & Clean Architecture across Enterprise, Social, and Gaming domains.\n• Mentored a team of 6 engineers, established strict code review standards, and implemented automated CI/CD pipelines.\n• Optimized app startup performance by 35% and maintained crash-free session rates exceeding 99.8%.\n• Managed Google Play Console and Apple Developer release tracks.",
    ),
    ExperienceModel(
      title: "Sr. Android Developer",
      subTitle: "Wabodryms IT Solutions",
      duration:
          "Dec 2018 - Aug 2019 (${calculationBetweenDuration(DateTime(2018, 12, 1), DateTime(2019, 7, 31))})",
      description:
          "Senior mobile developer responsible for end-to-end development of custom enterprise applications.\n• Integrated complex RESTful APIs, Firebase Cloud Messaging, authentication, and secure payment gateways.\n• Gathered client requirements, created technical wireframes, and conducted sprint deliveries under Agile methodology.",
    ),
    ExperienceModel(
      title: "Jr. Android Developer",
      subTitle: "Hari Skyline",
      duration:
          "Mar 2018 - Dec 2018 (${calculationBetweenDuration(DateTime(2018, 3, 1), DateTime(2018, 11, 30))})",
      description:
          "Commenced professional engineering career building robust native Android applications.\n• Engineered responsive Material Design interfaces, multi-screen compatibility, and background services.\n• Implemented local persistence using SQLite and Room databases with offline-first synchronization.",
    ),
  ];

  static List<ExperienceModel> educationList = [
    ExperienceModel(
      title: "Master of Computer Applications (MCA)",
      subTitle: "Kalol Institute of Research Center (G.T.U.)",
      duration: "June 2016 - Mar 2018 | 7.89 CPI",
      description:
          "Graduated with distinction. Specialized in Advanced Mobile Computing, Software Architecture, Distributed Database Systems, and Cloud Engineering.",
    ),
    ExperienceModel(
      title: "Bachelor of Computer Applications (BCA)",
      subTitle: "Vrundavan B.C.A. College (H.N.G.U.)",
      duration: "June 2013 - Mar 2016 | 78.90%",
      description:
          "Strong foundation in Computer Science fundamentals: Object-Oriented Programming (Java/C++), Data Structures, Algorithms, Relational Databases, and Network Protocols.",
    ),
    ExperienceModel(
      title: "Higher Secondary Certificate (HSC)",
      subTitle: "G.S.H.S.E.B.",
      duration: "June 2011 - Mar 2013 | 85.81%",
      description:
          "Completed secondary education with top honors in General Science and Mathematics.",
    ),
  ];
}

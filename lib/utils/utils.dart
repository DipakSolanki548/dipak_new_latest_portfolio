import 'package:flutter/material.dart';

import '../sections/about/about.dart';
import '../sections/contact/contact.dart';
import '../sections/experience/experience.dart';
import '../sections/home/home.dart';
import '../sections/portfolio/portfolio.dart';
import '../sections/services/services.dart';
import '../sections/testimonials/testimonials.dart';
import '../widget/footer.dart';

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // photos
  static const String coloredPhoto = 'assets/photos/colored.png';
  static const String blackWhitePhoto = 'assets/photos/black-white.png';

  // work
  static const String dsc = 'assets/work/dsc.png';
  static const String sastaticket = 'assets/work/st.png';
  static const String university = 'assets/work/cui.png';
  static const String fullterIsb = 'assets/work/flutterIsl.png';

  // services
  static const String appDev = 'assets/services/app.png';
  static const String rapid = 'assets/services/rapid.png';
  static const String openSource = 'assets/services/open.png';

  static const List<String> socialIconURL = [
    "https://img.icons8.com/metro/208/ffffff/facebook-new--v2.png",
    "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
    "https://img.icons8.com/android/480/ffffff/twitter.png",
    // "https://img.icons8.com/metro/308/ffffff/linkedin.png",
    // "https://img.icons8.com/material-rounded/384/ffffff/github.png",
    // "https://img.icons8.com/ios-filled/500/ffffff/medium-monogram--v1.png"
  ];

  static const List<String> socialLinks = [
    "https://facebook.com/share/1CCdn8E2gA/",
    "https://www.instagram.com/itss.mee.dipak/",
    "https://twitter.com/Dipak548",
    // "https://linkedin.com/in/mhmzdev",
    // "https://github.com/mhmzdev",
    // "https://mhmzdev.medium.com"
  ];

  static const String resume =
      'https://drive.google.com/file/d/1WZv22PDd1DEtqrNPHxfsOV4vKmLkKo00/view?usp=sharing';
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Experience(),
    Services(),
    Portfolio(),
    TestimonialsSection(),
    Contact(),
    Footer(),
  ];
}

// Color aboutBackgroundColor = Colors.lightBlue.shade50;
// Color experienceBackgroundColor = Colors.teal.shade50;
// Color serviceBackgroundColor = Colors.yellow.shade50;
// Color portfolioBackgroundColor = Colors.white10;

Color aboutBackgroundColor = Colors.transparent;
Color experienceBackgroundColor = Colors.transparent;
Color serviceBackgroundColor = Colors.transparent;
Color portfolioBackgroundColor = Colors.transparent;

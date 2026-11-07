class TestimonialModel {
  final String clientName;
  final String clientRole;
  final String clientCompany;
  final String review;
  final double rating;
  final String projectType;
  final String avatarInitials;

  const TestimonialModel({
    required this.clientName,
    required this.clientRole,
    required this.clientCompany,
    required this.review,
    this.rating = 5.0,
    required this.projectType,
    required this.avatarInitials,
  });
}

class TestimonialsData {
  static const List<TestimonialModel> testimonials = [
    TestimonialModel(
      clientName: "Marcus Vance",
      clientRole: "VP of Mobile Engineering",
      clientCompany: "NexaCore Labs",
      review:
          "Dipak delivered our enterprise Flutter application ahead of schedule with flawless BLoC state management and offline-first persistence. His focus on micro-interactions and startup performance resulted in a stellar 4.9-star Play Store rating.",
      rating: 5.0,
      projectType: "Enterprise Mobile App",
      avatarInitials: "MV",
    ),
    TestimonialModel(
      clientName: "Elena Rostova",
      clientRole: "Lead Product Manager",
      clientCompany: "GeoTrack Technologies",
      review:
          "Working with Dipak on our GPS location camera app was an exceptional experience. He engineered complex background sync and native camera APIs on both Android and iOS with ease. A truly top-tier senior mobile developer.",
      rating: 5.0,
      projectType: "Utility & Location Tool",
      avatarInitials: "ER",
    ),
    TestimonialModel(
      clientName: "Rajesh Sharma",
      clientRole: "Technical Director",
      clientCompany: "Skywave Info Solutions",
      review:
          "Dipak is an outstanding engineering lead who directed our production pipeline across 50+ published Flutter & Android applications. His architecture standards and code reviews kept our crash-free rate above 99.8%.",
      rating: 5.0,
      projectType: "Multi-App Ecosystem",
      avatarInitials: "RS",
    ),
    TestimonialModel(
      clientName: "Carlos Mendez",
      clientRole: "Creative Director",
      clientCompany: "PlayForge Games",
      review:
          "The buttery-smooth 60 FPS performance and responsive mechanics Dipak built for our interactive mobile games exceeded all expectations. Rock-solid stability across both budget and flagship devices.",
      rating: 5.0,
      projectType: "Interactive Mobile Game",
      avatarInitials: "CM",
    ),
    TestimonialModel(
      clientName: "Sarah Jenkins",
      clientRole: "Head of Product",
      clientCompany: "OmniCommerce Global",
      review:
          "Dipak brought unparalleled clarity to our mobile development lifecycle. From REST API orchestration and FCM push notifications to encrypted Hive storage, everything was delivered cleanly and reliably.",
      rating: 5.0,
      projectType: "E-Commerce App",
      avatarInitials: "SJ",
    ),
  ];
}

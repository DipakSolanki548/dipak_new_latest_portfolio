# 🚀 Dipak Solanki — Professional Portfolio

[![Flutter](https://img.shields.io/badge/Flutter-3.38.3-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live%20Demo-brightgreen?logo=github)](https://dipaksolanki548.github.io/dipak_new_latest_portfolio/)

> **Live Website:** [https://dipaksolanki548.github.io/dipak_new_latest_portfolio/](https://dipaksolanki548.github.io/dipak_new_latest_portfolio/)  
> **Online CV / Resume:** [View Google Drive CV](https://drive.google.com/file/d/1WZv22PDd1DEtqrNPHxfsOV4vKmLkKo00/view?usp=sharing)

A high-performance, fully responsive modern portfolio web and mobile application engineered with **Flutter Web & Dart**, showcasing 6+ years of professional mobile engineering expertise, 60+ published production applications and games across the Google Play Store & Apple App Store, technical competencies, services, and career milestones.

---

## 👨‍💻 About The Author

**Dipak Solanki**  
*Lead / Sr. Flutter & Android Developer, Project Leader & Solutions Architect*

- 🏢 **Current Role:** Lead / Sr. Flutter & Android Developer at [Skywave Info Solutions](https://skywaveinfosolutions.com) (Aug 2019 – Present)
- 📱 **Track Record:** 60+ published Flutter mobile applications, Android native applications, 2D/3D games, and modern responsive Flutter web solutions.
- 🎯 **Specializations:** Clean Architecture, BLoC / Provider state management, responsive web rendering, memory profiling, 99.8% crash-free session rates, and end-to-end CI/CD app release pipelines across Google Play Console, Apple Developer Portal & Web hosting.
- 📬 **Email:** [dipaksolanki548@gmail.com](mailto:dipaksolanki548@gmail.com)
- 📞 **Phone & WhatsApp:** [+91 9913343548](tel:+919913343548)
- 📍 **Location:** Gujarat, India (Open to Remote & Global Relocation)

---

## ✨ Key Portfolio Features

- **📱 Multi-Platform Responsive Design:** Custom responsive engine (`Responsive.isMobile`, `isTablet`, `isDesktop`) delivering tailored layouts and navigation for mobile phones (320px–599px), tablets (600px–999px), and desktop viewports (1000px+).
- **🌓 Dynamic Dark & Light Theme:** Real-time theme toggle powered by Provider, with automatic background contrast shifts, theme-adaptive icon blending (`BlendMode.srcIn`), and persistent styling.
- **⚡ Zero Cumulative Layout Shift (CLS) Animations:** Typewriter designation animations in the hero banner engineered with locked-height containers (`SizedBox`), ensuring zero jitter or bouncing across viewports.
- **🎮 60+ Interactive Project Showcase:** Filterable portfolio tabs (All, Apps, Games) featuring high-resolution badges, domain tags, tech stack chips, and interactive project modal dialogs.
- **🔍 Responsive Project Detail Dialogs:**
  - *Mobile View:* Smart vertical button stacks (`Google Play` -> `App Store` -> `Close`).
  - *Desktop View:* Side-by-side store button rows for dual-link apps; compact, equal-sized centered buttons for single-link apps.
  - Overflow-protected with `SingleChildScrollView` for seamless scrolling on small screens.
- **💼 Comprehensive Experience Timeline:** Detailed career history at Skywave Info Solutions and Wabodryms IT Solutions with key architectural achievements, team leadership metrics, and startup performance optimizations.
- **🛠️ What I Offer (Services):** Dedicated services breakdown spanning Mobile App Development, Flutter Web & PWAs, and Rapid Prototyping & MVPs.
- **📬 Interactive Contact Hub:** Direct WhatsApp, phone call, email dispatch, and Google Maps location routing.
- **🔄 Automated CI/CD Deployment:** Automated GitHub Pages deployment via GitHub Actions upon pushing to the `gh-pages` branch.

---

## 🛠️ Technology Stack & Languages

| Category | Technologies & Tools |
|---|---|
| **Core Languages** | **Dart 3**, **Kotlin**, **Java**, **HTML5**, **CSS3**, **JavaScript** |
| **Frameworks** | **Flutter 3.38.3** (Web, Android, iOS), Flutter Web CanvasKit & Skwasm |
| **Architecture** | Clean Architecture, Model-View-Controller / Repository Pattern |
| **State Management** | Provider, ChangeNotifier |
| **Backend & Cloud** | Firebase (Auth, Cloud Firestore, Cloud Messaging FCM, Storage), RESTful Web APIs |
| **Local Storage** | SQLite, Room Database, Hive, Shared Preferences |
| **UI & Icons** | FontAwesome Icons, Montserrat Typography, Material 3 Icons |
| **Animation Tools** | AnimatedTextKit, EntranceFader, Matrix4 Hover Transformations |
| **Version Control & CI/CD** | Git, GitHub, GitHub Actions, GitHub Pages, Google Play Console, Apple App Store Connect |

---

## 📂 Project Architecture & Directory Structure

```text
dipak_new_latest_portfolio/
├── .github/
│   └── workflows/
│       └── deploy.yml              # GitHub Actions automated Pages build & deploy
├── assets/                         # Static assets & graphics
│   ├── photos/                     # Profile portraits & avatar images
│   ├── services/                   # Service card icons (app, open-source, rapid)
│   ├── projects/                   # App & Game logos, screenshots, store assets
│   ├── fonts/                      # Montserrat font family (Regular, Bold, Medium, etc.)
│   └── icons/                      # Social media, store, and platform icons
├── lib/
│   ├── configs/                    # Core UI configuration & themes
│   │   ├── app.dart                # App-level dimension calculations
│   │   ├── app_dimensions.dart     # Responsive margin, padding & font sizing
│   │   ├── app_theme.dart          # Dark & Light theme palette definition
│   │   ├── app_typography.dart     # Typography styles & text themes
│   │   ├── configs.dart            # Barrel file exporter for configurations
│   │   ├── core_theme.dart         # Material ThemeData construction
│   │   └── space.dart              # Spacing helper utilities
│   ├── model/                      # Data models
│   │   ├── experience_model.dart   # Work experience structure
│   │   ├── portfolio_model.dart    # Project showcase data structure
│   │   └── testimonial_model.dart  # Client reviews & endorsements
│   ├── provider/                   # State management
│   │   ├── app_provider.dart       # Theme state (Dark/Light mode)
│   │   └── scroll_provider.dart    # Section navigation & auto-scroll controller
│   ├── responsive/                 # Screen dimension breakpoints
│   │   └── responsive.dart         # Responsive helper (isMobile, isTablet, isDesktop)
│   ├── sections/                   # Modular UI Sections
│   │   ├── about/                  # About Me section (Desktop, Tablet, Mobile)
│   │   ├── contact/                # Contact section & interactive form
│   │   ├── experience/             # Career timeline & achievements
│   │   ├── footer/                 # Footer links & copyright
│   │   ├── home/                   # Hero section with animated typer
│   │   ├── main/                   # Main container scaffold, navbar & drawer
│   │   ├── portfolio/              # Filterable Projects Grid & dialogs
│   │   │   └── widgets/
│   │   │       └── modern_portfolio_card.dart # Project card & responsive dialog modal
│   │   ├── services/               # What I Offer services cards
│   │   └── testimonials/           # Endorsements carousel
│   ├── text/                       # Text constants & static copy
│   │   └── textfile.dart           # Technical skills, labels, addresses, bio copy
│   ├── utils/                      # Static utility data providers
│   │   ├── about_utils.dart        # About bio headlines & narratives
│   │   ├── experience_utils.dart   # Work experience milestones & achievements
│   │   ├── project_utils.dart      # Catalog of 60+ published Apps & Games
│   │   ├── services_utils.dart     # Offerings titles, descriptions & icons
│   │   └── utils.dart              # Static asset URI mappings
│   ├── widget/                     # Shared custom reusable widgets
│   │   ├── about_me_data.dart      # Quick info data row
│   │   ├── arrow_on_hover.dart     # Hover state interactive indicator
│   │   ├── custom_button.dart      # Standardized portfolio buttons
│   │   ├── custom_text_heading.dart# Section titles & subheadings
│   │   ├── entrance_fader.dart     # Smooth fade & slide animations
│   │   └── navbar_logo.dart        # Brand logo widget
│   ├── constants.dart              # Global constants, tools list, technical skills
│   └── main.dart                   # Application entry point & provider tree
├── web/
│   ├── app-ads.txt                 # AdMob publisher verification
│   ├── favicon.png                 # Web tab icon
│   ├── index.html                  # HTML5 shell & SEO meta configuration
│   ├── manifest.json               # Progressive Web App (PWA) manifest
│   └── flutter_bootstrap.js        # Flutter web engine bootstrapper
├── pubspec.yaml                    # Package dependencies & asset declarations
└── README.md                       # Project documentation & reference guide
```

---

## 🚀 Getting Started & Local Development

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`v3.38.x` or later recommended)
- [Dart SDK](https://dart.dev/get-dart) (`v3.x`)
- Google Chrome browser (for Flutter Web debugging)
- Git

### 1. Clone the Repository
```bash
git clone https://github.com/DipakSolanki548/dipak_new_latest_portfolio.git
cd dipak_new_latest_portfolio
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run Locally (Web)
```bash
flutter run -d chrome
```

### 4. Run Code Analysis
```bash
flutter analyze
```

---

## 📦 Building for Production

### Production Web Build (GitHub Pages / Subpath Hosting)
To build the application for deployment to GitHub Pages under a subpath (e.g. `/dipak_new_latest_portfolio/`):
```bash
flutter build web --release --base-href "/dipak_new_latest_portfolio/"
```

### Production Web Build (Root Hosting / Custom Domain)
If deploying to the root of a domain (e.g. `https://dipaksolanki.com/`):
```bash
flutter build web --release --base-href "/"
```

---

## 🚢 Deployment Architecture

This portfolio uses a dual-branch GitHub deployment model:
1. **`main` Branch:** Holds the complete Flutter source code, assets, and project configurations.
2. **`gh-pages` Branch:** Hosts the compiled production web bundle (`build/web`), automatically served by GitHub Pages at [https://dipaksolanki548.github.io/dipak_new_latest_portfolio/](https://dipaksolanki548.github.io/dipak_new_latest_portfolio/).

---

## 📬 Contact & Connect

- **LinkedIn:** [linkedin.com/in/dipak-solanki-1076b1178](https://www.linkedin.com/in/dipak-solanki-1076b1178/)
- **GitHub:** [github.com/DipakSolanki548](https://github.com/DipakSolanki548)
- **Google Play:** [Play Store Developer Profile](https://play.google.com/store/apps/developer?id=Dipak+Solanki)
- **Email:** [dipaksolanki548@gmail.com](mailto:dipaksolanki548@gmail.com)
- **WhatsApp / Phone:** [+91 9913343548](https://wa.me/919913343548)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
Feel free to fork, customize, and build your own developer portfolio!

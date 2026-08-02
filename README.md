# 24Ryde Driver App

**An open-source Flutter driver application for the 24Ryde ride-hailing platform**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)](https://dart.dev)
[![Android](https://img.shields.io/badge/Android-Supported-success)](#)
[![iOS](https://img.shields.io/badge/iOS-Supported-success)](#)
[![State Management](https://img.shields.io/badge/State%20Management-GetX-purple)](#)
[![License](https://img.shields.io/badge/License-Apache%202.0-red)](LICENSE)
[![Contributions Welcome](https://img.shields.io/badge/Contributions-Welcome-brightgreen)](CONTRIBUTING.md)

[Star this repo](https://github.com/Code-Making/24Ryde-Driver-App) &nbsp;·&nbsp;
[Fork](https://github.com/Code-Making/24Ryde-Driver-App/fork) &nbsp;·&nbsp;
[Report a Bug](https://github.com/Code-Making/24Ryde-Driver-App/issues) &nbsp;·&nbsp;
[Request a Feature](https://github.com/Code-Making/24Ryde-Driver-App/issues)

---

## Overview

24Ryde Driver App is the driver-facing component of the **24Ryde** ride-hailing platform, built with Flutter for cross-platform delivery on Android and iOS. It pairs with the companion [24Ryde User App](#related-projects) to form a complete, self-hostable ride-hailing ecosystem.

The project is intended for:

- Flutter developers building production-grade mobile apps
- Students and learners studying real-world app architecture
- Startups and companies evaluating a ride-hailing foundation
- Open-source contributors

## Vision

Our goal is to build the largest open-source ride-hailing platform available — a production-ready ecosystem that any developer or company can adopt, customize, and deploy, rather than building the same application from scratch.

---

## Features

**Authentication**
- Driver registration
- Secure login with OTP verification
- Password recovery

**Driver Dashboard**
- Online / offline availability toggle
- Ride statistics and daily earnings summary
- In-app notifications

**Ride Management**
- Accept, reject, start, complete, and cancel rides
- Full ride history

**Navigation**
- Google Maps integration
- Live driver location tracking
- Turn-by-turn pickup and destination navigation

**Driver Profile**
- Personal and vehicle information
- Document management
- Account settings

**Wallet**
- Earnings overview
- Transaction history
- Withdrawal requests

---

## Architecture

The application follows a modular Flutter architecture built on **GetX**, comprising:

- Modular feature organization
- GetX state management and routing
- Dependency injection via bindings
- Repository layer for data access
- REST API integration

The architecture will continue to evolve toward a more strictly feature-driven structure as the project and community grow.

### Project Structure

```text
lib/
├── app/
│   ├── core/
│   ├── modules/
│   └── routes/
├── features/
├── infrastructure/
├── presentation/
├── ui/
│   ├── pages/
│   └── rider/
├── utils/
└── main.dart
```

---

## Tech Stack

| Technology         | Purpose                        |
|---------------------|---------------------------------|
| Flutter             | Cross-platform app development |
| Dart                | Programming language           |
| GetX                | State management & routing     |
| Firebase            | Authentication & notifications |
| Google Maps         | Navigation & live tracking     |
| REST APIs           | Backend communication          |
| Shared Preferences  | Local storage                  |
| Dio                 | Networking                     |

---

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Xcode (macOS only, for iOS builds)

Verify your environment:

```bash
flutter doctor
```

### Installation

```bash
git clone https://github.com/Code-Making/24Ryde-Driver-App.git
cd 24Ryde-Driver-App
flutter pub get
flutter run
```

### Building for Release

```bash
# Android APK
flutter build apk

# Android App Bundle
flutter build appbundle

# iOS
flutter build ios
```

---

## Code Quality

```bash
# Static analysis
flutter analyze

# Run tests
flutter test

# Format code
dart format .
```

---

## Contributing

Contributions are welcome from developers of all experience levels. Ways to get involved include:

- Fixing bugs
- Improving UI/UX
- Optimizing performance
- Writing or improving documentation
- Adding new features
- Improving architecture
- Writing tests

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting a pull request.

---

## Roadmap

**Version 1** ✅
- Authentication
- Driver dashboard
- Google Maps integration
- Ride management

**Version 2**
- Driver wallet
- Driver ratings
- Referral system
- SOS / emergency assistance

**Version 3**
- AI driver assistant
- Offline support
- Fleet management
- Analytics dashboard

---

## Contributors

Thanks to everyone who has contributed to making 24Ryde better.

<a href="https://github.com/Code-Making/24Ryde-Driver-App/graphs/contributors"> <img src="https://contrib.rocks/image?repo=Code-Making/24Ryde-Driver-App"/> </a>
---

## Related Projects

| Repository            | Status  |
|-------------------------|---------|
| 24Ryde User App         | Public  |
| 24Ryde Driver App       | Public  |
| Admin Dashboard         | Planned |
| Backend APIs            | Planned |
| Website                 | Planned |

---

## Maintainer

**Uttam Singh** — Flutter Engineer, Open Source Contributor

- Portfolio: [uttam-singh.netlify.app](https://uttam-singh.netlify.app/)
- GitHub: [@Code-Making](https://github.com/Code-Making)
- LinkedIn: [uttamsingh](https://www.linkedin.com/in/uttamsingh)

---

## License

Copyright © 2026 Uttam Singh.

Licensed under the [Apache License 2.0](LICENSE).

---

<div align="center">

**Help build the largest open-source Flutter ride-hailing platform.**

</div>

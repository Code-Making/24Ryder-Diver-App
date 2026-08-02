# 🤝 Contributing to 24Ryde

First of all, thank you for your interest in contributing to **24Ryde**! ❤️

24Ryde is an open-source ride-hailing platform built to empower developers, startups, students, and businesses around the world. Every contribution, whether it's fixing a bug, improving documentation, or adding a new feature, helps make the project better.

We welcome contributors of all experience levels.

---

# 📌 Before You Start

Before contributing, please:

- ⭐ Star this repository
- 🍴 Fork this repository
- 📖 Read the README.md
- 🔍 Check existing Issues and Pull Requests
- 💬 Discuss major changes by opening an Issue first

---

# 🚀 Getting Started

## 1. Fork the Repository

Click the **Fork** button in the top-right corner of this repository.

---

## 2. Clone Your Fork

```bash
git clone https://github.com/<your-github-username>/24Ryde-Driver-App.git
```

Example:

```bash
git clone https://github.com/johndoe/24Ryde-Driver-App.git
```

---

## 3. Navigate to the Project

```bash
cd 24Ryde-Driver-App
```

---

## 4. Install Dependencies

```bash
flutter pub get
```

---

## 5. Create a New Branch

Always create a new branch before making changes.

```bash
git checkout -b feature/amazing-feature
```

Examples

```bash
git checkout -b bugfix/login-crash
```

```bash
git checkout -b feature/google-pay
```

```bash
git checkout -b improvement/refactor-auth
```

---

# 💻 Development Guidelines

Please follow these guidelines while writing code.

## Flutter

- Follow Flutter's official style guide
- Use null safety
- Keep widgets reusable
- Avoid duplicate code
- Write readable code
- Use meaningful variable names

Good

```dart
final driverLocation = Position(...);
```

Bad

```dart
final a = Position(...);
```

---

## Architecture

Please follow the project's architecture.

- Clean Architecture
- MVVM
- Repository Pattern
- SOLID Principles

Do not place business logic inside Widgets.

---

## State Management

Use the project's existing state management solution.

Do not introduce another state management library without discussion.

---

## Folder Structure

Keep new files inside the correct feature folder.

Example

```
lib/

core/

features/

widgets/

services/

repositories/

models/

utils/
```

---

# 🧪 Testing

Before opening a Pull Request, ensure:

```bash
flutter analyze
```

passes successfully.

Run

```bash
flutter test
```

If you added a new feature, please include tests where practical.

---

# ✅ Commit Message Guidelines

Write meaningful commit messages.

Good

```text
feat(auth): add Google Sign-In
```

```text
fix(location): resolve GPS permission issue
```

```text
docs: update installation guide
```

```text
refactor(profile): simplify user repository
```

Bad

```text
update
```

```text
changes
```

```text
fixed
```

---

# 🔀 Pull Request Process

1. Sync your fork with the latest changes.
2. Create a feature branch.
3. Commit your work.
4. Push your branch.
5. Open a Pull Request.

Example

```bash
git add .

git commit -m "feat(wallet): add wallet history"

git push origin feature/wallet-history
```

---

# 📋 Pull Request Checklist

Before submitting your Pull Request, ensure:

- [ ] Code builds successfully
- [ ] flutter analyze passes
- [ ] flutter test passes (if applicable)
- [ ] No unnecessary files are included
- [ ] Documentation updated (if needed)
- [ ] Screenshots added (for UI changes)

---

# 🐛 Reporting Bugs

Before creating a bug report:

- Search existing Issues.
- Make sure the bug hasn't already been reported.

Include:

- Flutter Version
- Device
- Android/iOS Version
- Logs
- Screenshots
- Steps to Reproduce

---

# 💡 Suggesting Features

Feature requests are always welcome.

Please include:

- Problem Statement
- Proposed Solution
- Benefits
- Mockups (if available)

---

# 📚 Documentation Contributions

Documentation improvements are greatly appreciated.

Examples:

- Fix grammar
- Improve README
- Add examples
- Improve setup guides
- API documentation

---

# 🏷 Good First Issues

If you're new to open source, look for Issues labeled:

- good first issue
- help wanted
- documentation
- beginner friendly

These are a great place to start.

---

# 💬 Community

Be respectful and constructive.

Please read our CODE_OF_CONDUCT.md before participating.

---

# 🏆 Recognition

Every contributor will be listed in the project's CONTRIBUTORS.md file.

Thank you for helping improve 24Ryde!

---

# 📜 License

By contributing to this project, you agree that your contributions will be licensed under the Apache License 2.0.

---

# ❤️ Thank You

Open source grows because of amazing people like you.

Whether you fix one typo or build an entire feature, your contribution matters.

Happy Coding! 🚀

**— Uttam Singh**
Founder & Maintainer, 24Ryde
GitHub: https://github.com/Code-Making

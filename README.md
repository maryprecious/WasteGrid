# Waste Grid

Waste Grid is a Flutter mobile app prototype intended to gamify recycling and waste collection. It provides an `earn` ecosystem with challenges, redeemable rewards, and a leaderboard. The architecture is controller-driven with organized `models`, `controller`, and `pages` folders.

## Project Features

- Onboarding and authentication flows
- Home dashboard with resource cards and quick actions
- Community feed and challenges
- Scan-based waste submission (camera + barcode)
- Reward points and leaderboard system
- Wallet/redeem flows (Airtime, Data, Supermarket, Kiosk)
- Profile settings with location/notifications/security

## Dependency Setup

1. Ensure Flutter SDK is installed (>=3.8.0 as required).
2. Clone repository:
   ```bash
   git clone <repo-url>
   cd waste_grid
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Generate JSON-model code (for `json_serializable`):
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

## Run App

- Android:
  ```bash
  flutter run -d android
  ```
- iOS:
  ```bash
  flutter run -d ios
  ```
- Web:
  ```bash
  flutter run -d chrome
  ```

## Folder Structure

- `lib/main.dart`: App entry and route registration
- `lib/controller/*`: Business controllers (GetX compatible pattern)
- `lib/models/*`: Local data models, e.g., `CommunityImage`, `Challenge`
- `lib/pages/*`: UI screens and nested page folders
- `lib/theme`: Colors, typography, and global style
- `lib/utils`: Reusable helper functions
- `lib/widget`: Shared widget components (buttons, cards, etc.)

## App Screens (not exhaustive)

- `lib/pages/home/home_screen.dart`
- `lib/pages/recycle/recycle_screen.dart`
- `lib/pages/earning/earning_screen.dart`
- `lib/pages/community/community_screen.dart`
- `lib/pages/scan/scan_screen.dart`
- `lib/pages/profile/*`

## Testing

- Widget tests can be added under the `test` folder (currently one template test included).
- Run tests:
  ```bash
  flutter test
  ```

## Notes

- No AI-powered code generation hints are included in the app logic.
- Follow the PR/issue workflow configured for your team.
- Update networking and backend API endpoints before production.

## Troubleshooting

- If you see Dart version mismatch, set SDK to compatible version in `pubspec.yaml`:
  ```yaml
  environment:
    sdk: ">=3.8.0 <4.0.0"
  ```
- If `build_runner` fails due to conflicting outputs, run:
  ```bash
  flutter pub run build_runner clean
  flutter pub run build_runner build --delete-conflicting-outputs
  ```

---

This README is “non-AI” and manually written for project maintainability and onboarding.

# Voyage — Flutter Mobile App

## Project Identity

- **App:** Voyage (package: `voyga`), graduation project — MUST, May 2026
- **Backend:** Java Spring Boot 3 + MySQL 8 (not yet connected; no API calls until explicitly asked)
- **Design:** Glassmorphism "Ethereal Traveler" — frosted cards, blur overlays, `BackdropFilter`
- **Primary color:** `#4F6EF7` — `AppColors.primaryBlue` / `AppTheme.primaryBlue`
- **Font:** Cairo (supports Arabic + English) — not yet applied, currently default Material

## Current Codebase State

Feature-based architecture (refactored May 2026). ~100 files organized by feature. Auth screens restored to original design with Form+validators and social login buttons.

| Known Trap | Details |
|---|---|
| Stale test | `test/widget_test.dart` references a counter widget that doesn't exist — `flutter test` will fail |
| Orphaned plugin | `path_provider` in `.flutter-plugins` but **not** in `pubspec.yaml` — do not import |
| Placeholder screens | `ExploreView` previously `body: null` — now shows destination grid |
| `withOpacity` deprecated | Restored `custom_button.dart` and `custom_text_field.dart` use `.withOpacity()` — triggers info-level lint messages but intentional |

## Architecture

| Trait | Detail |
|---|---|
| Structure | Feature-based `lib/features/{auth,home,explore,wishlist,bookings,profile}/` + `lib/core/` + `lib/shared/` |
| State management | None — all `setState` |
| Models | Typed classes: `Destination`, `ExploreDestination`, `WishlistItem` (sealed), `DealItem`, `UserModel` (in `lib/shared/models/`) |
| Theming | `lib/core/constants/app_theme.dart` + `lib/core/constants/constants.dart` |
| Routing | Imperative `Navigator.push/pop` — no named routes, no GoRouter |
| Navigation flow | `SplashScreen` → `SigninScreen` → `RootShell` (if signed in) |
| Root shell | `PageView` (5 screens) + glass bottom nav bar with 4 visible items in `lib/shared/views/root_shell.dart` |
| Auth | Hardcoded `isLoggedIn = false` — no real auth or token persistence |

## Folder Structure

```
lib/
  core/
    constants/       # app_theme.dart, constants.dart
    network/         # (future — API clients)
  features/
    auth/            # views/signin_screen, signup_screen
    home/            # views/home_screen + widgets/ (10 sub-widgets)
    explore/         # views/explore_view, detail screens + widgets/
    wishlist/        # views/wishlist_screen + widgets/ (7 sub-widgets)
    bookings/        # views/booking_screen, secret_deals, success + widgets/ (30+ sub-widgets)
    profile/         # views/profile_screen + widgets/ (6 sub-widgets)
  shared/
    models/          # All data models (Destination, WishlistItem, etc.)
    data/            # Mock data (mock_data.dart stub)
    widgets/         # Reusable shared widgets (custom_button, custom_text_field)
    views/           # splash_screen, root_shell
```

## Rules

- **One widget class per file** — no two widget classes in the same file
- **All imports use `package:voyga/...`** — no relative imports
- **UI-first:** Build screens before wiring state management or APIs
- **No state management libraries** (Provider/Riverpod/Bloc) unless explicitly asked
- **No Firebase** — auth/data come from the Spring Boot REST API eventually
- **No packages added without asking first**
- **Comments in English** (current codebase has mixed Arabic/English — clean up as you touch files)
- Use `const` constructors wherever possible, include `super.key`
- Screen pattern: `Scaffold(backgroundColor: Colors.transparent)` → body `Container` with `AppTheme.backgroundGradient`
- Card pattern: white, `borderRadius: 20` or `24`, `AppTheme.cardShadow`
- Background gradient: light lavender → grey → white (`AppGradients.background`)

## Commands

```sh
flutter run                 # Launch on device/emulator
flutter analyze             # Lint + static analysis
flutter test                # Currently fails — update test first
flutter build apk           # Android release
flutter build ios           # iOS release
```

## Do's and Don'ts

**Do:**
- Keep widgets small and reusable — use `lib/shared/widgets/` for shared widgets
- Use glassmorphism effects: `BackdropFilter`, low-opacity colors, blur

**Don't:**
- Don't connect to the backend unless explicitly asked
- Don't add state management or packages without asking
- Don't use `Colors.blue` — use `#4F6EF7` (AppTheme.primaryBlue)
- Don't use relative imports (`../../`) — always use `package:voyga/...`

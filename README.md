# movdb

### Table of contents

- [System requirements](#system-requirements)
- [Figma design guidelines for better UI accuracy](#figma-design-guideline-for-better-accuracy)
- [Check the UI of the entire app](#app-navigations)
- [Application structure](#project-structure)
- [Libraries and tools used](#libraries-and-tools-used)
- [Support](#support)

### System requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.7.0 or greater.

### Figma design guidelines for better UI accuracy

Read our guidelines to increase the accuracy of design-to-code conversion by optimizing Figma designs.
https://docs.dhiwise.com/docs/Designguidelines/intro

### Check the UI of the entire app

Check the UI of all the app screens from a single place by setting up the 'initialRoute'  to AppNavigation in the AppRoutes.dart file.

### Application structure

```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains all constants classes
    │   ├── errors                  - It contains error handling classes
    │   ├── network                 - It contains network-related classes
    │   └── utils                   - It contains common files and utilities of the application
    ├── data
    │   ├── apiClient               - It contains API calling methods
    │   ├── models                  - It contains request/response models
    │   └── repository              - Network repository
    ├── localization                - It contains localization classes
    ├── presentation                - It contains widgets of the screens with their controllers and the models of the whole application.
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```

### Libraries and tools used

- get - State management
  https://pub.dev/packages/get
- connectivity_plus - For status of network connectivity
  https://pub.dev/packages/connectivity_plus
- shared_preferences - Provide persistent storage for simple data
  https://pub.dev/packages/shared_preferences
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image
- sentry_flutter - for error logging
  https://pub.dev/packages/sentry_flutter
- flutter_dotenv - for storing environment-specific variables
  https://pub.dev/packages/flutter_dotenv
- intl - for internalization and localization facilities
  https://pub.dev/packages/intl
- percent_indicator - Library that allows you to display progress widgets based on percentage
  https://pub.dev/packages/percent_indicator
- animated_bottom_navigation_bar - Bottom navigation bar
  https://pub.dev/packages/animated_bottom_navigation_bar
- card_swiper - swiper/carousel for flutter, with multiple layouts, infinite loop
  https://pub.dev/packages?q=card_swiper
- youtube_player_flutter - for playing or streaming youtube videos
  https://pub.dev/packages/youtube_player_flutter
- infinite_scroll_pagination - Lazily load and display pages of items as the user scrolls down your screen.
  https://pub.dev/packages/infinite_scroll_pagination
- device_info_plus - Get current device information
  https://pub.dev/packages/device_info_plus

### Support

If you have any problems or questions, go to our Discord channel, where we will help you as quickly as possible: https://discord.com/invite/rFMnCG5MZ7

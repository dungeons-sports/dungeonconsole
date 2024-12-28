import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

enum Device { mobile, tablet, desktop }

class PaddingRatioHelper {
  // Determines display padding based on the screen width and returns const EdgeInsetsGeometry
  static EdgeInsetsGeometry getDisplayPadding(Size size) {
    if (size.width > 1024) {
      return const EdgeInsets.all(72.0); // Large screen (e.g., desktop)
    }

    if (size.width > 768) {
      return const EdgeInsets.symmetric(
          horizontal: 48.0, vertical: 24.0); // Medium screen (e.g., tablets)
    }

    return const EdgeInsets.symmetric(
        horizontal: 16.0, vertical: 16.0); // Small screen (e.g., phones)
  }

  // Returns button padding based on screen width for responsiveness
  static EdgeInsetsGeometry getButtonPadding(Size size) {
    if (size.width > 1024) {
      return const EdgeInsets.symmetric(
          horizontal: 24.0, vertical: 16.0); // Large screen
    }

    if (size.width > 768) {
      return const EdgeInsets.symmetric(
          horizontal: 20.0, vertical: 12.0); // Medium screen
    }

    return const EdgeInsets.symmetric(
        horizontal: 16.0, vertical: 8.0); // Small screen
  }

  // Optionally, you can create more methods to handle other types of padding, such as for text or containers.
  static double getTextPadding(Size size) {
    if (size.width > 1024) {
      return 24.0; // Larger text padding for large screens
    }

    if (size.width > 768) {
      return 16.0; // Moderate text padding for medium screens
    }

    return 8.0; // Minimal text padding for small screens
  }
}

class BreakpointHelper {
  static Device device(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return Device.desktop;
    }

    if (ResponsiveBreakpoints.of(context).isTablet) {
      return Device.tablet;
    }

    if (ResponsiveBreakpoints.of(context).isPhone) {
      return Device.mobile;
    }

    return Device.desktop;
  }
}

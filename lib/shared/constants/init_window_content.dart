import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitWindowContent extends StatelessWidget {
  const InitWindowContent({super.key});

  @override
  Widget build(BuildContext context) {
    const double titleSize = 20.0;
    const double subtitleSize = 18.0;
    const double bodySize = 16.0;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Good day, 👋\n\n',
                  style: GoogleFonts.roboto(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      'Welcome to the app! Below are some of the key features and functionalities that make this app stand out:\n\n',
                  style: GoogleFonts.roboto(
                    fontSize: bodySize,
                  ),
                ),
                TextSpan(
                  text: 'App Features: 📲\n',
                  style: GoogleFonts.roboto(
                    fontSize: subtitleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      '• Real macOS-like design with smooth animations and transitions 💻\n'
                      '• Responsive dock that allows dragging and moving icons around with smooth animation 🎮\n'
                      '• Dock customization: You can drag icons left or right, with smooth animations when moving from slot to slot ⬅️➡️\n'
                      '• When releasing a dragged icon, it will smoothly settle into the correct slot 🎯\n'
                      '• App window interactions: Click on any app icon in the dock to open its respective window, just like in macOS 🪟\n'
                      '• Settings button: Access the settings for the web app through the settings icon ⚙️\n'
                      '• GetX integration for efficient state management 🔧, ensuring smooth data flow and fast updates\n'
                      '• The app offers a modern, fluid experience with features similar to macOS, including draggable, sortable dock icons 🛠️\n'
                      '• Multiple dock positions: The dock can be positioned at the bottom, left, or right of the screen for flexibility ⬇️⬅️➡️\n'
                      '• Magnification effect: Icons in the dock will slightly magnify when hovered over, just like macOS 🌟\n'
                      '• Light and dark theme support: The app seamlessly switches between light and dark modes to match your preferences 🌗\n'
                      '• App window minimization: The ability to minimize windows and have them appear in the dock for easy access 🛋️\n'
                      '• Sleek, minimalistic interface: The app has a polished and streamlined design that focuses on functionality and user experience ✨\n'
                      '• Animated icon rearrangement: When icons are moved, they rearrange with smooth animations, adding fluidity to the UI 🔄\n'
                      '• Cloud sync support: The app syncs settings and dock configuration across devices for a consistent experience across platforms ☁️\n'
                      '• User authentication: Secure user login for accessing personalized settings and preferences 🔑\n\n',
                  style: GoogleFonts.roboto(
                    fontSize: bodySize,
                    height: 1.5, // Added line height for better readability
                  ),
                ),
                TextSpan(
                  text:
                      'We hope you enjoy the experience and look forward to your feedback and usage of this app! 💬\n\n',
                  style: GoogleFonts.roboto(
                    fontSize: bodySize,
                  ),
                ),
                TextSpan(
                  text:
                      'Click on the settings icon in the top-right corner to access the settings. ⚙️\n\n',
                  style: GoogleFonts.roboto(
                    fontSize: bodySize,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitWindowContent extends StatelessWidget {
  const InitWindowContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SingleChildScrollView(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Good day, 👋\n\n',
                  style: GoogleFonts.roboto(
                    fontSize: 20, // fixed font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      'Welcome to the app! Below are some of the key features and functionalities that make this app stand out:\n\n',
                  style: GoogleFonts.roboto(
                    fontSize: 16, // fixed font size
                  ),
                ),
                TextSpan(
                  text: 'App Features: 📲\n',
                  style: GoogleFonts.roboto(
                    fontSize: 18, // fixed font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      '• Real macOS-like design with smooth animations and transitions 💻;\n'
                      '• Responsive dock that allows dragging and moving icons around with smooth animation 🎮;\n'
                      '• Click on any app icon in the top-right corner to open its respective window, just like in macOS 🪟;\n'
                      '• A settings button to access the settings for the web app ⚙️;\n'
                      '• Integration with GetX for efficient state management 🔧;\n'
                      '• The app offers a modern, fluid experience with features similar to macOS, including draggable, sortable dock icons 🛠️;\n'
                      '• The ability to drag icons left or right, with smooth animations when moving from slot to slot ⬅️➡️;\n'
                      '• When releasing a dragged icon, it will smoothly settle into the correct slot 🎯;\n'
                      '• The app has a sleek, minimalistic interface that adapts perfectly to both light and dark themes 🌗;\n\n',
                  style: GoogleFonts.roboto(
                    fontSize: 16, // fixed font size
                  ),
                ),
                TextSpan(
                  text:
                      'We hope you enjoy the experience and look forward to your feedback and usage of this app! 💬\n\n',
                  style: GoogleFonts.roboto(
                    fontSize: 16, // fixed font size
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

import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/shared/constants/app_credits.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  // Helper function to open URLs
  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Developer Name tile
          _buildInfoTile(
            context,
            icon: Icons.person,
            label: 'Developer',
            content: AppCredits.developerName,
          ),
          const SizedBox(height: 8),

          // Email tile
          _buildInfoTile(
            context,
            icon: Icons.email,
            label: 'Email',
            content: AppCredits.developerEmail,
            isLink: true,
            url: 'mailto:${AppCredits.developerEmail}',
          ),
          const SizedBox(height: 8),

          // LinkedIn tile
          _buildInfoTile(
            context,
            icon: Icons.business_center,
            label: 'LinkedIn',
            content: AppCredits.linkedinURL.replaceAll('https://', ''),
            isLink: true,
            url: AppCredits.linkedinURL,
          ),
          const SizedBox(height: 8),

          // GitHub Repository tile
          _buildInfoTile(
            context,
            icon: Icons.code,
            label: 'GitHub Repository',
            content: AppCredits.githubRepoURL.replaceAll('https://', ''),
            isLink: true,
            url: AppCredits.githubRepoURL,
          ),
          const SizedBox(height: 8),

          // Deployment Repository tile
          _buildInfoTile(
            context,
            icon: Icons.cloud_upload,
            label: 'Deployment Repository',
            content: AppCredits.deploymentRepoURL.replaceAll('https://', ''),
            isLink: true,
            url: AppCredits.deploymentRepoURL,
          ),
          const SizedBox(height: 8),

          // GitHub Pages Link tile
          _buildInfoTile(
            context,
            icon: Icons.web,
            label: 'GitHub Pages',
            content: AppCredits.githubPagesURL.replaceAll('https://', ''),
            isLink: true,
            url: AppCredits.githubPagesURL,
          ),
        ],
      ),
    );
  }

  // Widget to build each tile
  Widget _buildInfoTile(BuildContext context,
      {required IconData icon,
      required String label,
      required String content,
      bool isLink = false,
      String? url}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: isLink && url != null
                  ? () {
                      _launchURL(url);
                    }
                  : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    content,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: isLink ? Colors.blue : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

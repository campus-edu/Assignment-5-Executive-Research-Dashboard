import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class DocDownloadButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String path;
  final bool isPrimary;

  const DocDownloadButton({
    super.key,
    required this.label,
    required this.icon,
    required this.path,
    this.isPrimary = false,
  });

  Future<void> _handleDownload() async {
    final uri = Uri.parse(path);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _handleDownload,
      icon: Icon(icon, size: 16, color: isPrimary ? Colors.white : AppTheme.textPrimary),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: isPrimary ? Colors.white : AppTheme.textPrimary,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? AppTheme.primary : AppTheme.bgElevated,
        foregroundColor: AppTheme.textPrimary,
        side: const BorderSide(color: AppTheme.border),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
    );
  }
}

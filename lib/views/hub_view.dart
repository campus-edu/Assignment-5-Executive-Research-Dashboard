import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/doc_download_button.dart';

class HubView extends StatelessWidget {
  final VoidCallback onOpenAssignment4;
  final VoidCallback onOpenAssignment5;

  const HubView({
    super.key,
    required this.onOpenAssignment4,
    required this.onOpenAssignment5,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1140),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeroSection(),
                    const SizedBox(height: 32),
                    _buildPortalsGrid(context),
                    const SizedBox(height: 32),
                    _buildDownloadsCard(),
                    const SizedBox(height: 48),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        color: AppTheme.bgSurface,
        border: Border(bottom: BorderSide(color: AppTheme.border)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.primary, AppTheme.accentPurple],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'QB',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Colors.white,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const SizedBox(width: 14),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'QuickBite Technologies // Executive Strategy Portals',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: AppTheme.textPrimary,
                ),
              ),
              Text(
                'AI.135 Document & Linguistic Analysis • Master Executive Hub',
                style: TextStyle(fontSize: 12, color: AppTheme.textSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.bgSurface,
            AppTheme.bgElevated.withOpacity(0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.border),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DUAL EXECUTIVE ARCHITECTURE',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: AppTheme.primaryLight,
              letterSpacing: 1.4,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'QuickBite C-Suite Strategy & Regulatory Portals',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppTheme.textPrimary,
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Synthesizing empirical research across Assignments 1 through 5. Launch the dedicated Assignment 4 Regulatory Deck or the multi-assignment Assignment 5 Executive Research Dashboard below.',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortalsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 780;
        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildPortalCard(
                  badge: 'ASSIGNMENT #4',
                  badgeColor: AppTheme.success,
                  role: 'Head of Legal & Compliance',
                  title: 'Regulatory Impact Analysis Dashboard',
                  description:
                      'Dedicated deliverable for Assignment 4. Features a 16:9 fullscreen presentation deck with timed boardroom speaker notes, interactive 3-state comparison matrix, dynamic statutory weight sliders, and the Texas HB 2127 preemption tracker.',
                  tags: [
                    'Slides 1–4',
                    'Dynamic Scoring (TX 9.4)',
                    'Speaker Notes Drawer',
                    'Primary .gov Dossiers',
                  ],
                  buttonLabel: 'Launch Assignment 4 Dashboard →',
                  buttonColor: AppTheme.success,
                  onTap: onOpenAssignment4,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildPortalCard(
                  badge: 'ASSIGNMENT #5',
                  badgeColor: AppTheme.primary,
                  role: 'Chief Strategy Officer',
                  title: 'Executive Research Dashboard',
                  description:
                      'Comprehensive multi-assignment synthesis portal. Integrates Tri-Model AI Strategy (HW1), Market Opportunity Meter with live Sensitivity Simulator & SEC 10-K benchmarks (HW3), Expansion Readiness (HW4), and 18-Month Capital Roadmap (HW5).',
                  tags: [
                    '4 Strategic Panels',
                    'Live Sensitivity Engine',
                    'SEC Form 10-K Audits',
                    '18-Month Capital Roadmap',
                  ],
                  buttonLabel: 'Launch Assignment 5 Dashboard →',
                  buttonColor: AppTheme.primary,
                  onTap: onOpenAssignment5,
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              _buildPortalCard(
                badge: 'ASSIGNMENT #4',
                badgeColor: AppTheme.success,
                role: 'Head of Legal & Compliance',
                title: 'Regulatory Impact Analysis Dashboard',
                description:
                    'Dedicated deliverable for Assignment 4. Features a 16:9 fullscreen presentation deck with timed boardroom speaker notes, interactive 3-state comparison matrix, dynamic statutory weight sliders, and the Texas HB 2127 preemption tracker.',
                tags: [
                  'Slides 1–4',
                  'Dynamic Scoring (TX 9.4)',
                  'Speaker Notes Drawer',
                  'Primary .gov Dossiers',
                ],
                buttonLabel: 'Launch Assignment 4 Dashboard →',
                buttonColor: AppTheme.success,
                onTap: onOpenAssignment4,
              ),
              const SizedBox(height: 24),
              _buildPortalCard(
                badge: 'ASSIGNMENT #5',
                badgeColor: AppTheme.primary,
                role: 'Chief Strategy Officer',
                title: 'Executive Research Dashboard',
                description:
                    'Comprehensive multi-assignment synthesis portal. Integrates Tri-Model AI Strategy (HW1), Market Opportunity Meter with live Sensitivity Simulator & SEC 10-K benchmarks (HW3), Expansion Readiness (HW4), and 18-Month Capital Roadmap (HW5).',
                tags: [
                  '4 Strategic Panels',
                  'Live Sensitivity Engine',
                  'SEC Form 10-K Audits',
                  '18-Month Capital Roadmap',
                ],
                buttonLabel: 'Launch Assignment 5 Dashboard →',
                buttonColor: AppTheme.primary,
                onTap: onOpenAssignment5,
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildPortalCard({
    required String badge,
    required Color badgeColor,
    required String role,
    required String title,
    required String description,
    required List<String> tags,
    required String buttonLabel,
    required Color buttonColor,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: badgeColor,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              Text(
                role,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppTheme.textPrimary,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags
                .map(
                  (t) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.bgElevated,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppTheme.border),
                    ),
                    child: Text(
                      t,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppTheme.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: Text(
                buttonLabel,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppTheme.bgSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.border),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Primary Course Deliverable Downloads',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppTheme.textPrimary,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Access the official submitted PDF memos, Word user guides, and PowerPoint boardroom slide decks.',
            style: TextStyle(fontSize: 13, color: AppTheme.textSecondary),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 10,
            children: [
              DocDownloadButton(
                label: 'Assignment 4 PDF Memo',
                icon: Icons.picture_as_pdf,
                path:
                    'documents/Complete_Assignment_4_Regulatory_Impact_Analysis.pdf',
              ),
              DocDownloadButton(
                label: 'Assignment 4 PPTX Deck',
                icon: Icons.slideshow,
                path: 'documents/AI.135_Assignment4_Jason_Orozco_Zarco.pptx',
              ),
              DocDownloadButton(
                label: 'Assignment 5 User Guide (PDF)',
                icon: Icons.picture_as_pdf,
                path:
                    'documents/Complete_Assignment_5_Executive_Dashboard_User_Guide.pdf',
              ),
              DocDownloadButton(
                label: 'Assignment 5 User Guide (DOCX)',
                icon: Icons.description,
                path:
                    'documents/Complete_Assignment_5_Executive_Dashboard_User_Guide.docx',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'QuickBite Technologies, Inc. • Executive Portals Hub',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppTheme.textSecondary,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Jason Orozco Zarco • Helene Chen (CEO) • José Rodriguez (CFO)',
              style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: AppTheme.success.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppTheme.success.withOpacity(0.3)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.verified, size: 14, color: AppTheme.success),
              SizedBox(width: 6),
              Text(
                'AI135 Anti-AI Detection Certified (CV ≥ 0.60)',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.successLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

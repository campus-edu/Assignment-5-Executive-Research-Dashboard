import 'package:flutter/material.dart';
import '../models/regulatory_model.dart';
import '../theme/app_theme.dart';
import '../widgets/doc_download_button.dart';

class Assignment4View extends StatefulWidget {
  final VoidCallback onBackToHub;

  const Assignment4View({super.key, required this.onBackToHub});

  @override
  State<Assignment4View> createState() => _Assignment4ViewState();
}

class _Assignment4ViewState extends State<Assignment4View> {
  int _currentTab = 0;
  int _currentSlide = 1;
  bool _speakerNotesOpen = false;

  final RegulatoryWeights _weights = RegulatoryWeights();

  final List<Map<String, String>> _speakerNotes = [
    {
      'title': 'Slide 1: Boardroom Speaking Script',
      'body':
          'Helene and José, Slide 1 delivers our forensic legal comparison across Texas, Colorado, and California. Texas scores 9.4 out of 10, standing as a true statutory sanctuary. In Texas, Labor Code § 201.041 preserves independent contractor flexibility without mandatory health stipends. Furthermore, Texas has zero state delivery fee caps and actively preempts municipal interference under HB 2127. In sharp contrast, California scores 4.2: Prop 22 wage guarantees and San Francisco’s 15% commission cap severely impair unit margins.',
    },
    {
      'title': 'Slide 2: Boardroom Speaking Script',
      'body':
          'Moving to Slide 2, our formal recommendation is an immediate \$800,000 deployment into the Dallas-Fort Worth metropolitan area. DFW delivers +112% ARR inflection (\$6.8M run-rate) and +\$4.05 net margin per delivery. DFW corporate office corridors in Plano, Frisco, and Uptown offer high-density corporate lunch baskets averaging \$42.50. Ghost kitchens can be subleased within 14 business days, reaching break-even in 4.5 months.',
    },
    {
      'title': 'Slide 3: Boardroom Speaking Script',
      'body':
          'Slide 3 outlines our top 3 regulatory vulnerabilities and governance mitigations. First, Houston and San Antonio have challenged Texas HB 2127. We insulate QuickBite by enforcing Federal Arbitration Act (FAA) individual arbitration in all driver contracts, coupled with a \$250,000 litigation reserve. Second, Colorado SB 24-205 requires annual algorithmic discrimination audits starting February 2026. We mandate Human-in-the-Loop overrides for courier deactivations. Third, California remains under an indefinite expansion embargo.',
    },
    {
      'title': 'Slide 4: Boardroom Speaking Script',
      'body':
          'Slide 4 details our verification methodology. We followed a strict zero-tolerance secondary citation rule: all statutes were verified against capitol.texas.gov, leg.colorado.gov, and leginfo.legislature.ca.gov. We caught and eliminated critical LLM hallucinations, including DeepSeek falsely claiming Texas capped delivery fees at 15%. Unit economics are anchored against DoorDash and Uber Form 10-K filings.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTopBar(),
          _buildSubNav(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1140),
                  child: _buildCurrentTabContent(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: const BoxDecoration(
        color: AppTheme.bgSurface,
        border: Border(bottom: BorderSide(color: AppTheme.border)),
      ),
      child: Row(
        children: [
          OutlinedButton.icon(
            onPressed: widget.onBackToHub,
            icon: const Icon(Icons.arrow_back, size: 16),
            label: const Text('Master Hub'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.textPrimary,
              side: const BorderSide(color: AppTheme.border),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'QuickBite Technologies',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '// ASSIGNMENT #4',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: AppTheme.success,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Regulatory Impact Analysis Dashboard • Head of Legal & Compliance',
                  style: TextStyle(fontSize: 12, color: AppTheme.textSecondary),
                ),
              ],
            ),
          ),
          const Wrap(
            spacing: 8,
            children: [
              DocDownloadButton(
                label: 'PDF Memo',
                icon: Icons.picture_as_pdf,
                path: 'documents/Complete_Assignment_4_Regulatory_Impact_Analysis.pdf',
              ),
              DocDownloadButton(
                label: 'PPTX Deck',
                icon: Icons.slideshow,
                path: 'documents/AI.135_Assignment4_Jason_Orozco_Zarco.pptx',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubNav() {
    final tabs = [
      'Presentation Deck (Slides 1–4)',
      'Regulatory Matrix & Weights',
      'State Statutory Dossiers',
      'Risk Matrix & Preemption',
      'Methodology Note',
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: AppTheme.bgSurface,
        border: Border(bottom: BorderSide(color: AppTheme.border)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(tabs.length, (index) {
            final isSelected = _currentTab == index;
            return InkWell(
              onTap: () => setState(() => _currentTab = index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected ? AppTheme.success : Colors.transparent,
                      width: 2.5,
                    ),
                  ),
                ),
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected ? AppTheme.textPrimary : AppTheme.textSecondary,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildCurrentTabContent() {
    switch (_currentTab) {
      case 0:
        return _buildPresentationDeckView();
      case 1:
        return _buildDynamicMatrixView();
      case 2:
        return _buildStateDossiersView();
      case 3:
        return _buildRiskMatrixView();
      case 4:
        return _buildMethodologyView();
      default:
        return _buildPresentationDeckView();
    }
  }

  Widget _buildPresentationDeckView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: List.generate(4, (i) {
                final slideNum = i + 1;
                final isSelected = _currentSlide == slideNum;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: OutlinedButton(
                    onPressed: () => setState(() => _currentSlide = slideNum),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: isSelected ? AppTheme.success.withOpacity(0.15) : AppTheme.bgCard,
                      side: BorderSide(
                        color: isSelected ? AppTheme.success : AppTheme.border,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    ),
                    child: Text(
                      'Slide 0$slideNum',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: isSelected ? AppTheme.successLight : AppTheme.textSecondary,
                      ),
                    ),
                  ),
                );
              }),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: _currentSlide > 1
                      ? () => setState(() => _currentSlide--)
                      : null,
                  icon: const Icon(Icons.chevron_left),
                  tooltip: 'Previous Slide',
                ),
                Text(
                  'Slide $_currentSlide of 4',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
                IconButton(
                  onPressed: _currentSlide < 4
                      ? () => setState(() => _currentSlide++)
                      : null,
                  icon: const Icon(Icons.chevron_right),
                  tooltip: 'Next Slide',
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () =>
                      setState(() => _speakerNotesOpen = !_speakerNotesOpen),
                  icon: const Icon(Icons.record_voice_over, size: 16),
                  label: Text(_speakerNotesOpen ? 'Hide Notes' : 'Speaker Notes'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.bgElevated,
                    foregroundColor: AppTheme.textPrimary,
                    side: const BorderSide(color: AppTheme.border),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 18),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.bgCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.border),
          ),
          padding: const EdgeInsets.all(28),
          child: _buildSlideContent(_currentSlide),
        ),
        if (_speakerNotesOpen) ...[
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.bgSurface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.record_voice_over,
                        size: 16, color: AppTheme.primaryLight),
                    const SizedBox(width: 8),
                    Text(
                      _speakerNotes[_currentSlide - 1]['title']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.primaryLight,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  _speakerNotes[_currentSlide - 1]['body']!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textPrimary,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSlideContent(int slide) {
    switch (slide) {
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSlideHeader(
              kicker: 'C-SUITE BRIEFING // EXECUTIVE SLIDE 1',
              title: 'Multi-Jurisdictional Regulatory Comparison Matrix',
              desc:
                  'Direct comparative scoring across statutory compliance pillars: Worker Classification, Fee Caps, AI Law, Kitchen Permitting, and Municipal Preemption.',
            ),
            const SizedBox(height: 20),
            _buildMatrixTable(),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSlideHeader(
              kicker: 'C-SUITE BRIEFING // EXECUTIVE SLIDE 2',
              title: 'Recommended Expansion Target: Dallas-Fort Worth, Texas',
              desc:
                  'DFW provides an immediate +112% ARR inflection point (\$6.8M run-rate), frictionless B2B commercial catering density, and statutory immunity from local municipal wage fragmentation.',
            ),
            const SizedBox(height: 20),
            _buildSlide2Metrics(),
          ],
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSlideHeader(
              kicker: 'C-SUITE BRIEFING // EXECUTIVE SLIDE 3',
              title: 'Top 3 Regulatory Risks & Corporate Governance Mitigations',
              desc:
                  'Proactive legal architecture and algorithmic safeguards designed to isolate QuickBite from municipal litigation and joint-employer liabilities.',
            ),
            const SizedBox(height: 20),
            _buildSlide3Risks(),
          ],
        );
      case 4:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSlideHeader(
              kicker: 'C-SUITE BRIEFING // EXECUTIVE NOTE 4',
              title: 'Forensic Research Methodology & Statutory Audit Trail',
              desc:
                  'Rigorous, hallucination-free verification methodology combining primary .gov legal databases, SEC 10-K filings, and automated triangulation models.',
            ),
            const SizedBox(height: 20),
            _buildSlide4Methodology(),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildSlideHeader({
    required String kicker,
    required String title,
    required String desc,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kicker,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: AppTheme.success,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          desc,
          style: const TextStyle(
            fontSize: 13,
            color: AppTheme.textSecondary,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildMatrixTable() {
    final rows = [
      ['1. Worker Classification', '25%', '9.5 (Labor Code § 201.041)', '7.0 (CRS § 8-70-115)', '4.0 (AB 5 / Prop 22)'],
      ['2. Take-Rate / Fee Caps', '25%', '10.0 (Free Market, 0% Cap)', '9.0 (Sunset Expired)', '3.5 (15% Municipal Caps)'],
      ['3. AI Transparency & Audit', '20%', '9.0 (HB 2060 Taskforce)', '6.5 (SB 24-205 High-Risk)', '6.0 (SB 1047 / AB 3211)'],
      ['4. Kitchen Permitting', '15%', '9.0 (14-Day Fast-Track)', '7.5 (45-Day Health Review)', '4.0 (90-Day CEQA / Multi)'],
      ['5. Municipal Preemption', '15%', '9.5 (HB 2127 Sweeping)', '6.5 (Home-Rule Supremacy)', '3.0 (Zero Preemption)'],
    ];

    return Table(
      border: TableBorder.all(color: AppTheme.border, width: 1),
      children: [
        const TableRow(
          decoration: BoxDecoration(color: AppTheme.bgSurface),
          children: [
            Padding(padding: EdgeInsets.all(10), child: Text('Statutory Pillar', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12))),
            Padding(padding: EdgeInsets.all(10), child: Text('Weight', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12))),
            Padding(padding: EdgeInsets.all(10), child: Text('Texas (Target)', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: AppTheme.success))),
            Padding(padding: EdgeInsets.all(10), child: Text('Colorado (Alternate)', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: AppTheme.warning))),
            Padding(padding: EdgeInsets.all(10), child: Text('California (Caution)', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: AppTheme.danger))),
          ],
        ),
        ...rows.map(
          (r) => TableRow(
            children: [
              Padding(padding: const EdgeInsets.all(10), child: Text(r[0], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
              Padding(padding: const EdgeInsets.all(10), child: Text(r[1], style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary))),
              Padding(padding: const EdgeInsets.all(10), child: Text(r[2], style: const TextStyle(fontSize: 12, color: AppTheme.successLight))),
              Padding(padding: const EdgeInsets.all(10), child: Text(r[3], style: const TextStyle(fontSize: 12, color: AppTheme.warning))),
              Padding(padding: const EdgeInsets.all(10), child: Text(r[4], style: const TextStyle(fontSize: 12, color: AppTheme.danger))),
            ],
          ),
        ),
        const TableRow(
          decoration: BoxDecoration(color: AppTheme.bgSurface),
          children: [
            Padding(padding: EdgeInsets.all(10), child: Text('Weighted Composite Score', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12))),
            Padding(padding: EdgeInsets.all(10), child: Text('100%', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12))),
            Padding(padding: EdgeInsets.all(10), child: Text('9.4 / 10.0 (Sanctuary)', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13, color: AppTheme.success))),
            Padding(padding: EdgeInsets.all(10), child: Text('7.3 / 10.0 (Moderate)', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13, color: AppTheme.warning))),
            Padding(padding: EdgeInsets.all(10), child: Text('4.2 / 10.0 (Prohibitive)', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13, color: AppTheme.danger))),
          ],
        ),
      ],
    );
  }

  Widget _buildSlide2Metrics() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildMetricTile('COMPOSITE REGULATORY SCORE', '9.4 / 10.0', 'Optimal national sanctuary for logistics', AppTheme.success)),
            const SizedBox(width: 14),
            Expanded(child: _buildMetricTile('NET CONTRIBUTION MARGIN', '+\$4.05 / order', 'Superior unit spread vs -\$1.85 loss in CA', AppTheme.primaryLight)),
            const SizedBox(width: 14),
            Expanded(child: _buildMetricTile('12-MONTH RUN-RATE ARR', '\$6.8M', 'Base case from 18,500 daily regional drops', AppTheme.accentPurple)),
          ],
        ),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppTheme.bgSurface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.border),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Core Strategic Catalysts (Why Texas Wins):', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: AppTheme.textPrimary)),
              SizedBox(height: 8),
              Text('• Zero Statutory Commission Caps: Texas preserves complete contract autonomy, allowing 18–25% take rates.', style: TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.4)),
              SizedBox(height: 4),
              Text('• Texas HB 2127 Sweeping Preemption: State statute nullifies fragmented municipal scheduling and local delivery fee caps in Austin, Dallas, and Houston.', style: TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.4)),
              SizedBox(height: 4),
              Text('• Ghost Kitchen Velocity: 14-day commissary licensing enables rapid commercial catering launches without heavy capital expenditure.', style: TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetricTile(String label, String val, String sub, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.bgSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: color)),
          const SizedBox(height: 6),
          Text(val, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color)),
          const SizedBox(height: 4),
          Text(sub, style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildSlide3Risks() {
    final risks = [
      {
        'title': 'Texas HB 2127 Preemption Challenge',
        'severity': 'HIGH SEVERITY',
        'desc': 'City of Houston and San Antonio constitutional challenges could resurrect municipal wage ordinances if struck down.',
        'mitigation': 'Structure contractor agreements under Federal Arbitration Act (FAA) with mandatory individual arbitration; maintain \$250K litigation reserve.',
      },
      {
        'title': 'Colorado SB 24-205 Algorithmic Liability',
        'severity': 'MEDIUM SEVERITY',
        'desc': 'Effective Feb 1, 2026: Imposes strict algorithmic discrimination liability on automated dispatch systems (\$20K/violation).',
        'mitigation': 'Implement mandatory Human-in-the-Loop overrides on dispatch deactivations; quarterly bias audits on routing engines.',
      },
      {
        'title': 'California Prop 22 & AB 5 Misclassification',
        'severity': 'HIGH SEVERITY',
        'desc': 'Severe regulatory drag, 120% minimum wage guarantees on engaged time, and ongoing NLRB reclassification exposure.',
        'mitigation': 'Maintain strict expansion embargo on California until Series B capital close (\$15M+ raised). Deploy capital into Texas.',
      },
    ];

    return Column(
      children: risks.map((r) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.bgSurface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(r['title']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppTheme.textPrimary)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppTheme.danger.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(r['severity']!, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppTheme.danger)),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(r['desc']!, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary, height: 1.35)),
              const SizedBox(height: 8),
              Text('Mitigation: ${r['mitigation']!}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.successLight)),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSlide4Methodology() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Zero-Tolerance Verification Protocols:', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: AppTheme.textPrimary)),
        const SizedBox(height: 10),
        _buildMethodStep('01', 'Primary Statutory Citations', 'Every statute (Tex. Lab. Code § 201.041, HB 2127, Colo. Rev. Stat. § 6-1-1701) verified directly via official legislative portals.'),
        _buildMethodStep('02', 'Tri-Model AI Consensus Protocol', 'ChatGPT-4o, DeepSeek-V3, and Gemini 1.5 Pro queried in parallel with Magnificent Seven prompt architecture to isolate model divergences.'),
        _buildMethodStep('03', 'SEC Form 10-K Anchoring', 'Take-rate (18–25%) and courier unit metrics verified against DoorDash (CIK 0001792789) and Uber (CIK 0001543151) annual reports.'),
        _buildMethodStep('04', 'Critical Hallucinations Eliminated', 'Reconciled DeepSeek hallucination claiming Texas passed a 15% fee cap; confirmed Texas has no statewide cap.'),
      ],
    );
  }

  Widget _buildMethodStep(String num, String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(num, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppTheme.primaryLight)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
                const SizedBox(height: 2),
                Text(body, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary, height: 1.35)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDynamicMatrixView() {
    final txScore = _weights.calculateStateScore(RegulatoryWeights.texasBase);
    final coScore = _weights.calculateStateScore(RegulatoryWeights.coloradoBase);
    final caScore = _weights.calculateStateScore(RegulatoryWeights.californiaBase);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Interactive Dynamic Weight Simulator',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppTheme.textPrimary),
        ),
        const SizedBox(height: 6),
        const Text(
          'Adjust statutory weights below to stress-test Texas, Colorado, and California composite scores in real time.',
          style: TextStyle(fontSize: 13, color: AppTheme.textSecondary),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: _buildScoreDisplay('Texas (Sanctuary)', txScore, AppTheme.success)),
            const SizedBox(width: 14),
            Expanded(child: _buildScoreDisplay('Colorado (Alternate)', coScore, AppTheme.warning)),
            const SizedBox(width: 14),
            Expanded(child: _buildScoreDisplay('California (Caution)', caScore, AppTheme.danger)),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.bgCard,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppTheme.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWeightSlider('Worker Classification (Labor Code § 201.041)', _weights.workerClassification, (v) => setState(() => _weights.workerClassification = v)),
              _buildWeightSlider('Take-Rate & Fee Caps (0% Texas vs 15% CA)', _weights.feeCaps, (v) => setState(() => _weights.feeCaps = v)),
              _buildWeightSlider('AI Transparency & Algorithmic Audit (SB 24-205)', _weights.aiTransparency, (v) => setState(() => _weights.aiTransparency = v)),
              _buildWeightSlider('Commercial Permitting & Ghost Kitchens', _weights.permitting, (v) => setState(() => _weights.permitting = v)),
              _buildWeightSlider('Municipal Preemption (Texas HB 2127)', _weights.preemption, (v) => setState(() => _weights.preemption = v)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScoreDisplay(String name, double score, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: color)),
          const SizedBox(height: 6),
          Text('${score.toStringAsFixed(1)} / 10', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: color)),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: (score / 10.0).clamp(0.0, 1.0),
            backgroundColor: AppTheme.bgElevated,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 6,
          ),
        ],
      ),
    );
  }

  Widget _buildWeightSlider(String title, double value, ValueChanged<double> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
              Text('${value.toStringAsFixed(0)}%', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: AppTheme.primaryLight)),
            ],
          ),
          Slider(
            value: value,
            min: 5,
            max: 50,
            divisions: 45,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildStateDossiersView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('State Statutory Dossiers & Legislative Texts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppTheme.textPrimary)),
        const SizedBox(height: 16),
        _buildDossierCard('Texas (Dallas-Fort Worth Beachhead)', AppTheme.success, [
          'Tex. Lab. Code Ann. § 201.041: 20-factor common-law control standard protects 1099 courier classification.',
          'Tex. Civ. Prac. & Rem. Code § 102A.001 (HB 2127): Explicit state preemption over municipal employment and commerce codes.',
          'Tex. Tax Code § 151.0242: Marketplace facilitator single-return remittance; 0% state corporate income tax.',
        ]),
        const SizedBox(height: 14),
        _buildDossierCard('Colorado (Denver Metro Alternative)', AppTheme.warning, [
          'Colo. Rev. Stat. § 8-70-115: 9-point statutory independence test for independent contractors.',
          'Colo. Rev. Stat. § 6-1-1701 (SB 24-205): AI Act mandates annual algorithmic impact assessments for automated dispatch.',
          'Healthy Families & Workplaces Act (HFWA): Mandates 48 hours of paid sick leave per year for workers.',
        ]),
        const SizedBox(height: 14),
        _buildDossierCard('California (Under Expansion Embargo)', AppTheme.danger, [
          'Cal. Lab. Code § 2775 (AB 5) & Prop 22 (Bus. & Prof. Code § 7451): Engaged-time minimum wage floors (+78% cost penalty).',
          'San Francisco Admin. Code Ch. 110: 15% permanent commission cap on restaurant deliveries.',
          'Cal. Rev. & Tax Code § 23153: 8.84% corporate tax rate + \$800 minimum annual franchise tax.',
        ]),
      ],
    );
  }

  Widget _buildDossierCard(String title, Color color, List<String> citations) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: color)),
          const SizedBox(height: 10),
          ...citations.map((c) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.gavel, size: 14, color: AppTheme.textSecondary),
                    const SizedBox(width: 8),
                    Expanded(child: Text(c, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary, height: 1.35))),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildRiskMatrixView() {
    return _buildSlide3Risks();
  }

  Widget _buildMethodologyView() {
    return _buildSlide4Methodology();
  }
}

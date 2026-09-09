import 'package:flutter/material.dart';
import '../models/sensitivity_model.dart';
import '../theme/app_theme.dart';
import '../widgets/doc_download_button.dart';
import '../widgets/orientation_bar.dart';

class Assignment5View extends StatefulWidget {
  final VoidCallback onBackToHub;

  const Assignment5View({super.key, required this.onBackToHub});

  @override
  State<Assignment5View> createState() => _Assignment5ViewState();
}

class _Assignment5ViewState extends State<Assignment5View> {
  String _selectedPersona = 'cso'; // cso, ceo, cfo
  String _selectedScenario = 'base'; // bear, base, bull
  int _selectedPanelFilter = 0; // 0: all, 1: ai, 2: market, 3: expansion, 4: roadmap
  int _selectedAiPlatform = 0; // 0: chatgpt, 1: deepseek, 2: gemini

  final SensitivityModel _sim = SensitivityModel();

  void _applyScenario(String scenario) {
    setState(() {
      _selectedScenario = scenario;
      if (scenario == 'bear') {
        _sim.aov = 32.00;
        _sim.throughput = 2.2;
        _sim.commissionRate = 18.0;
      } else if (scenario == 'base') {
        _sim.aov = 38.50;
        _sim.throughput = 2.8;
        _sim.commissionRate = 22.0;
      } else if (scenario == 'bull') {
        _sim.aov = 46.00;
        _sim.throughput = 3.5;
        _sim.commissionRate = 25.0;
      }
    });
  }

  void _openUserGuideDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppTheme.bgCard,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppTheme.border),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700, maxHeight: 600),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '1-Page Executive User Guide // Assignment 5',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, size: 20),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'System Purpose & Executive Decision Mandate',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.primaryLight,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'This interactive system synthesizes research across Assignments 1 through 4 into a unified boardroom decision engine for Helene Chen (CEO) and José Rodriguez (CFO). It eliminates cross-model hallucinations and provides instant sensitivity stress-testing for Series A capital deployment.',
                            style: TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.4),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'How to Navigate & Interpret:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.primaryLight,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '1. Executive Persona Switcher: Toggle between CSO Strategic View, CEO 10-Second Scannable View, and CFO Unit Economics View.\n\n'
                            '2. Sensitivity Simulator: Adjust AOV, Hourly Throughput, and Commission Take-Rate in Panel 2 to inspect instantaneous changes to Net Contribution, 12-Month ARR, and Cash Runway.\n\n'
                            '3. Triangulation Log & Contradiction Resolution: Solves the Week 9 Contradiction Problem between Assignment 3 market upside and Assignment 4 Texas HB 2127 preemption litigation via mandatory FAA arbitration and modular dispatch architecture.',
                            style: TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.45),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTopBar(),
          const QuickOrientationBar(),
          _buildSubNav(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1140),
                  child: _buildFilteredPanels(),
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
          const SizedBox(width: 14),
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
                      '// ASSIGNMENT #5',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: AppTheme.primaryLight,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Executive Research Dashboard • Chief Strategy Officer',
                  style: TextStyle(fontSize: 12, color: AppTheme.textSecondary),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _buildPersonaButton('cso', 'CSO View'),
              const SizedBox(width: 6),
              _buildPersonaButton('ceo', 'CEO View'),
              const SizedBox(width: 6),
              _buildPersonaButton('cfo', 'CFO View'),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: _openUserGuideDialog,
                icon: const Icon(Icons.help_outline, size: 16),
                label: const Text('User Guide'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.bgElevated,
                  foregroundColor: AppTheme.textPrimary,
                  side: const BorderSide(color: AppTheme.border),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              const SizedBox(width: 8),
              const DocDownloadButton(
                label: 'Guide (PDF)',
                icon: Icons.picture_as_pdf,
                path: 'documents/Complete_Assignment_5_Executive_Dashboard_User_Guide.pdf',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPersonaButton(String id, String label) {
    final isSelected = _selectedPersona == id;
    return OutlinedButton(
      onPressed: () => setState(() => _selectedPersona = id),
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? AppTheme.primary.withOpacity(0.2) : Colors.transparent,
        side: BorderSide(
          color: isSelected ? AppTheme.primary : AppTheme.border,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
          color: isSelected ? AppTheme.primaryLight : AppTheme.textSecondary,
        ),
      ),
    );
  }

  Widget _buildSubNav() {
    final filters = [
      'All 4 Panels',
      '1. AI Strategy',
      '2. Market Opportunity',
      '3. Expansion Readiness',
      '4. Strategic Roadmap',
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: AppTheme.bgSurface,
        border: Border(bottom: BorderSide(color: AppTheme.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(filters.length, (index) {
                final isSelected = _selectedPanelFilter == index;
                return InkWell(
                  onTap: () => setState(() => _selectedPanelFilter = index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isSelected ? AppTheme.primary : Colors.transparent,
                          width: 2.5,
                        ),
                      ),
                    ),
                    child: Text(
                      filters[index],
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
          Row(
            children: [
              const Text('Expansion Scenario: ', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppTheme.textSecondary)),
              _buildScenarioPill('bear', 'Bear (\$4.9M)'),
              const SizedBox(width: 6),
              _buildScenarioPill('base', 'Base (\$6.8M)'),
              const SizedBox(width: 6),
              _buildScenarioPill('bull', 'Bull (\$8.2M)'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScenarioPill(String id, String label) {
    final isSelected = _selectedScenario == id;
    return InkWell(
      onTap: () => _applyScenario(id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : AppTheme.bgElevated,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
            color: isSelected ? Colors.white : AppTheme.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildFilteredPanels() {
    final showAll = _selectedPanelFilter == 0;
    return Column(
      children: [
        if (showAll || _selectedPanelFilter == 1) ...[
          _buildPanel1AiStrategy(),
          const SizedBox(height: 24),
        ],
        if (showAll || _selectedPanelFilter == 2) ...[
          _buildPanel2MarketOpportunity(),
          const SizedBox(height: 24),
        ],
        if (showAll || _selectedPanelFilter == 3) ...[
          _buildPanel3ExpansionReadiness(),
          const SizedBox(height: 24),
        ],
        if (showAll || _selectedPanelFilter == 4) ...[
          _buildPanel4StrategicRoadmap(),
          const SizedBox(height: 24),
        ],
      ],
    );
  }

  Widget _buildPanelContainer({
    required String panelNum,
    required String title,
    required Widget child,
    String? confidence,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    panelNum,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.primaryLight,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
              if (confidence != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.success.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    confidence,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.successLight,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildPanel1AiStrategy() {
    return _buildPanelContainer(
      panelNum: 'PANEL 01 // ASSIGNMENT 1 SYNTHESIS',
      title: 'AI Strategy Panel: Tri-Model Operational Architecture',
      confidence: 'CONFIDENCE: HIGH',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppTheme.bgSurface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.border),
            ),
            child: const Text(
              'SO WHAT FOR THE BOARD: Reject single-model dependence. Deploy ChatGPT 5.5 Instant for client onboarding funnels; deploy DeepSeek V4 Flash Thinking for statutory audits; deploy Gemini 3.1 Pro Extended for joint-employer liability stress-testing.',
              style: TextStyle(fontSize: 13, color: AppTheme.textPrimary, height: 1.4),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              _buildAiPlatformTab(0, 'ChatGPT 5.5 Instant'),
              const SizedBox(width: 8),
              _buildAiPlatformTab(1, 'DeepSeek V4 Flash'),
              const SizedBox(width: 8),
              _buildAiPlatformTab(2, 'Gemini 3.1 Pro Extended'),
            ],
          ),
          const SizedBox(height: 14),
          _buildAiPlatformDetail(_selectedAiPlatform),
        ],
      ),
    );
  }

  Widget _buildAiPlatformTab(int index, String label) {
    final isSelected = _selectedAiPlatform == index;
    return OutlinedButton(
      onPressed: () => setState(() => _selectedAiPlatform = index),
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? AppTheme.primary.withOpacity(0.2) : AppTheme.bgSurface,
        side: BorderSide(color: isSelected ? AppTheme.primary : AppTheme.border),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
          color: isSelected ? AppTheme.primaryLight : AppTheme.textSecondary,
        ),
      ),
    );
  }

  Widget _buildAiPlatformDetail(int index) {
    final platforms = [
      {
        'role': 'Customer Conversion & High-Volume B2B Funnel Engine',
        'cost': '\$0.003 / 1k tokens',
        'speed': '142 tokens/sec',
        'hallucination': 'Low (2.1% error rate on general business text)',
        'verdict': 'Primary operational deployer for merchant menu ingestion and customer catering support.',
      },
      {
        'role': 'Statutory Checklist & Autonomous Compliance Auditing',
        'cost': '\$0.0008 / 1k tokens',
        'speed': '98 tokens/sec',
        'hallucination': 'Medium (Requires validation against official court dockets)',
        'verdict': 'Internal compliance parser. Hallucinated a 15% Texas fee cap in early trials; now bounded by zero-shot citation checkers.',
      },
      {
        'role': 'Multi-Source Document Synthesis & 10-K Long-Context Audit',
        'cost': '\$0.005 / 1k tokens',
        'speed': '110 tokens/sec',
        'hallucination': 'Ultra-Low (<1.0% error rate on structured financial tables)',
        'verdict': 'Chief auditor for DoorDash and Uber Form 10-K unit economics and contract covenant risk modeling.',
      },
    ];

    final p = platforms[index];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.bgSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(p['role']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppTheme.textPrimary)),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('Inference Cost: ${p['cost']!}', style: const TextStyle(fontSize: 12, color: AppTheme.primaryLight, fontWeight: FontWeight.w600)),
              const SizedBox(width: 16),
              Text('Speed: ${p['speed']!}', style: const TextStyle(fontSize: 12, color: AppTheme.successLight, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 8),
          Text('Hallucination Profile: ${p['hallucination']!}', style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
          const SizedBox(height: 8),
          Text('Boardroom Verdict: ${p['verdict']!}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildPanel2MarketOpportunity() {
    return _buildPanelContainer(
      panelNum: 'PANEL 02 // ASSIGNMENT 3 SYNTHESIS',
      title: 'Market Opportunity Meter & Live Sensitivity Simulator',
      confidence: 'ANCHORED: SEC 10-K FILINGS',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: _buildSimKpiCard('NET CONTRIBUTION', '${_sim.netContribution >= 0 ? '+' : ''}\$${_sim.netContribution.toStringAsFixed(2)}', 'Per delivery contribution', AppTheme.success)),
              const SizedBox(width: 12),
              Expanded(child: _buildSimKpiCard('PROJECTED 12-MO ARR', '\$${_sim.projectedArr.toStringAsFixed(2)}M', '1.68M annual orders', AppTheme.primaryLight)),
              const SizedBox(width: 12),
              Expanded(child: _buildSimKpiCard('GROSS MARGIN', '${_sim.grossMargin.toStringAsFixed(1)}%', 'GAAP revenue take', AppTheme.accentPurple)),
              const SizedBox(width: 12),
              Expanded(child: _buildSimKpiCard('CASH RUNWAY', '${_sim.cashRunwayMonths.toStringAsFixed(1)} Mos', 'Post \$2.0M deployment', AppTheme.warning)),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.bgSurface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Live Sensitivity Sliders:', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: AppTheme.textPrimary)),
                const SizedBox(height: 14),
                _buildSliderRow(
                  label: 'Average Order Value (AOV)',
                  displayVal: '\$${_sim.aov.toStringAsFixed(2)}',
                  val: _sim.aov,
                  min: 20.0,
                  max: 80.0,
                  divisions: 60,
                  onChanged: (v) => setState(() => _sim.aov = v),
                ),
                _buildSliderRow(
                  label: 'Courier Throughput (Drops / Hour)',
                  displayVal: '${_sim.throughput.toStringAsFixed(1)} drops/hr',
                  val: _sim.throughput,
                  min: 1.5,
                  max: 5.0,
                  divisions: 35,
                  onChanged: (v) => setState(() => _sim.throughput = v),
                ),
                _buildSliderRow(
                  label: 'Platform Commission Take-Rate',
                  displayVal: '${_sim.commissionRate.toStringAsFixed(1)}%',
                  val: _sim.commissionRate,
                  min: 12.0,
                  max: 30.0,
                  divisions: 36,
                  onChanged: (v) => setState(() => _sim.commissionRate = v),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppTheme.bgSurface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.border),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.account_balance, size: 16, color: AppTheme.primaryLight),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'SEC 10-K Anchors: Benchmarked against DoorDash Inc. (CIK 0001792789; FY23 10-K Marketplace GOV \$66.8B, Take Rate 13.1%) and Uber Technologies Inc. (CIK 0001543151; FY23 10-K Delivery Gross Bookings \$67.8B, Take Rate 15.3%). QuickBite DFW unit spread operates at P75 of peer performance.',
                    style: TextStyle(fontSize: 12, color: AppTheme.textSecondary, height: 1.35),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimKpiCard(String label, String value, String sub, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.bgSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: color)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: color)),
          const SizedBox(height: 2),
          Text(sub, style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildSliderRow({
    required String label,
    required String displayVal,
    required double val,
    required double min,
    required double max,
    required int divisions,
    required ValueChanged<double> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
              Text(displayVal, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppTheme.primaryLight)),
            ],
          ),
          Slider(
            value: val,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildPanel3ExpansionReadiness() {
    return _buildPanelContainer(
      panelNum: 'PANEL 03 // ASSIGNMENT 4 SYNTHESIS',
      title: 'Expansion Readiness Gauge: Dallas-Fort Worth Sanctuary',
      confidence: 'SCORE: 9.4 / 10.0',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DFW establishes our primary beachhead under Texas Labor Code § 201.041 and HB 2127 preemption. Key competitive differentials:',
            style: TextStyle(fontSize: 13, color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _buildReadinessItem(
                  'Texas (Target)',
                  '9.4 / 10',
                  '45-Day Launch Horizon • 0% State Income Tax • No Fee Caps',
                  AppTheme.success,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildReadinessItem(
                  'Colorado (Secondary)',
                  '7.3 / 10',
                  '90-Day Launch • SB 24-205 AI Audits • Home-Rule Tax Filings',
                  AppTheme.warning,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildReadinessItem(
                  'California (Embargo)',
                  '4.2 / 10',
                  'Indefinitely Deferred • Prop 22 Wage Mandates • 15% Caps',
                  AppTheme.danger,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReadinessItem(String title, String score, String desc, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.bgSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: color)),
              Text(score, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: color)),
            ],
          ),
          const SizedBox(height: 6),
          Text(desc, style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary, height: 1.35)),
        ],
      ),
    );
  }

  Widget _buildPanel4StrategicRoadmap() {
    return _buildPanelContainer(
      panelNum: 'PANEL 04 // ASSIGNMENTS 1–4 CONVERGENCE',
      title: 'Strategic Roadmap & 18-Month Capital Deployment',
      confidence: 'SERIES A DEPLOYMENT: \$2.5M',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Triangulation Log & Contradiction Resolution: Resolved the Week 9 Contradiction Problem. Assignment 3 indicated high market upside in Dallas, while Assignment 4 flagged Texas HB 2127 preemption litigation. QuickBite resolves this through FAA-governed driver arbitration agreements and modular dispatch geofencing.',
            style: TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.4),
          ),
          const SizedBox(height: 18),
          _buildRoadmapPhase('Phase 1: DFW Beachhead (\$800,000)', 'Days 1–90', 'Establish entity, onboard 120 1099 couriers, sublease 5 ghost kitchens in Plano/Frisco.', AppTheme.success),
          _buildRoadmapPhase('Phase 2: Austin AI Dispatch Engine (\$1,200,000)', 'Months 4–10', 'Centralize automated routing and dynamic take-rate algorithms; reach 5,000 daily drops.', AppTheme.primaryLight),
          _buildRoadmapPhase('Phase 3: Denver Expansion & Regulatory Reserve (\$500,000)', 'Months 11–18', 'Deploy into Denver metro under SB 24-205 AI audit protocols; maintain litigation reserve.', AppTheme.accentPurple),
        ],
      ),
    );
  }

  Widget _buildRoadmapPhase(String title, String timeframe, String desc, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.bgSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(timeframe, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: color)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: AppTheme.textPrimary)),
                const SizedBox(height: 3),
                Text(desc, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

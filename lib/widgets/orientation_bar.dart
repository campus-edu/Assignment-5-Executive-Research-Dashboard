import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class QuickOrientationBar extends StatelessWidget {
  const QuickOrientationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: const BoxDecoration(
        color: AppTheme.bgSurface,
        border: Border(
          bottom: BorderSide(color: AppTheme.border, width: 1),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;
          return isWide
              ? const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _OrientationItem(
                        tag: 'Q1 • WHAT IS THIS TELLING ME?',
                        body:
                            'Dallas-Fort Worth offers +112% ARR inflection (\$6.8M run-rate) and +\$4.05 net margin per drop under Texas sanctuary.',
                      ),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: _OrientationItem(
                        tag: 'Q2 • HOW CONFIDENT ARE WE?',
                        body:
                            'HIGH on unit economics & SEC filings (CIK 0001792789 / 0001543151); MEDIUM on Texas HB 2127 litigation.',
                      ),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: _OrientationItem(
                        tag: 'Q3 • WHAT SHOULD WE DO FIRST?',
                        body:
                            'Deploy \$800,000 DFW beachhead (B2B corporate focus) while reserving \$1.2M for Austin AI Dispatch Engine.',
                      ),
                    ),
                  ],
                )
              : const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _OrientationItem(
                      tag: 'Q1 • WHAT IS THIS TELLING ME?',
                      body:
                          'Dallas-Fort Worth offers +112% ARR inflection (\$6.8M run-rate) and +\$4.05 net margin per drop under Texas sanctuary.',
                    ),
                    SizedBox(height: 12),
                    _OrientationItem(
                      tag: 'Q2 • HOW CONFIDENT ARE WE?',
                      body:
                          'HIGH on unit economics & SEC filings (CIK 0001792789 / 0001543151); MEDIUM on Texas HB 2127 litigation.',
                    ),
                    SizedBox(height: 12),
                    _OrientationItem(
                      tag: 'Q3 • WHAT SHOULD WE DO FIRST?',
                      body:
                          'Deploy \$800,000 DFW beachhead (B2B corporate focus) while reserving \$1.2M for Austin AI Dispatch Engine.',
                    ),
                  ],
                );
        },
      ),
    );
  }
}

class _OrientationItem extends StatelessWidget {
  final String tag;
  final String body;

  const _OrientationItem({required this.tag, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tag,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
            color: AppTheme.primaryLight,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          body,
          style: const TextStyle(
            fontSize: 13,
            color: AppTheme.textPrimary,
            height: 1.35,
          ),
        ),
      ],
    );
  }
}

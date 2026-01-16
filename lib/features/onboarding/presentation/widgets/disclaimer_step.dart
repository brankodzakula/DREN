import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';

/// Health disclaimer acceptance step
class DisclaimerStep extends StatefulWidget {
  final bool isAccepted;
  final ValueChanged<bool> onAcceptedChanged;

  const DisclaimerStep({
    super.key,
    required this.isAccepted,
    required this.onAcceptedChanged,
  });

  @override
  State<DisclaimerStep> createState() => _DisclaimerStepState();
}

class _DisclaimerStepState extends State<DisclaimerStep> {
  final ScrollController _scrollController = ScrollController();
  bool _hasScrolledToBottom = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 50) {
      if (!_hasScrolledToBottom) {
        setState(() {
          _hasScrolledToBottom = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DrenSpacing.screenHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: DrenSpacing.xl),

          // Title
          Text(
            'Health Disclaimer',
            style: DrenTypography.title1.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),

          const SizedBox(height: DrenSpacing.sm),

          // Subtitle
          Text(
            'Please read and accept before continuing',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),

          const SizedBox(height: DrenSpacing.lg),

          // Scrollable legal text
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: DrenColors.surfacePrimary,
                borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(DrenSpacing.md),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _DisclaimerSection(
                          title: 'Not Medical Advice',
                          content:
                              'Dren provides general health and fitness information, not medical advice. The recommendations, protocols, and suggestions provided by this app are for educational and informational purposes only.',
                        ),
                        _DisclaimerSection(
                          title: 'Consult Your Healthcare Provider',
                          content:
                              'Before starting any new diet, exercise program, or making changes to your health routine, consult with a qualified healthcare professional. This is especially important if you have any existing health conditions, are taking medications, or have concerns about your health.',
                        ),
                        _DisclaimerSection(
                          title: 'Individual Results May Vary',
                          content:
                              'The protocols and recommendations in this app are based on general research and may not be suitable for everyone. Individual results may vary based on factors including age, sex, genetics, lifestyle, and underlying health conditions.',
                        ),
                        _DisclaimerSection(
                          title: 'No Guarantee of Results',
                          content:
                              'We do not guarantee any specific health outcomes or results. The effectiveness of any protocol depends on consistent adherence and individual factors beyond our control.',
                        ),
                        _DisclaimerSection(
                          title: 'Emergency Situations',
                          content:
                              'If you experience any adverse symptoms, pain, or discomfort while following any protocol, stop immediately and seek medical attention. In case of emergency, call your local emergency services.',
                        ),
                        _DisclaimerSection(
                          title: 'Data Privacy',
                          content:
                              'All your health data is stored locally on your device and encrypted. We do not have access to your personal health information. For more details, please review our Privacy Policy.',
                        ),
                        _DisclaimerSection(
                          title: 'Age Requirement',
                          content:
                              'This app is intended for users 18 years of age or older. By using this app, you confirm that you meet this age requirement.',
                        ),
                        SizedBox(height: DrenSpacing.lg),
                      ],
                    ),
                  ),
                  // Scroll indicator
                  if (!_hasScrolledToBottom)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              DrenColors.surfacePrimary.withValues(alpha: 0),
                              DrenColors.surfacePrimary,
                            ],
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(DrenSpacing.radiusMd),
                            bottomRight: Radius.circular(DrenSpacing.radiusMd),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: DrenColors.textSecondary,
                                size: 20,
                              ),
                              Text(
                                'Scroll to read more',
                                style: DrenTypography.caption1.copyWith(
                                  color: DrenColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: DrenSpacing.lg),

          // Acceptance checkbox
          GestureDetector(
            onTap: _hasScrolledToBottom
                ? () => widget.onAcceptedChanged(!widget.isAccepted)
                : null,
            child: AnimatedOpacity(
              opacity: _hasScrolledToBottom ? 1.0 : 0.5,
              duration: const Duration(milliseconds: 200),
              child: Container(
                padding: const EdgeInsets.all(DrenSpacing.md),
                decoration: BoxDecoration(
                  color: widget.isAccepted
                      ? DrenColors.primary.withValues(alpha: 0.1)
                      : DrenColors.surfacePrimary,
                  borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
                  border: Border.all(
                    color: widget.isAccepted ? DrenColors.primary : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: widget.isAccepted,
                      onChanged: _hasScrolledToBottom
                          ? (value) => widget.onAcceptedChanged(value ?? false)
                          : null,
                      activeColor: DrenColors.primary,
                      checkColor: DrenColors.background,
                      side: BorderSide(
                        color: _hasScrolledToBottom
                            ? DrenColors.textSecondary
                            : DrenColors.textTertiary,
                        width: 2,
                      ),
                    ),
                    const SizedBox(width: DrenSpacing.xs),
                    Expanded(
                      child: Text(
                        'I have read and understand the health disclaimer',
                        style: DrenTypography.body.copyWith(
                          color: widget.isAccepted
                              ? DrenColors.primary
                              : _hasScrolledToBottom
                                  ? DrenColors.textPrimary
                                  : DrenColors.textTertiary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: DrenSpacing.md),

          // Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // TODO: Open Privacy Policy
                },
                child: Text(
                  'Privacy Policy',
                  style: DrenTypography.caption1.copyWith(
                    color: DrenColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Text(
                '  •  ',
                style: DrenTypography.caption1.copyWith(
                  color: DrenColors.textTertiary,
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Open Terms of Service
                },
                child: Text(
                  'Terms of Service',
                  style: DrenTypography.caption1.copyWith(
                    color: DrenColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: DrenSpacing.lg),
        ],
      ),
    );
  }
}

class _DisclaimerSection extends StatelessWidget {
  final String title;
  final String content;

  const _DisclaimerSection({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DrenSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.xs),
          Text(
            content,
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

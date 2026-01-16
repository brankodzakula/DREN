import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/meditation.dart';

/// A card displaying a meditation session
class MeditationCard extends StatelessWidget {
  final Meditation meditation;
  final bool isPlaying;
  final VoidCallback onPlay;
  final VoidCallback? onStop;

  const MeditationCard({
    super.key,
    required this.meditation,
    required this.isPlaying,
    required this.onPlay,
    this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isPlaying ? onStop : onPlay,
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: DrenColors.surfacePrimary,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
          border: isPlaying
              ? Border.all(color: DrenColors.sleepRing, width: 2)
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: _getCategoryColor().withValues(alpha: 0.2),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(DrenSpacing.radiusMd),
                ),
              ),
              child: Stack(
                children: [
                  // Category icon as placeholder for thumbnail
                  Center(
                    child: Icon(
                      _getCategoryIcon(),
                      size: 40,
                      color: _getCategoryColor(),
                    ),
                  ),

                  // Play/Stop button overlay
                  Positioned(
                    right: DrenSpacing.sm,
                    bottom: DrenSpacing.sm,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: isPlaying
                            ? DrenColors.sleepRing
                            : DrenColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isPlaying ? Icons.stop : Icons.play_arrow,
                        color: DrenColors.background,
                        size: 20,
                      ),
                    ),
                  ),

                  // Downloaded indicator
                  if (meditation.isDownloaded)
                    Positioned(
                      left: DrenSpacing.sm,
                      top: DrenSpacing.sm,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: DrenColors.background.withValues(alpha: 0.8),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.download_done,
                          size: 12,
                          color: DrenColors.success,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(DrenSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    meditation.title,
                    style: DrenTypography.subheadline.copyWith(
                      color: DrenColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: DrenSpacing.xxs),

                  // Duration
                  Text(
                    '${meditation.durationMinutes} min',
                    style: DrenTypography.caption1.copyWith(
                      color: DrenColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor() {
    final category = MeditationCategoryExtension.fromString(meditation.category);
    switch (category) {
      case MeditationCategory.windDown:
        return DrenColors.sleepRing;
      case MeditationCategory.sleepStory:
        return const Color(0xFFAF52DE); // Purple
      case MeditationCategory.soundscape:
        return DrenColors.info;
      case MeditationCategory.sos:
        return DrenColors.warning;
    }
  }

  IconData _getCategoryIcon() {
    final category = MeditationCategoryExtension.fromString(meditation.category);
    switch (category) {
      case MeditationCategory.windDown:
        return Icons.self_improvement;
      case MeditationCategory.sleepStory:
        return Icons.auto_stories;
      case MeditationCategory.soundscape:
        return Icons.graphic_eq;
      case MeditationCategory.sos:
        return Icons.emergency;
    }
  }
}

/// Horizontal scrollable list of meditation cards
class MeditationCarousel extends StatelessWidget {
  final List<Meditation> meditations;
  final Meditation? playingMeditation;
  final void Function(String meditationId) onPlay;
  final VoidCallback onStop;
  final String? selectedCategory;
  final void Function(String? category) onCategoryChanged;

  const MeditationCarousel({
    super.key,
    required this.meditations,
    required this.playingMeditation,
    required this.onPlay,
    required this.onStop,
    this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Filter meditations by category if selected
    final filteredMeditations = selectedCategory == null
        ? meditations
        : meditations
            .where((m) => m.category == selectedCategory)
            .toList();

    return Container(
      padding: const EdgeInsets.all(DrenSpacing.lg),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Guided Meditations',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.md),

          // Category filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _CategoryChip(
                  label: 'All',
                  isSelected: selectedCategory == null,
                  onTap: () => onCategoryChanged(null),
                ),
                const SizedBox(width: DrenSpacing.xs),
                ...MeditationCategory.values.map((category) => Padding(
                  padding: const EdgeInsets.only(right: DrenSpacing.xs),
                  child: _CategoryChip(
                    label: category.displayName,
                    isSelected: selectedCategory == category.value,
                    onTap: () => onCategoryChanged(category.value),
                  ),
                )),
              ],
            ),
          ),
          const SizedBox(height: DrenSpacing.md),

          // Meditation cards
          if (filteredMeditations.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(DrenSpacing.lg),
                child: Text(
                  'No meditations available',
                  style: DrenTypography.body.copyWith(
                    color: DrenColors.textSecondary,
                  ),
                ),
              ),
            )
          else
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: filteredMeditations.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(width: DrenSpacing.sm),
                itemBuilder: (context, index) {
                  final meditation = filteredMeditations[index];
                  return MeditationCard(
                    meditation: meditation,
                    isPlaying: playingMeditation?.id == meditation.id,
                    onPlay: () => onPlay(meditation.id),
                    onStop: onStop,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: DrenSpacing.md,
          vertical: DrenSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? DrenColors.sleepRing.withValues(alpha: 0.2)
              : DrenColors.surfaceSecondary,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusFull),
          border: isSelected
              ? Border.all(color: DrenColors.sleepRing, width: 1)
              : null,
        ),
        child: Text(
          label,
          style: DrenTypography.caption1.copyWith(
            color: isSelected ? DrenColors.sleepRing : DrenColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

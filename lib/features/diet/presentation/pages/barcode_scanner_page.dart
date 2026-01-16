import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/food_item.dart';
import '../bloc/diet_bloc.dart';
import '../bloc/diet_event.dart';
import '../bloc/diet_state.dart';
import '../widgets/food_detail_sheet.dart';

/// Barcode scanner page for scanning food products
class BarcodeScannerPage extends StatefulWidget {
  final String? mealType;

  const BarcodeScannerPage({
    super.key,
    this.mealType,
  });

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  late final MobileScannerController _scannerController;

  bool _isScanning = true;
  bool _torchEnabled = false;
  String? _lastScannedCode;

  @override
  void initState() {
    super.initState();
    _scannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DietBloc>()..add(const DietEvent.loadMeals()),
      child: Scaffold(
        backgroundColor: DrenColors.background,
        body: Stack(
          children: [
            // Camera preview
            MobileScanner(
              controller: _scannerController,
              onDetect: _onBarcodeDetected,
            ),

            // Overlay
            _buildOverlay(),

            // Top bar
            _buildTopBar(context),

            // Bottom controls
            _buildBottomControls(),

            // Result overlay
            BlocBuilder<DietBloc, DietState>(
              builder: (context, state) {
                if (state is DietSearching) {
                  return _buildLoadingOverlay();
                }
                if (state is DietSearchResults && state.results.isNotEmpty) {
                  // Auto-show the food detail sheet
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) {
                      _showFoodResult(context, state.results.first);
                    }
                  });
                }
                if (state is DietError) {
                  return _buildErrorOverlay(context, state.message);
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverlay() {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Colors.black.withValues(alpha: 0.5),
        BlendMode.srcOut,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              backgroundBlendMode: BlendMode.dstOut,
            ),
          ),
          Center(
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                color: Colors.red, // This will be cut out
                borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(DrenSpacing.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Close button
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: DrenColors.surfacePrimary.withValues(alpha: 0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: DrenColors.textPrimary,
                ),
              ),
              onPressed: () => context.pop(),
            ),

            // Flash toggle
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: DrenColors.surfacePrimary.withValues(alpha: 0.8),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _torchEnabled ? Icons.flash_on : Icons.flash_off,
                  color: _torchEnabled
                      ? DrenColors.primary
                      : DrenColors.textPrimary,
                ),
              ),
              onPressed: () {
                _scannerController.toggleTorch();
                setState(() => _torchEnabled = !_torchEnabled);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomControls() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          left: DrenSpacing.lg,
          right: DrenSpacing.lg,
          top: DrenSpacing.lg,
          bottom: MediaQuery.of(context).padding.bottom + DrenSpacing.lg,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Scanning indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _isScanning ? DrenColors.success : DrenColors.error,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: DrenSpacing.xs),
                Text(
                  _isScanning ? 'Scanning...' : 'Paused',
                  style: DrenTypography.subheadline.copyWith(
                    color: DrenColors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: DrenSpacing.sm),

            // Instructions
            Text(
              'Point the camera at a barcode',
              style: DrenTypography.body.copyWith(
                color: DrenColors.textSecondary,
              ),
            ),
            const SizedBox(height: DrenSpacing.md),

            // Manual entry button
            TextButton(
              onPressed: () {
                context.pop();
                // Navigate to search
              },
              child: Text(
                "Can't scan? Search manually",
                style: DrenTypography.body.copyWith(
                  color: DrenColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingOverlay() {
    return Container(
      color: Colors.black.withValues(alpha: 0.7),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(DrenSpacing.lg),
          decoration: BoxDecoration(
            color: DrenColors.surfacePrimary,
            borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: DrenColors.primary),
              const SizedBox(height: DrenSpacing.md),
              Text(
                'Looking up product...',
                style: DrenTypography.body.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorOverlay(BuildContext context, String message) {
    return Container(
      color: Colors.black.withValues(alpha: 0.7),
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(DrenSpacing.lg),
          padding: const EdgeInsets.all(DrenSpacing.lg),
          decoration: BoxDecoration(
            color: DrenColors.surfacePrimary,
            borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                color: DrenColors.error,
                size: 48,
              ),
              const SizedBox(height: DrenSpacing.md),
              Text(
                'Product Not Found',
                style: DrenTypography.headline.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
              const SizedBox(height: DrenSpacing.xs),
              Text(
                message,
                style: DrenTypography.footnote.copyWith(
                  color: DrenColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DrenSpacing.md),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      _lastScannedCode = null;
                      setState(() => _isScanning = true);
                      context.read<DietBloc>().add(const DietEvent.clearSearch());
                    },
                    child: Text(
                      'Try Again',
                      style: DrenTypography.body.copyWith(
                        color: DrenColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: DrenSpacing.md),
                  ElevatedButton(
                    onPressed: () => context.pop(),
                    child: const Text('Search Manually'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onBarcodeDetected(BarcodeCapture capture) {
    if (!_isScanning) return;

    final barcode = capture.barcodes.firstOrNull;
    if (barcode == null || barcode.rawValue == null) return;

    final code = barcode.rawValue!;

    // Prevent scanning the same code repeatedly
    if (code == _lastScannedCode) return;

    _lastScannedCode = code;
    setState(() => _isScanning = false);

    // Trigger barcode search
    context.read<DietBloc>().add(DietEvent.scanBarcode(barcode: code));
  }

  void _showFoodResult(BuildContext context, FoodItem food) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => FoodDetailSheet(
        food: food,
        mealType: widget.mealType ?? _getCurrentMealType(),
        onLog: (loggedFood, servings) {
          context.read<DietBloc>().add(DietEvent.quickLogFood(
                food: loggedFood,
                mealType: widget.mealType ?? _getCurrentMealType(),
                servings: servings,
              ));
          Navigator.pop(sheetContext);
          context.pop(); // Close scanner

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${food.name} added'),
              backgroundColor: DrenColors.success,
            ),
          );
        },
      ),
    ).then((_) {
      // Resume scanning after sheet is closed
      _lastScannedCode = null;
      setState(() => _isScanning = true);
      context.read<DietBloc>().add(const DietEvent.clearSearch());
    });
  }

  String _getCurrentMealType() {
    final hour = DateTime.now().hour;
    if (hour < 11) return 'breakfast';
    if (hour < 15) return 'lunch';
    if (hour < 21) return 'dinner';
    return 'snack';
  }
}

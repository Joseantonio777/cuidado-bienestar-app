import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'sos_modal_sheet.dart';

class SosFab extends StatelessWidget {
  const SosFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.sosRed.withOpacity(0.4),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: FloatingActionButton.extended(
        onPressed: () => SosModalSheet.show(context),
        backgroundColor: AppColors.sosRed,
        foregroundColor: Colors.white,
        elevation: 6,
        icon: const Icon(Icons.sos_rounded, size: 28),
        label: const Text(
          'SOS 505',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

import 'package:bsf/App%20Colors/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isActive;
  final bool isClicked;
  final VoidCallback onPressed;
  final String label;

  const CustomButton({
    super.key,
    required this.isActive,
    required this.isClicked,
    required this.onPressed,
    this.label = "Next",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isActive ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isClicked
                  ? AppColors.customgreycolor
                  : (isActive ? AppColors.redcolor : AppColors.customgreycolor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: AppColors.customgreycolor, width: 1),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(color: AppColors.white, fontSize: 16),
        ),
      ),
    );
  }
}

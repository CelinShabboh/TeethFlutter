import 'package:flutter/material.dart';
import 'package:flutter_app/ui/shared/colors.dart';
import 'package:flutter_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_app/ui/shared/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItem extends StatelessWidget {
  final IconData? icon;

  final bool isSelected;
  final Function onTap;
  final String title;
  NavItem({
    super.key,
    this.icon,
    required this.isSelected,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          //     border: isSelected ? Border.all(color: AppColors.borderColor) : null,
          borderRadius: BorderRadius.circular(20),
          //     color: isSelected ? AppColors.thirdColor : null,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: screenWidth(20),
              ),
              SizedBox(
                height: screenWidth(70),
              ),
              CustomText(
                fontSize: screenWidth(27),
                styleType: TextStyleType.CUSTOM,
                text: title,
                textColor:
                    !isSelected ? AppColors.grayColorTwo : AppColors.blackColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_app/core/translation/app_translation.dart';
// import 'package:flutter_app/ui/shared/colors.dart';
// import 'package:flutter_app/ui/shared/utils.dart';
// import 'package:flutter_app/ui/views/main_view/main_view_widgets/nav_item.dart';

// enum BottomNavigationEnum {
//   HOME,
//   PROFILE,
//   FAVORITE,

//   CART
// }

// class CustomBottmNavigation extends StatefulWidget {
//   final BottomNavigationEnum selectedView;
//   final Function(BottomNavigationEnum, int) onTap;

//   const CustomBottmNavigation(
//       {super.key, required this.selectedView, required this.onTap});
//   @override
//   State<CustomBottmNavigation> createState() => _CustomBottmNavigationState();
// }

// class _CustomBottmNavigationState extends State<CustomBottmNavigation> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: screenWidth(1),
//       height: screenWidth(6),
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(color: AppColors.grayColorTwo, blurRadius: screenWidth(100))
//       ], color: AppColors.backGroundColor),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           NavItem(
//               onTap: () {
//                 widget.onTap(BottomNavigationEnum.HOME, 0);
//               },
//               isSelected: widget.selectedView == BottomNavigationEnum.HOME,
//               title: tr("key_home"),
//               icon: widget.selectedView == BottomNavigationEnum.HOME
//                   ? Icons.home_sharp
//                   : Icons.home_outlined),
//           NavItem(
//               onTap: () {
//                 widget.onTap(BottomNavigationEnum.FAVORITE, 1);
//               },
//               isSelected: widget.selectedView == BottomNavigationEnum.FAVORITE,
//               title: tr("key_favorite"),
//               icon: widget.selectedView == BottomNavigationEnum.FAVORITE
//                   ? Icons.home_sharp
//                   : Icons.home_outlined),
//           NavItem(
//               onTap: () {
//                 widget.onTap(BottomNavigationEnum.CART, 2);
//               },
//               isSelected: widget.selectedView == BottomNavigationEnum.CART,
//               title: tr("key_cart"),
//               icon: widget.selectedView == BottomNavigationEnum.CART
//                   ? Icons.home_sharp
//                   : Icons.home_outlined),
//           NavItem(
//               onTap: () {
//                 widget.onTap(BottomNavigationEnum.PROFILE, 3);
//               },
//               isSelected: widget.selectedView == BottomNavigationEnum.PROFILE,
//               title: tr("key_profile"),
//               icon: widget.selectedView == BottomNavigationEnum.PROFILE
//                   ? Icons.home_sharp
//                   : Icons.home_outlined),
//         ],
//       ),
//     );
//   }
// }

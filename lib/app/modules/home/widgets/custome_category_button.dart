// Widget getTabsMonthly(BuildContext context, TodayViewModel vm) {
//   return SingleChildScrollView(
//     physics: const BouncingScrollPhysics(),
//     scrollDirection: Axis.horizontal,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           getTabsButtonMonthly(
//             title: 'All',
//             isSelected: vm.buttonMonthly1,
//             onPressed: () {
//               vm.monthly1Click();
//               vm.notifyListeners();
//             },
//             context: context,
//           ),
//           const SizedBox(width: 10),
//           getTabsButtonMonthly(
//             title: 'Morning',
//             isSelected: vm.buttonMonthly2,
//             onPressed: () {
//               vm.monthly2Click();
//               vm.notifyListeners();
//             },
//             context: context,
//           ),
//           const SizedBox(width: 10),
//           getTabsButtonMonthly(
//             title: 'Afternoon',
//             isSelected: vm.buttonMonthly3,
//             onPressed: () {
//               vm.monthly3Click();
//               vm.notifyListeners();
//             },
//             context: context,
//           ),
//           const SizedBox(width: 10),
//           getTabsButtonMonthly(
//             title: 'Evening',
//             isSelected: vm.buttonMonthly4,
//             onPressed: () {
//               vm.monthly4Click();
//             },
//             context: context,
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget getTabsButtonMonthly({
//   required BuildContext context,
//   required String title,
//   required bool isSelected,
//   required Function() onPressed,
// }) {
//   return GestureDetector(
//     onTap: onPressed,
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         color: isSelected ? AppColors().primaryColor : AppColors().white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(
//           color: isSelected ? Colors.white : AppColors().lightGreyColor,
//           width: 2,
//         ),
//       ),
//       alignment: Alignment.center,
//       child: Text(
//         title,
//         style: GoogleFonts.montserrat(
//           fontWeight: FontWeight.w500,
//           color: isSelected ? AppColors().white : AppColors().black,
//           fontSize: 16,
//         ),
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/colors.dart';

class CustomCategoryButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final bool? isSelected;

  const CustomCategoryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ?? false ? XColors.xPink[650] :XColors.xPink[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ?? false ? Colors.white : XColors.xPink,
            width: 2,
          ),
        ),
        child: Text(
          title ?? '',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: isSelected ?? false ? XColors.xPink[50]: XColors.xBlack.shade900,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}


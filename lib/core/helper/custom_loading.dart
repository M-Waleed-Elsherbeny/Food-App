// import 'package:e_learning_app/core/assets/app_assets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';

// import 'package:flutter/material.dart';

// Widget customLoading() {
//   return Expanded(
//     child: Center(
//       child: Lottie.asset(
//         AppAssets.loading,
//         width: 150.w,
//         height: 150.h,
//         alignment: Alignment.center,
//         filterQuality: FilterQuality.high,
//       ),
//     ),
//   );
// }

// Future customLoading(BuildContext context) {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Colors.transparent,
//           content: Lottie.asset(AppAssets.loading, width: 100.w, height: 100.h),
//         );
//       });
// }

import 'package:flutter/material.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget customLoading() {
  return Center(
    child: LoadingAnimationWidget.inkDrop(
      color: AppColors.kPrimaryColor,
      size: 50,
    ),
  );
}

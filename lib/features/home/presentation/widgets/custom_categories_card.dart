import 'package:flutter/material.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';

class CustomCategoriesCard extends StatelessWidget {
  const CustomCategoriesCard({super.key, this.title, this.image});
  final String? title, image;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color: Colors.yellowAccent,
        image: DecorationImage(
          image: NetworkImage(
            image ??
                "https://cdni.iconscout.com/illustration/premium/thumb/network-error-illustration-svg-download-png-5966930.png",
          ),
          fit: BoxFit.contain,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: deviceHeight * 0.02,
            left: deviceWidth * 0.03,
            child: CustomText(
              title: title ?? "",
              style: AppTextStyle.font14BlackBold,
            ),
          ),
        ],
      ),
    );
  }
}

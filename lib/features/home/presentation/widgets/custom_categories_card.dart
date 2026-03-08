import 'package:flutter/material.dart';
import 'package:food_app/core/helper/custom_loading.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';

class CustomCategoriesCard extends StatelessWidget {
  const CustomCategoriesCard({
    super.key,
    this.title,
    this.image,
    this.isLoading = false,
  });
  final String? title, image;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.03,
        vertical: deviceHeight * 0.02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.yellowAccent,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: isLoading
                ? customShimmerLoading()
                : Image.network(
                    image ??
                        "https://cdni.iconscout.com/illustration/premium/thumb/network-error-illustration-svg-download-png-5966930.png",
                  ),
          ),
          CustomText(title: title ?? "", style: AppTextStyle.font14BlackBold),
        ],
      ),
    );
  }
}

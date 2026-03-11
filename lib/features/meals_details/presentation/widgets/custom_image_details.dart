import 'package:flutter/material.dart';
import 'package:food_app/core/style/colors/app_colors.dart';

class CustomImageDetails extends StatelessWidget {
  const CustomImageDetails({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Container(
          width: deviceWidth,
          height: deviceHeight * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          width: deviceWidth * 0.1,
          height: deviceHeight * 0.1,
          margin: EdgeInsets.symmetric(horizontal: deviceWidth * 0.03),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: BoxBorder.all(
              color: AppColors.kScaffoldBackgroundColor,
              width: 2,
            ),
          ),
          alignment: Alignment.center,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: deviceWidth * 0.1,
            height: deviceHeight * 0.1,
            margin: EdgeInsets.symmetric(horizontal: deviceWidth * 0.03),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: BoxBorder.all(
                color: AppColors.kScaffoldBackgroundColor,
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_outlined,
                color: AppColors.kErrorColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

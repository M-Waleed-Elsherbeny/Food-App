import 'package:flutter/material.dart';
import 'package:food_app/core/helper/spacer.dart';
import 'package:food_app/core/services/hive_services.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/widgets/custom_text.dart';
import 'package:food_app/features/meals_details/presentation/widgets/custom_area_and_category.dart';
import 'package:hive/hive.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final List<dynamic> box = Hive.box(HiveServices.favoriteBox).values.toList();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: box.isEmpty
          ? Center(child: CustomText(title: "No Favorite Meals"))
          : ListView.builder(
              itemCount: box.length,
              padding: EdgeInsets.symmetric(
                horizontal: deviceWidth * 0.05,
                vertical: deviceHeight * 0.02,
              ),
              itemBuilder: (context, index) {
                return Card(
                  color: AppColors.kScaffoldBackgroundColor,
                  elevation: 10,
                  shadowColor: AppColors.kPrimaryColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth * 0.03,
                      vertical: deviceHeight * 0.01,
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          "box[index].",
                          // "https://img.freepik.com/free-psd/juicy-cheeseburger-gourmet-burger-perfection_632498-25274.jpg",
                          width: deviceWidth * 0.2,
                          height: deviceHeight * 0.1,
                          fit: BoxFit.contain,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: box[index][HiveServices.favoriteBoxTitle],
                            ),
                            heightSpace(deviceHeight * 0.01),
                            CustomAreaAndCategory(
                              area: box[index][HiveServices.favoriteBoxArea],
                              category:
                                  box[index][HiveServices.favoriteBoxCategory],
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Icon(Icons.favorite, color: AppColors.kErrorColor),
                            heightSpace(deviceHeight * 0.01),
                            Icon(Icons.delete, color: AppColors.kErrorColor),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //  ListTile(
                  //   contentPadding: EdgeInsets.all(deviceWidth * 0.02),
                  //   leading: Image.network(
                  //     "https://img.freepik.com/free-psd/juicy-cheeseburger-gourmet-burger-perfection_632498-25274.jpg",
                  //     width: deviceWidth * 0.2,
                  //     height: deviceHeight * 0.1,
                  //     fit: BoxFit.contain,
                  //   ),
                  //   title: CustomText(title: "title"),
                  //   subtitle: CustomAreaAndCategory(
                  //     area: "area",
                  //     category: "category",
                  //   ),
                  //   trailing: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Icon(Icons.favorite, color: AppColors.kErrorColor),
                  //       heightSpace(deviceHeight * 0.01),
                  //       Icon(Icons.delete, color: AppColors.kErrorColor),
                  //     ],
                  //   ),
                  // ),
                );
              },
            ),
    );
  }
}

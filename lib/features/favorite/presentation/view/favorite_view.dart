import 'package:flutter/material.dart';
import 'package:food_app/core/helper/custom_snack_bar.dart';
import 'package:food_app/core/helper/spacer.dart';
import 'package:food_app/core/services/hive_services.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';
import 'package:food_app/features/favorite/data/model/favorite_food_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  late List<FavoriteFoodModel> favorites;
  String userId = Supabase.instance.client.auth.currentUser!.id;
  @override
  void initState() {
    favorites = HiveServices.getFavorites(userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: favorites.isEmpty
          ? Center(child: CustomText(title: "No Favorite Meals"))
          : ListView.builder(
              itemCount: favorites.length,
              padding: EdgeInsets.symmetric(
                horizontal: deviceWidth * 0.03,
                vertical: deviceHeight * 0.02,
              ),
              itemBuilder: (context, index) {
                return SafeArea(
                  child: Card(
                    color: AppColors.kScaffoldBackgroundColor,
                    elevation: 10,
                    shadowColor: AppColors.kPrimaryColor,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            child: Image.network(
                              favorites[index].image,
                              // width: deviceWidth * 0.2,
                              // height: deviceHeight * 0.1,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        widthSpace(deviceWidth * 0.02),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(title: favorites[index].name),
                              heightSpace(deviceHeight * 0.01),
                              Container(
                                height: deviceHeight * 0.03,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 5, right: 10),
                                padding: EdgeInsets.symmetric(
                                  horizontal: deviceWidth * 0.01,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.kPrimaryLightColor.withAlpha(
                                    50,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: CustomText(
                                  title: favorites[index].category
                                      .toUpperCase(),
                                  style: AppTextStyle.font14PrimaryBold
                                      .copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: AppColors.kErrorColor,
                              ),
                              heightSpace(deviceHeight * 0.01),
                              GestureDetector(
                                onTap: () async {
                                  await HiveServices.removeFavorite(
                                    userId,
                                    favorites[index].id,
                                  ).then((_) {
                                    customSnackBar(
                                      context,
                                      "Deleted Successfully",
                                      backgroundColor: AppColors.kSuccessColor,
                                    );
                                    setState(() {});
                                  });
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: AppColors.kErrorColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

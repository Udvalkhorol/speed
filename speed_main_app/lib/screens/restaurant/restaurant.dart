import 'package:flutter/material.dart';
import 'package:speed_app/screens/prod_detail/individualItem.dart';
import 'package:speed_app/widgets/scaffold.dart';
import '../../const/colors.dart';
import '../../utils/helper.dart';
import '../../widgets/appbar.dart';
import '../../widgets/cards.dart';
import '../../widgets/customNavBar.dart';
import '../../widgets/searchBar.dart';
import '../homeScreen/specialRestaur.dart';

class RestaurantScreen extends StatelessWidget {
  static const routeName = "/restaurantScreen";
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: DefaultAppBar(
        actions: [],
        isRemoveLeadingSpace: true,
        title: 'Ресторан',
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Padding(
                //   padding: EdgeInsets.all(10),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       border: Border.all(color: AppColor.blue2),
                //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //     ),
                //     child: SearchBar(
                //       title: "Хайх",
                //       width: double.infinity,
                //       height: 40,
                //     ),
                //   ),
                // ),
                SizedBox(height: 20),
                SizedBox(
                    height: Helper.getScreenHeight(context) * 0.6,
                    width: Helper.getScreenWidth(context),
                    child: Stack(
                      children: [
                        // Container(
                        //   height: double.infinity,
                        //   width: 100,
                        //   decoration: ShapeDecoration(
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.only(
                        //           topRight: Radius.circular(30),
                        //           bottomRight: Radius.circular(30),
                        //         ),
                        //       ),
                        //       color: AppColor.red),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Navigator.pushNamed(context, IndividualItem.routeName);
                                },
                                child: MenuCard(
                                  imageShape: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset(
                                        Helper.getAssetName("hamburger3.jpg", "real"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  name: "Burger King",
                                  count: "12",
                                ),
                              ),
                              SizedBox(height: 20),
                              MenuCard(
                                imageShape: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                      Helper.getAssetName("coffee2.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                name: "Little Sheep",
                                count: "120",
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.of(context).pushNamed(DessertScreen.routeName);
                                },
                                child: MenuCard(
                                  imageShape: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset(
                                        Helper.getAssetName("dessert.jpg", "real"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  name: "Mandakh",
                                  count: "35",
                                ),
                              ),
                              SizedBox(height: 20),
                              MenuCard(
                                imageShape: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                      Helper.getAssetName("western2.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                name: "Namaste",
                                count: "25",
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              restaurant: true,
            ),
          )
        ],
      ),
    );
  }
}

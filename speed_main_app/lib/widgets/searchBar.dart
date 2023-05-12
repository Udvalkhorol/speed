import 'package:flutter/material.dart';
import 'package:speed_app/widgets/lbl.dart';
import '../const/colors.dart';
import '../screens/search/searchScreen.dart';
import '../utils/helper.dart';

class SearchBar extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  SearchBar({@required this.title, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SearchScreen.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: width,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.search),
              SizedBox(width: 5),
              lbl(title, color: AppColor.placeholder, fontSize: 18),
            ],
          ),
          // TextField(
          //   decoration: InputDecoration(
          //     border: InputBorder.none,
          //     prefixIcon: Image.asset(
          //       Helper.getAssetName("search_filled.png", "virtual"),
          //     ),
          //     hintText: title,
          //     hintStyle: TextStyle(
          //       color: AppColor.placeholder,
          //       fontSize: 18,
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}

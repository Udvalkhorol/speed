import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/app_color.dart';

Widget bottomNavBar({int currentIndex = 0}) {
  return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.primary,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      elevation: 10.0,
      onTap: (int _index) {
        // app.bloc?.dashboardBloc?.add(IndexChanged(currentIndex: currentIndex, index: _index));
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: bottomNavBarIconWithText(Icons.home_outlined, 'Нүүр'), activeIcon: bottomNavBarIconWithText(Icons.home_outlined, 'Нүүр', isActive: true), label: 'Нүүр'),
        BottomNavigationBarItem(icon: bottomNavBarIconWithText(Icons.payment_rounded, 'Захиалга'), activeIcon: bottomNavBarIconWithText(Icons.payment_rounded, 'Захиалга', isActive: true), label: 'Захиалга'),
        BottomNavigationBarItem(
            icon: bottomNavBarIconWithText(
              Icons.shopping_cart_outlined, 'Ресторан',
              // count: app.menuCount?.cartCount
            ),
            activeIcon: bottomNavBarIconWithText(
              Icons.shopping_cart_outlined, 'Ресторан', isActive: true,
              // count: app.menuCount?.cartCount
            ),
            label: 'Ресторан'),
        BottomNavigationBarItem(
          icon: bottomNavBarIconWithText(
            Icons.all_inbox, 'Тохиргоо',
            // count: app.menuCount?.orderCount
          ),
          activeIcon: bottomNavBarIconWithText(
            Icons.all_inbox, 'Тохиргоо', isActive: true,
            // count: app.menuCount?.orderCount
          ),
          label: 'Тохиргоо',
        ),
      ]);
}

Widget bottomNavBarIconWithText(IconData icon, String text, {bool isActive = false, int? count}) {
  return Stack(clipBehavior: Clip.none, children: [
    if (isActive)
      Positioned(
        top: 5,
        right: 25,
        child: Container(
            width: 16.0,
            height: 16.0,
            decoration: new BoxDecoration(
              color: AppColor.red,
              shape: BoxShape.circle,
            )),
      ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            icon,
            color: AppColor.primary,
            size: 24,
          ),
        ),
        SizedBox(height: 2.0),
        Text(
          text,
          // style: (fontWeight: FontWeight.w600)
        ),
      ],
    ),
    // if (!Func.isNullEmptyFalseOrZero(count))
    Positioned(
      top: -3,
      right: 20,
      child: Container(
          width: 14.0,
          height: 14.0,
          decoration: new BoxDecoration(
            // color: AppColor.deepOrange10,
            shape: BoxShape.circle,
          ),
          child: Center(
              child: Text(
            '$count',
            // fontSize: gLayout.fontSizeSmall - 3,
            // color: AppColor.white,
          ))),
    ),
  ]);
}

import 'package:flutter/material.dart';
import 'package:speed_app/screens/homeScreen/demandFood.dart';
import 'package:speed_app/screens/order/ui/orderConfirmScreen.dart';
import 'package:speed_app/screens/settings/changeAddressScreen.dart';
import 'package:speed_app/screens/order/ui/orderScreen.dart';
import 'package:speed_app/screens/search/searchScreen.dart';
import 'package:speed_app/screens/settings/ui/settingsScreen.dart';
import 'package:speed_app/screens/shopping_cart/shoppingCartScreen.dart';

import 'screens/splash/spashScreen.dart';
import 'screens/login/loginScreen.dart';
import 'screens/signup/signUpScreen.dart';
import 'screens/forgotPin/forgetPwScreen.dart';
import 'screens/forgotPin/sentOTPScreen.dart';
import 'screens/forgotPin/newPwScreen.dart';
import 'screens/login/introScreen.dart';
import 'screens/homeScreen/homeScreen.dart';
import 'screens/restaurant/restaurant.dart';
import 'screens/settings/moreScreen.dart';
import 'screens/homeScreen/specialRestaur.dart';
import 'screens/settings/profileScreen.dart';
import 'screens/prod_detail/individualItem.dart';
import 'screens/notification/notificationScreen.dart';
import 'screens/settings/aboutScreen.dart';
import 'screens/order/ui/orderScreenDetail.dart';
import './const/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Metropolis",
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColor.red,
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              AppColor.red,
            ),
          ),
        ),
        textTheme: TextTheme(
          headline3: TextStyle(
            color: AppColor.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: AppColor.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          headline5: TextStyle(
            color: AppColor.primary,
            fontWeight: FontWeight.normal,
            fontSize: 25,
          ),
          headline6: TextStyle(
            color: AppColor.primary,
            fontSize: 25,
          ),
          bodyText2: TextStyle(
            color: AppColor.secondary,
          ),
        ),
      ),
      home: SplashScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        ForgetPwScreen.routeName: (context) => ForgetPwScreen(),
        SendOTPScreen.routeName: (context) => SendOTPScreen(),
        NewPwScreen.routeName: (context) => NewPwScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        RestaurantScreen.routeName: (context) => RestaurantScreen(),
        SpecialRes.routeName: (context) => SpecialRes(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        MoreScreen.routeName: (context) => MoreScreen(),
        IndividualItem.routeName: (context) => IndividualItem(),
        NotificationScreen.routeName: (context) => NotificationScreen(),
        AboutScreen.routeName: (context) => AboutScreen(),
        OrderScreen.routeName: (context) => OrderScreen(),
        ChangeAddressScreen.routeName: (context) => ChangeAddressScreen(),
        ShoppingCartScreen.routeName: (context) => ShoppingCartScreen(),
        OrderScreenDetail.routeName: (context) => OrderScreenDetail(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        DemandFood.routeName: (context) => DemandFood(),
        OrderConfirmScreen.routeName: (context) => OrderConfirmScreen(),
      },
    );
  }
}

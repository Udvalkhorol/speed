import 'package:flutter/material.dart';
import 'package:speed_app/global/global.dart';

import '../const/colors.dart';
import 'lbl.dart';
import 'package:http/http.dart' as http;

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final TextEditingController city = TextEditingController();
  final TextEditingController district = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController info = TextEditingController();

  @override
  void dispose() {
    city.dispose();
    district.dispose();
    street.dispose();
    info.dispose();
    super.dispose();
  }

  Future<void> addLocation() async {
    final response = await http.post(
      Uri.parse('http://localhost:8081/addUserLocation?userId=' + Global.userId.toString() + '&city=' + city.text + '&district=' + district.text + '&city=' + city.text + '&street=' + street.text + '&addr_desc=' + info.text),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        showToast(context, 'Амжилттай');
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } else {
      showToast(context, 'Алдаа гарлаа.');
    }
  }

  void showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: AppColor.black,
          ),
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: AppColor.placeholderBg,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: lbl(
        'Хаяг нэмэх',
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center,
        fontSize: 20,
      ),
      content: Container(
        height: 300,
        child: Column(
          children: [
            Container(
              height: 55,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColor.lblPrimary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.5),
                    blurRadius: 1.5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: city,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Хот",
                    hintStyle: const TextStyle(
                      color: AppColor.primary,
                    ),
                    icon: Icon(Icons.location_city),
                    iconColor: AppColor.red,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 55,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColor.lblPrimary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.5),
                    blurRadius: 1.5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: district,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Дүүрэг",
                    hintStyle: const TextStyle(
                      color: AppColor.primary,
                    ),
                    icon: Icon(Icons.location_on),
                    iconColor: AppColor.red,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 55,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColor.lblPrimary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.5),
                    blurRadius: 1.5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: street,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Хороо",
                    hintStyle: const TextStyle(
                      color: AppColor.primary,
                    ),
                    icon: Icon(Icons.location_on),
                    iconColor: AppColor.red,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 55,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColor.lblPrimary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.5),
                    blurRadius: 1.5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: info,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Нэмэлт мэдээлэл",
                    hintStyle: const TextStyle(
                      color: AppColor.primary,
                    ),
                    icon: Icon(Icons.location_on),
                    iconColor: AppColor.red,
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Буцах'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Нэмэх'),
          onPressed: () {
            addLocation();
            // String itemName = _itemController.text;
            // print('Added item: $itemName');
            // Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

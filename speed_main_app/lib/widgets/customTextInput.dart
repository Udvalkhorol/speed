import 'package:flutter/material.dart';
import '../const/colors.dart';

class CustomTextInput extends StatelessWidget {
  CustomTextInput({
    int id,
    String hintText,
    Widget icon,
    EdgeInsets padding = const EdgeInsets.only(left: 40),
    Key key,
  })  : _hintText = hintText,
        _padding = padding,
        _icon = icon,
        _id = id,
        super(key: key);

  final String _hintText;
  final EdgeInsets _padding;
  final Widget _icon;
  final int _id;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          controller: _id == 1 ? nameController : phoneControler,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: _hintText,
            hintStyle: const TextStyle(
              color: AppColor.primary,
            ),
            icon: _icon,
            iconColor: AppColor.red,
          ),
        ),
      ),
    );
  }
}

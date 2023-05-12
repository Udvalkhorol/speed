import 'package:flutter/material.dart';
import 'package:speed_app/widgets/separator.dart';
import '../const/colors.dart';
import 'btn.dart';
import 'lbl.dart';

Widget bottomBtnWithPrice({
  double value,
  VoidCallback onPressed,
  String text,
  isHaveLeading = false,
  // CheckBoxControl control,
}) {
  return Stack(
    children: [
      Container(
        height: 60,
        color: AppColor.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        lbl(
                          'Нийт дүн:',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        lbl(
                          '${value}',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: new BoxConstraints(
                        maxHeight: 36,
                        minWidth: 130,
                      ),
                      child: btn(text: text ?? '', onPressed: onPressed ?? () => {}, radius: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Separator(
        color: AppColor.primary.withOpacity(0.3),
      ),
    ],
  );
}

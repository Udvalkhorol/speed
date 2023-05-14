import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:speed_app/screens/order/ui/orderScreenDetail.dart';
import '../../../const/colors.dart';
import '../../../widgets/lbl.dart';
import '../../../widgets/separator.dart';

class OrderWidget extends StatefulWidget {
  final String orderType;
  final dynamic data;
  final dynamic resList;
  const OrderWidget({this.orderType, this.data, this.resList}) : super();

  @override
  _OrderWidget createState() => _OrderWidget();
}

class _OrderWidget extends State<OrderWidget> {
  bool isDetail = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _blocBuilder(context);
  }

  Widget _blocBuilder(BuildContext context) {
    return (widget.data != null)
        ? Container(
            child: SingleChildScrollView(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
                  return widget.data[index]['status'] == 'NEW'
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                            child: Column(
                              children: [
                                if (index != 1) Separator(color: AppColor.gray),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Theme(
                                        data: theme,
                                        child: ExpansionTile(
                                          title: Row(
                                            children: [
                                              lbl(
                                                widget.data[index]['createdDatetime'],
                                                fontWeight: FontWeight.bold,
                                              ),
                                              SizedBox(width: 10),
                                              lbl(
                                                widget.data[index]['totalPrice'].toString() + '₮',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ],
                                          ),
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  OrderScreenDetail.routeName,
                                                  arguments: {'data': widget.data[index]['items']},
                                                );
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 15),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    lbl(
                                                      'Захиалгын дэлгэрэнгүй',
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    IconButton(
                                                      color: AppColor.red,
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios_rounded,
                                                        size: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                          // ListView.builder(
                                          //   physics: NeverScrollableScrollPhysics(),
                                          //   shrinkWrap: true,
                                          //   scrollDirection: Axis.vertical,
                                          //   itemCount: widget.data[index]['items'].length,
                                          //   itemBuilder: (BuildContext context, int i) {
                                          //     return InkWell(
                                          //       onTap: () {
                                          //         Navigator.pushNamed(
                                          //           context,
                                          //           OrderScreenDetail.routeName,
                                          //           arguments: {'data': widget.data[index]['items']},
                                          //         );
                                          //       },
                                          //       child: Container(
                                          //         child: Padding(
                                          //           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                          //           child: Row(
                                          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //             children: [
                                          //               lbl(
                                          //                 utf8.decode(widget.data[index]['items'][i]['name'].toString().runes.toList()),
                                          //               ),
                                          //               lbl(
                                          //                 widget.data[index]['items'][i]['price'].toString(),
                                          //               ),
                                          //               if (!isDetail)
                                          //                 Column(
                                          //                   children: [
                                          //                     IconButton(
                                          //                       color: AppColor.red,
                                          //                       icon: Icon(
                                          //                         Icons.arrow_forward_ios_rounded,
                                          //                         size: 18,
                                          //                       ),
                                          //                       onPressed: () {},
                                          //                     ),
                                          //                   ],
                                          //                 ),
                                          //             ],
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     );
                                          //   },
                                          // ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                      : Container();
                },
              ),
            ),
          )
        : Center(
            child: lbl('Захиалга байхгүй байна'),
          );
  }
}

import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../widgets/lbl.dart';
import '../../../widgets/separator.dart';
import 'orderScreenDetail.dart';

class OrderHistoryWidget extends StatefulWidget {
  final String orderType;
  final dynamic data;
  final dynamic resList;
  const OrderHistoryWidget({this.orderType, this.data, this.resList}) : super();

  @override
  _OrderHistoryWidget createState() => _OrderHistoryWidget();
}

class _OrderHistoryWidget extends State<OrderHistoryWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _blocBuilder(context);
  }

  Widget _blocBuilder(BuildContext context) {
    return widget.data != null
        ? Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.data.length,
              itemBuilder: (BuildContext context, int index) {
                final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
                return widget.data[index]['status'] == 'success' || widget.data[index]['status'] == 'canceled'
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: Column(
                            children: [
                              // if (index != 0)
                              Separator(color: AppColor.gray),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
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
                                                arguments: {'data': widget.data[index]['items'], 'from': 'history'},
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
                                                  // lbl(widget.data[index]['status'].toString()),
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
                                        // children: [
                                        //   ListView.builder(
                                        //     physics: NeverScrollableScrollPhysics(),
                                        //     shrinkWrap: true,
                                        //     scrollDirection: Axis.vertical,
                                        //     itemCount: widget.data[index]['items'].length,
                                        //     itemBuilder: (BuildContext context, int i) {
                                        //       return InkWell(
                                        //         onTap: () {
                                        //           Navigator.pushNamed(
                                        //             context,
                                        //             OrderScreenDetail.routeName,
                                        //             arguments: {'data': widget.data[index]['items'], 'from': 'history'},
                                        //           );
                                        //         },
                                        //         child: Container(
                                        //           child: Padding(
                                        //             padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                        //             child: Row(
                                        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //               children: [
                                        //                 lbl(
                                        //                   utf8.decode(widget.data[index]['items'][i]['name'].toString().runes.toList()),
                                        //                 ),
                                        //                 lbl(
                                        //                   widget.data[index]['items'][i]['price'].toString(),
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       );
                                        //     },
                                        //   ),
                                        // ],
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
          )
        : Center(
            child: lbl('Захиалга байхгүй байна'),
          );
  }
}

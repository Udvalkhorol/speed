import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:speed_app/screens/order/ui/orderScreenDetail.dart';
import '../../../const/colors.dart';
import '../../../widgets/lbl.dart';
import '../../../widgets/separator.dart';

class OrderWidget extends StatefulWidget {
  final String orderType;
  final dynamic data;
  const OrderWidget({this.orderType, this.data}) : super();

  @override
  _OrderWidget createState() => _OrderWidget();
}

class _OrderWidget extends State<OrderWidget> {
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
                                if (index != 0) Separator(color: AppColor.gray),
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
                                            ListView.builder(
                                              physics: NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: widget.data[index]['items'].length,
                                              itemBuilder: (BuildContext context, int i) {
                                                return InkWell(
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                      context,
                                                      OrderScreenDetail.routeName,
                                                      arguments: {'data': widget.data[index]['items']},
                                                    );
                                                  },
                                                  child: Container(
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          lbl(
                                                            utf8.decode(widget.data[index]['items'][i]['name'].toString().runes.toList()),
                                                          ),
                                                          lbl(
                                                            widget.data[index]['items'][i]['price'].toString(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
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

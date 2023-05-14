import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speed_app/widgets/lbl.dart';
import 'package:speed_app/widgets/scaffold.dart';
import 'package:speed_app/widgets/separator.dart';
import '../../const/colors.dart';
import '../../widgets/appbar.dart';
import '../prod_detail/prodDetailScreen.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/searchScreen";

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<dynamic> filteredItem = <dynamic>[];
  bool isFirst = true;

  @override
  initState() {
    super.initState();
    filteredItem = [];
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    final food = args['food'];
    if (isFirst) {
      filteredItem = food;
      isFirst = false;
    }

    void _onSearchTextChanged(String query) {
      setState(() {
        filteredItem = [];
        for (int i = 0; i < food.length; i++) {
          if (utf8.decode(food[i]['name'].runes.toList()).toLowerCase().contains(query.toLowerCase())) {
            filteredItem.add(food[i]);
          }
        }
      });
    }

    return DefaultScaffold(
      appBar: DefaultAppBar(
        isRemoveLeadingSpace: false,
        title: "Хайх",
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: TextField(
                onChanged: _onSearchTextChanged,
                decoration: InputDecoration(
                  labelText: 'Хайх',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          filteredItem != null
              ? Expanded(
                  child: ListView.builder(
                      itemCount: filteredItem.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  ProdDetailScreen.routeName,
                                  arguments: {'food': food[index]},
                                );
                              },
                              child: ListTile(
                                title: Text(
                                  utf8.decode(filteredItem[index]['name'].runes.toList()),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Separator(
                                color: AppColor.primary.withOpacity(0.3),
                              ),
                            ),
                          ],
                        );
                      }),
                )
              : Container(
                  child: Center(
                    child: lbl('Хайлт илэрсэнгүй'),
                  ),
                ),
        ],
      ),
    );
  }
}

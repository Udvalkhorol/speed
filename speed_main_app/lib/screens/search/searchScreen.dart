import 'package:flutter/material.dart';
import 'package:speed_app/widgets/scaffold.dart';

import '../../const/colors.dart';
import '../../widgets/appbar.dart';
import '../../widgets/searchBar.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/searchScreen";

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = '';
  List<String> _data = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ]; // List of data to search

  List<String> _filteredData = []; // Filtered data based on search query

  void _updateFilteredData(String query) {
    setState(() {
      _query = query;
      _filteredData = _data.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  String _searchQuery = '';

  void _onSearchTextChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
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

          /// category nemeh
          Expanded(
            child: ListView.builder(
              itemCount: _searchQuery.isEmpty ? 0 : 10, // Placeholder for search results
              itemBuilder: (context, index) => ListTile(
                title: Text('Search Result $index'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

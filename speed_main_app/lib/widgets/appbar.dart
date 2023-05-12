import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
import 'lbl.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final Widget tab;
  final Widget leading;
  final Widget customTitle;
  final bool isRemoveLeadingSpace;

  DefaultAppBar({
    this.title,
    this.actions,
    this.tab,
    this.leading,
    this.customTitle,
    this.isRemoveLeadingSpace = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (tab != null ? kToolbarHeight : 1.0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      brightness: Brightness.light,
      title: customTitle ??
          (title == null
              ? lbl('')
              // ? Image.asset(
              //     Helper.getAssetName("cart.png", "virtual"),
              //     // Img.appIconHorizontal,
              //     // height: gLayout.calcSize(25)
              //   )
              : lbl(
                  title?.toUpperCase(),
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),
      flexibleSpace: Container(
        decoration: const BoxDecoration(color: AppColor.white),
      ),
      leading: isRemoveLeadingSpace ? null : leading ?? BackButton(color: AppColor.primary),
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      bottom: PreferredSize(
        child: Column(
          children: <Widget>[
            Container(
              height: 1.0,
            ),
            tab ?? Container(),
          ],
        ),
        preferredSize: Size.fromHeight(tab != null ? kToolbarHeight : 1.0),
      ),
    );
  }
}

class SearchAppBar extends StatefulWidget with PreferredSizeWidget {
  final String title;
  final Iterable<Widget> actions;
  final Widget tab;
  final Widget leading;
  final Widget customTitle;
  // final AppBloc bloc;

  SearchAppBar({
    this.title,
    this.actions,
    this.tab,
    this.leading,
    this.customTitle,
    // required this.bloc,
  });

  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (tab != null ? kToolbarHeight : 1.0)); //Size.fromHeight(tab != null ? kToolbarHeight : 1.0);
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _searching = true;
  // late TextBoxControl _txtSearch;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    // _txtSearch = TextBoxControl()
    //   ..autofocus = true // todo
    //   ..id = 'Search'
    //   ..widget = TextBoxSearchWidget.widget
    //   ..hint = gLoc!.search()
    //   ..suffixClearText = true
    //   ..relatedBlocs = [widget.bloc]
    //   ..enabledBorder = OutlineInputBorder(borderSide: const BorderSide(color: AppColor.blue2), borderRadius: BorderRadius.circular(8), gapPadding: 0.0)
    //   ..focusedBorder = OutlineInputBorder(borderSide: const BorderSide(color: AppColor.blue2), borderRadius: BorderRadius.circular(8), gapPadding: 0.0)
    //   ..controllerListener = TextBoxWidget.changeListener
    //   ..focusListener = TextBoxWidget.focusListener
    //   ..textStyle = TextStyle(color: AppColor.blue2)
    //   ..prefixIcon = Icon(
    //     Icons.search,
    //     size: 24,
    //     color: AppColor.blue2,
    //   );
  }

  @override
  Widget build(BuildContext context) {
    // log.d('$runtimeType build');
    var b = AppBar(
      ///
      titleSpacing: 0,
      automaticallyImplyLeading: true,
      elevation: 0,
      centerTitle: true,
      // brightness: Brightness.dark,
      // backgroundColor: Colors.black,

      ///
      leading: widget.leading ?? BackButton(color: AppColor.lblPrimary),
      // title: SearchBar(
      //   isSearching: _searching, search: ,
      //   // title: widget.customTitle ??
      //   //     (widget.title == null
      //   //         ? Image.asset(
      //   //       Img.appIconHorizontal,
      //   //       height: gLayout.calcSize(25),
      //   //     )
      //   //         : lbl(
      //   //       widget.title,
      //   //       color: gColor!.lblTitle,
      //   //       fontSize: 15,
      //   //       fontWeight: FontWeight.bold,
      //   //     )),
      //   // search: Padding(padding: const EdgeInsets.only(left: 5.0), child: TextBox(_txtSearch)),
      // ),
      actions: []..addAll(widget.actions),

      ///
      // flexibleSpace: Container(decoration: BoxDecoration(gradient: gColor?.appBar)),
      bottom: PreferredSize(
        child: Column(
          children: <Widget>[
            Container(
              height: 1.0,
            ),
            widget.tab ?? Container(),
          ],
        ),
        preferredSize: Size.fromHeight(widget.tab != null ? kToolbarHeight : 1.0),
      ),
    );
    return b;
  }

  @override
  void dispose() {
    // _txtSearch.dispose();
    super.dispose();
  }
}

// class SearchBar extends StatelessWidget {
//   final bool isSearching;
//   final Widget title;
//   final Widget search;
//
//   SearchBar({this.isSearching, this.title, this.search});
//
//   @override
//   Widget build(BuildContext context) {
//     return search;
//   }
// }

class RefreshableAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final Widget tab;
  final Widget leading;
  final Widget customTitle;
  final bool isRemoveLeadingSpace;

  RefreshableAppBar({
    this.title,
    this.actions,
    this.tab,
    this.leading,
    this.customTitle,
    this.isRemoveLeadingSpace = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (tab != null ? kToolbarHeight : 1.0)); //Size.fromHeight(tab != null ? kToolbarHeight : 1.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      brightness: Brightness.light,
      // title: customTitle ??
      //     (title == null
      //         ? Image.asset(Img.appIconHorizontal, height: gLayout.calcSize(25))
      //         : marquee(lbl(
      //             title?.toUpperCase(),
      //             color: gColor?.lblTitle,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 15,
      //           ))),
      flexibleSpace: Container(
          // decoration: BoxDecoration(gradient: gColor?.appBar),
          ),
      leading: isRemoveLeadingSpace
          ? null
          : leading ??
              // BackButton(color: gColor.lblTitle),
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.lblPrimary,
                ),
                onPressed: () => {
                  // app.bloc?.dashboardMerchBloc.add(GetMenuCount()),
                  Navigator.pop(context),
                },
              ),
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      bottom: PreferredSize(
        child: Column(
          children: <Widget>[
            Container(
              height: 1.0,
            ),
            tab ?? Container(),
          ],
        ),
        preferredSize: Size.fromHeight(tab != null ? kToolbarHeight : 1.0),
      ),
    );
  }
}

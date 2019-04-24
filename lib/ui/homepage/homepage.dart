import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:secozy/bloc/authentication/authentication.dart';
import 'package:secozy/bloc/authentication/authentication_bloc.dart';
import 'package:secozy/bloc/tabs/tab.dart';
import 'package:secozy/ui/homepage/tab_selector.dart';
import 'package:secozy/ui/page_one.dart';
import 'package:secozy/ui/page_two.dart';

class Homepage extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;

  Homepage(this.authenticationBloc);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  AuthenticationBloc _authenticationBloc;
  TabBloc _tabBloc;
  var bottomNavigationBarItems;
  final bottomNavigationItems = [
    new BottomNavigationItem("Dashboard", MdiIcons.accountAlert),
    new BottomNavigationItem("Bookmarked", MdiIcons.bookmark),
  ];

  @override
  void initState() {
    super.initState();
    _authenticationBloc = widget.authenticationBloc;
    _tabBloc = BlocProvider.of<TabBloc>(context);
  }

  @override
  void dispose() {
    _authenticationBloc?.dispose();
    _tabBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return BlocBuilder<TabEvent, TabState>(
        bloc: _tabBloc,
        builder: (BuildContext context, TabState state) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Image.asset('images/secozy.png',
                  fit: BoxFit.cover, width: 120.0),
              actions: <Widget>[
                new IconButton(
                    icon: new Icon(MdiIcons.logoutVariant),
                    onPressed: () => _authenticationBloc.dispatch(LoggedOut())),
              ],
            ),
            body: _getDrawerItemWidget(state is TabChangeIndex ? state.index : 0),
            bottomNavigationBar: TabSelector(
              activeIndex: state is TabChangeIndex ? state.index : 0,
              onTabSelected: (int index) =>
                  _tabBloc.dispatch(TabIndexPressed(index: index)),
            ),
          );
        });
  }

  Widget _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new PageOne();
      case 1:
        return new PageTwo();
      default:
        return new Text("Error");
    }
  }
}

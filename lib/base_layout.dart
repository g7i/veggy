import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:veggy/configs/configs.dart';
import 'package:veggy/tabScreens/tab_screens.dart';

class BaseLayout extends StatefulWidget {
  @override
  _BaseLayoutState createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  int _currentIndex = 0;
  Color _selectedColor = Color(0xff53b276), _unselectedColor = Colors.black54;
  DateTime _firstBackPressTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          left: 5.0,
          right: 5.0,
        ),
        child: Text(
          "Under Construction",
          style: TextStyle(
            color: AppTheme.myGreen,
            fontSize: 10.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: WillPopScope(
        onWillPop: _exitOnDoubleBack,
        child: SafeArea(
          child: IndexedStack(
            index: _currentIndex,
            children: [
              TabHome(),
              TabShop(),
              TabOrders(),
              TabAccount(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: _unselectedColor,
        selectedItemColor: _selectedColor,
        showUnselectedLabels: true,
        onTap: updateIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              "Home",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store,
            ),
            title: Text(
              "Shop",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            title: Text(
              "Orders",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text(
              "Account",
            ),
          ),
        ],
      ),
    );
  }

  void updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<bool> _exitOnDoubleBack() {
    DateTime now = DateTime.now();
    if (_firstBackPressTime == null ||
        now.difference(_firstBackPressTime) > Duration(seconds: 2)) {
      setState(() {
        _firstBackPressTime = now;
      });
      ;
      Fluttertoast.showToast(
        msg: "Press back again to exit",
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}

import 'package:flutter/material.dart';

class MySearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      child: TextField(
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: "Search here",
          hintStyle: TextStyle(
            color: Colors.black26,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          fillColor: Color(0xFFf5f5f5),
          filled: true,
          contentPadding: EdgeInsets.only(
            left: 10.0,
          ),
          prefixIcon: Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}

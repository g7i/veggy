import 'package:flutter/material.dart';
import 'package:veggy/components/components.dart';
import 'package:veggy/configs/configs.dart';

class HomeSearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: AppTheme.myGreen,
            height: 100.0,
          ),
          Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MySearchBox(),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    margin: EdgeInsets.only(
                      left: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.myGreen,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Icon(
                      Icons.equalizer,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

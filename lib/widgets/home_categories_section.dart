import 'package:flutter/material.dart';
import 'package:veggy/repository/repository.dart';

class HomeCategoriesSection extends StatelessWidget {
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 100.0,
  );
  final List<Categories> categories;

  HomeCategoriesSection({Key key, @required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(100.0);
      _scrollController.animateTo(
        0.0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
    return Container(
      height: 75.0,
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (ctx, i) {
          return Column(
            children: [
              Container(
                width: 70.0,
                height: 50.0,
                padding: EdgeInsets.all(13.0),
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                decoration: BoxDecoration(
                    color: Color(int.parse(categories[i].color)),
                    shape: BoxShape.circle),
                child: Image.asset(
                  categories[i].image,
                  fit: BoxFit.contain,
                ),
              ),
              Spacer(),
              Text(
                categories[i].title,
                style: TextStyle(fontSize: 14.0, color: Colors.black87),
              ),
            ],
          );
        },
      ),
    );
  }
}

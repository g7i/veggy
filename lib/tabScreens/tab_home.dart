import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:veggy/components/components.dart';
import 'package:veggy/configs/configs.dart';
import 'package:veggy/repository/repository.dart';
import 'package:veggy/widgets/home_categories_section.dart';
import 'package:veggy/widgets/home_featured_section.dart';
import 'package:veggy/widgets/home_search_section.dart';
import 'package:veggy/widgets/widgets.dart';

class TabHome extends StatelessWidget {
  final List<Categories> categories = Categories.getAllCategories();
  final List<FeaturedItems> featuredItems = FeaturedItems.getAllItems();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MyAppBar.sliverAppBar,
        SliverToBoxAdapter(
          child: HomeSearchSection(),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            top: 10.0,
            left: 20.0,
            right: 20.0,
          ),
          sliver: SliverToBoxAdapter(
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (ctx, i) => HomeOrderTimelineSection(
                orderTitle: "MyOrder-7$i",
                deliveryStatus: i == 1
                    ? DeliveryStatus.Processing
                    : DeliveryStatus.Delivery,
              ),
              separatorBuilder: (ctx, i) => SizedBox(
                height: 25.0,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            top: 25.0,
          ),
          sliver: SliverToBoxAdapter(
            child: HomeCategoriesSection(categories: categories),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            left: 20.0,
            top: 25.0,
          ),
          sliver: SliverToBoxAdapter(
            child: Text(
              "Featured Products",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 30.0),
          sliver: HomeFeaturedSection(featuredItems: featuredItems),
        ),
      ],
    );
  }
}

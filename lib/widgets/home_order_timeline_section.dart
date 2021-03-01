import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:veggy/configs/configs.dart';

const currentSteps = [
  'Placing',
  'Processing',
  'Delivering',
];

const doneSteps = [
  'Placed',
  'Processed',
  'Delivered',
];

class HomeOrderTimelineSection extends StatefulWidget {
  final DeliveryStatus deliveryStatus;
  final String orderTitle;

  const HomeOrderTimelineSection(
      {Key key, @required this.deliveryStatus, @required this.orderTitle})
      : super(key: key);

  @override
  _HomeOrderTimelineSectionState createState() =>
      _HomeOrderTimelineSectionState();
}

class _HomeOrderTimelineSectionState extends State<HomeOrderTimelineSection> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: 40.0,
    );
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _scrollController.jumpTo(currentStep * 120.0);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 80.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 18.0,
            ),
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                text: "Order Status: ",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: widget.orderTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              controller: _scrollController,
              physics: NeverScrollableScrollPhysics(),
              itemExtent: 150.0,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: currentSteps.length,
              itemBuilder: (BuildContext context, int index) {
                final step = widget.deliveryStatus.index > index
                    ? doneSteps[index]
                    : currentSteps[index];
                var indicatorSize = 25.0;
                var beforeLineStyle = LineStyle(
                  color: AppTheme.myGreen.withOpacity(0.8),
                );
                _DeliveryStatus status;
                LineStyle afterLineStyle;
                if (index < widget.deliveryStatus.index) {
                  status = _DeliveryStatus.done;
                } else if (index > widget.deliveryStatus.index) {
                  status = _DeliveryStatus.todo;
                  indicatorSize = 20;
                  beforeLineStyle = const LineStyle(color: Color(0xFF747888));
                } else {
                  afterLineStyle = const LineStyle(color: Color(0xFF747888));
                  status = _DeliveryStatus.doing;
                }

                return TimelineTile(
                  axis: TimelineAxis.horizontal,
                  alignment: TimelineAlign.center,
                  isFirst: index == 0,
                  isLast: index == currentSteps.length - 1,
                  beforeLineStyle: beforeLineStyle,
                  afterLineStyle: afterLineStyle,
                  indicatorStyle: IndicatorStyle(
                    width: indicatorSize,
                    height: indicatorSize,
                    indicator: _IndicatorDelivery(status: status),
                  ),
                  endChild: _EndChildDelivery(
                    text: step,
                    currentIndex: index,
                    currentStep: widget.deliveryStatus.index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

enum _DeliveryStatus { done, doing, todo }

class _EndChildDelivery extends StatelessWidget {
  const _EndChildDelivery({
    Key key,
    @required this.text,
    @required this.currentIndex,
    @required this.currentStep,
  }) : super(key: key);

  final String text;
  final int currentIndex, currentStep;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: currentIndex > currentStep
                    ? Color(0xFF747888)
                    : AppTheme.myGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IndicatorDelivery extends StatelessWidget {
  const _IndicatorDelivery({Key key, this.status}) : super(key: key);

  final _DeliveryStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case _DeliveryStatus.done:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff53b276),
          ),
          child: const Center(
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 20.0,
            ),
          ),
        );
      case _DeliveryStatus.doing:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff53b276),
          ),
          child: const Center(
            child: SizedBox(
              height: 12,
              width: 12,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        );
      case _DeliveryStatus.todo:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF747888),
          ),
          child: Center(
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        );
    }
    return Container();
  }
}

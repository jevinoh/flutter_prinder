import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_prinder/entities/entities.dart';
import 'package:flutter_prinder/presentation/current_image_indicator.dart';
import 'package:flutter_prinder/utils/formatters.dart';

class SwipeCard extends StatefulWidget {
  SwipeCard({
    Key key,
    @required this.profile,
    this.initialImageIndex: 0,
    this.onNextImage,
    this.onPreviousImage,
    this.onSeeDetails,
  }) : assert(initialImageIndex >= 0),
       assert(initialImageIndex < profile.length || initialImageIndex == 0),
       super(key: key);

  final List<PrinterEntity> profile;
  final int initialImageIndex;
  final ValueChanged<int> onNextImage;
  final ValueChanged<int> onPreviousImage;
  final VoidCallback onSeeDetails;

  @override
  _SwipeCardState createState() => new _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  int currentImageIndex;

  @override
  void initState() {
    super.initState();
    currentImageIndex = widget.initialImageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4.0,
            spreadRadius: 2.0,
            offset: new Offset(0.5, 2.0)
          )
        ],
        image: new DecorationImage(
          fit: BoxFit.contain,
          image: widget.profile.length > 0
            ? new NetworkImage(widget.profile[currentImageIndex].image)
            : new AssetImage('images/empty.jpg')
        ),
      ),
      child: new Column(
        children: <Widget>[
          new Expanded(
            child: new GestureDetector(
              onTapUp: onChangeImage,
              child: new Container(
                alignment: Alignment.topCenter,
                color: Colors.transparent,
                padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: new CurrentImageIndicator(
                  size: widget.profile.length,
                  activeIndex: currentImageIndex,
                ),
              ),
            ),
          ),
          new GestureDetector(
            onTap: onSeeDetails,
            child: _buildDescription()
          )
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return new Container(
      height: 100.0,
      padding: new EdgeInsets.all(20.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.only(
          bottomLeft: new Radius.circular(10.0),
          bottomRight: new Radius.circular(10.0),
        ),
        gradient: new LinearGradient(
          begin: new Alignment(0.5, 0.0),
          end: new Alignment(0.5, 1.0),
          colors: <Color>[
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ]
        )
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: new Text(
                makePrinterPresentationName(widget.profile[currentImageIndex]),
                style: new TextStyle(
                  fontSize: 30.0,
                  color: Colors.white
                ),
                overflow: TextOverflow.fade,
                maxLines: 1,
                )
              )
            ],
          ),
          new Icon(
            Icons.info,
            color: Colors.white,
            size: 40.0,
          )
        ],
      ),
    );
  }

  void onChangeImage(TapUpDetails details) {
    if (details.globalPosition.dx < context.size.width / 2) {
      if (currentImageIndex > 0) {
        setState(() => currentImageIndex--);
        if (widget.onPreviousImage != null)
          widget.onPreviousImage(currentImageIndex);
      }
    } else {
      if (currentImageIndex < widget.profile.length - 1) {
        setState(() => currentImageIndex++);
        if (widget.onNextImage != null)
          widget.onNextImage(currentImageIndex);
      }
    }
  }

  void onSeeDetails() {
    if (widget.onSeeDetails != null)
      widget.onSeeDetails();
  }

}

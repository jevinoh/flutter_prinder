import 'package:flutter/material.dart';


class MoreInfo extends StatelessWidget {
  MoreInfo({
    Key key,
    this.model,
    this.description,
    this.status,
    this.imageUrl,
    this.location,
  }) : super(key: key);

  final String model;
  final String status;
  final String description;
  final String imageUrl;
  final int location;

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width / 3;
    return new Container(

      child: new Row(
        children: <Widget>[
          /*
          new Container(
            height: imageSize,
            width: imageSize,
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                image: new DecorationImage(
                    image: new NetworkImage(imageUrl)
                )
            ),

          ),

*/

          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                new Padding(
                  padding: new EdgeInsets.only(bottom: 10.0),
                  child: new Text(
                    "Model: " + model,
                    style: new TextStyle(
                        color: Colors.black45,
                        fontSize: 20.0
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(bottom: 10.0),
                  child: new Text(
                    "Distance: " + location.toString() + " km",
                    style: new TextStyle(
                        color: Colors.black45,
                        fontSize: 20.0
                    ),
                  ),
                ),

                new Padding(
                  padding: new EdgeInsets.only(bottom: 10.0),
                  child: new Text(
                    "Info: " +description,
                    style: new TextStyle(
                        color: Colors.black45,
                        fontSize: 20.0
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(bottom: 10.0),
                  child: new Text(
                    "Status: " +status,
                    style: new TextStyle(
                        color: Colors.black45,
                        fontSize: 20.0
                    ),
                  ),
                ),
                /*
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(right: 5.0),
                      child: new Icon(
                        Icons.thumb_up,
                        color: Colors.greenAccent[700],
                      ),
                    ),
                    new Text(
                      "Status: " + status,
                      style: new TextStyle(
                        color: Colors.black45,
                        fontSize: 18.0
                      ),
                    )
                  ],
                )*/
              ],
            ),
          ),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'rounded_button_icon.dart';

class SearchActions extends StatelessWidget {
  SearchActions({
    Key key,
    this.onRefreshed,
    this.onUploadFile,
  }) : super(key: key);

  final VoidCallback onRefreshed;
  final VoidCallback onUploadFile;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Container(
            width: 80.0,
            height: 80.0,
            child: new Center(
              child: new RoundedButtonIcon(
                icon: Icons.refresh,
                iconSize: 60.0,
                padding: 20.0,
                activeResizeFactor: 0.9,
                color: Colors.white,
                iconColor: Colors.yellow[700],
                iconDisabledColor: Colors.black12,
                onPressed: onRefreshed,
              )
            )
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            child: new Center(
              child: new RoundedButtonIcon(
                icon: Icons.file_upload,
                iconSize: 60.0,
                padding: 20.0,
                activeResizeFactor: 0.9,
                color: Colors.white,
                iconColor: Colors.redAccent,
                iconDisabledColor: Colors.black12,
                onPressed: onUploadFile,
              )
            )
          ),
        ]
      )
    );
  }
}

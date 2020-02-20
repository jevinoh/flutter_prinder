import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_prinder/models/models.dart';
import 'package:flutter_prinder/presentation/profile_card.dart';
import 'package:flutter_prinder/selectors/selectors.dart';
import 'package:flutter_prinder/presentation/rounded_button_icon.dart';
import 'package:flutter_prinder/presentation/more_info.dart';
import 'package:flutter_prinder/entities/entities.dart';

class DetailedInfo extends StatelessWidget {

  final PrinterEntity profile;
  DetailedInfo({Key key,
    @required this.profile,
}): super(key: key);


  void closePage(BuildContext context) {
    //String textToSendBack = textFieldController.text;
    Navigator.pop(context, "test");
  }

  @override
  Widget build(BuildContext context) {
    double imageSizes = MediaQuery.of(context).size.width / 3;
    return new StoreConnector<AppState, ViewModel>(
        converter: ViewModel.fromStore,
        builder: (context, vm) {

          return new ProfileCard(
              children: <Widget>[

                new Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: new Hero(
                    tag: '',
                    child: new Container(
                      height: 200,
                      width: 200,
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                          image: new DecorationImage(
                              image: new NetworkImage(profile.image)
                          )
                      ),
                    ),
                  ),
                ),


                new Padding(
                    child: new Text(
                      profile.id,
                      style: new TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 30.0
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20.0)
                ),

                new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: new Table(
                      children: <TableRow>[
                        new TableRow(
                            children: <Widget>[
                              new Container(
                                decoration: new BoxDecoration(
                                    border: new BorderDirectional(
                                        end: new BorderSide(
                                          color: Colors.black12,
                                          width: 1.0,
                                        )
                                    )
                                ),

                              ),
                            ]
                        )
                      ],
                    )
                ),

                new Padding(
                  padding: new EdgeInsets.symmetric(vertical: 10.0),
                  child: new MoreInfo(
                      model: profile.name,
                      status: profile.status,
                      description: profile.description,
                      imageUrl: profile.image,
                      location: profile.distance,
                  ),

                ),
                new Padding(
                  padding: new EdgeInsets.symmetric(vertical: 60.0),
                  child: new RoundedButtonIcon(
                      icon: Icons.arrow_back ,
                      activeColor: Colors.redAccent,
                      iconActiveColor: Colors.red,
                      onPressed: () => {
                        closePage(context)
                      }
                  ),

                ),


                // _buildOverlayEditInfoButton(context)

              ]
          );
        }
    );
  }
}


class ViewModel {
  ViewModel(
      this.presentationName,
      this.selectedImageUrl,
      this.selectedImageIndex,
      );

  static ViewModel fromStore(Store<AppState> store) =>
      new ViewModel(
        userPresentationNameSelector(store),
        userSelectedImageUrlSelector(store),
        userSelectedImageIndexSelector(store),
      );

  final String presentationName;
  final String selectedImageUrl;
  final int selectedImageIndex;

  onNavigateToDetails(BuildContext context) =>
          () => Navigator.pushNamed(context, '/user-profile-details');
}

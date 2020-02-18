import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_prinder/entities/entities.dart';
import 'package:flutter_prinder/models/models.dart';
import 'package:flutter_prinder/selectors/selectors.dart';
import 'package:flutter_prinder/presentation/search_actions.dart';
import 'package:flutter_prinder/containers/swipe_strangers.dart';
import 'package:flutter_prinder/presentation/image_radar.dart';
import 'package:flutter_prinder/observers/search_observer.dart';
import 'package:flutter_prinder/services/services.dart';
import 'package:flutter_prinder/actions/strangers.dart';


class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title, this.store}) : super(key: key);

  final String title;
  final Store<AppState> store;
  @override
  State<StatefulWidget> createState() => SearchPageState();
}


class SearchPageState extends State<SearchPage> implements SearchObserverStateListener {
  SearchObserverProvider searchObserver;

  SearchPageState() {
    searchObserver = new SearchObserverProvider();
    searchObserver.subscribe(this);
  }

  @override
  onStateChanged(ObserverState state) {
    //Do something when you detected a change
    if (state == ObserverState.REBUILD) {
      rebuild();
    }
  }

  @override
  Widget build(BuildContext context) {
    double imageRadarSize = MediaQuery.of(context).size.width / 4;
    return new StoreConnector<AppState, ViewModel>(
      converter: ViewModel.fromStore,
      builder: (context, vm) {
        return new Column(
          children: <Widget>[
            new Expanded(
              child: vm.hasStrangers
                ? new Padding(
                    padding: new EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                    child: new SwipeStrangers()
                  )
                : new ImageRadar(
                    diameter: imageRadarSize,
                    image: vm.userFirstImageUrl == ''
                      ? new AssetImage('images/empty.jpg')
                      : new NetworkImage(vm.userFirstImageUrl)
                  )
            ),
            new SearchActions(
              onRefreshed: vm.onRefreshed,
              onNopePressed: vm.onNopePressed,
              onSuperLikePressed: vm.onSuperLikePressed,
              onLikePressed: vm.onLikePressed,
              onBoostPressed: vm.onBoostPressed,
            )
          ],
        );
      }
    );
  }

  void rebuild() async {
    //searchObserver.dispose(this);
    try {
      List<UserEntity> users = await UsersService.loadStrangers();

      widget.store.dispatch(new LoadStrangersSuccessAction(users));
    } catch (error) {
      widget.store.dispatch(new LoadStrangersFailAction(error.message));
    }

    didUpdateWidget(widget);
    //setState(() {});
  }
//
//  @override
//  void didUpdateWidget(SearchPage oldWidget) {
//    if(oldWidget._start != widget.start || oldWidget._end != widg.end) {
//
//    }
//  }
}

class ViewModel {
  ViewModel({
    this.userFirstImageUrl,
    this.hasStrangers,
    this.onRefreshed,
    this.onNopePressed,
    this.onSuperLikePressed,
    this.onLikePressed,
    this.onBoostPressed,
  });

  static ViewModel fromStore(Store<AppState> store) {
    return new ViewModel(
      userFirstImageUrl: userFirstImageUrlSelector(store),
      hasStrangers: hasStrangersSelector(store),
      onRefreshed: () => print('refresh'),
      onNopePressed: () => print('nope'),
      onSuperLikePressed: () => print('super like'),
      onLikePressed: () => print('like'),
      onBoostPressed: () => print('boost'),
    );
  }

  final String userFirstImageUrl;
  final bool hasStrangers;
  final VoidCallback onRefreshed;
  final VoidCallback onNopePressed;
  final VoidCallback onSuperLikePressed;
  final VoidCallback onLikePressed;
  final VoidCallback onBoostPressed;
}

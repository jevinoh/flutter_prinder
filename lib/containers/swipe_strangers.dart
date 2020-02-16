import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_prinder/entities/entities.dart';
import 'package:flutter_prinder/models/models.dart';
import 'package:flutter_prinder/presentation/swipe_card.dart';
import 'package:flutter_prinder/selectors/selectors.dart';

class SwipeStrangers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ViewModel>(
      converter: ViewModel.fromStore,
      builder: (context, vm) {
        return vm.strangers.length > 0
          ? SwipeCard(
              profile: vm.strangers[0],
              initialImageIndex: vm.currentImageIndex,
              onNextImage: vm.onNextImage,
              onPreviousImage: vm.onPreviousImage,
              onSeeDetails: vm.onSeeDetails,
            )
          : new Container();
      },
    );
  }
}

class ViewModel {
  ViewModel({
    this.strangers,
    this.onNextImage,
    this.onPreviousImage,
    this.onSeeDetails,
  });

  static ViewModel fromStore(Store<AppState> store) {
    return new ViewModel(
      strangers: strangersSelector(store).strangers,
      onNextImage: (imageIndex) => print('currentImageIndex: $imageIndex'),
      onPreviousImage: (imageIndex) => print('currentImageIndex: $imageIndex'),
      onSeeDetails: () => print('See Details')
    );
  }

  int currentImageIndex = 0;
  final List<UserEntity> strangers;
  final ValueChanged onNextImage;
  final ValueChanged onPreviousImage;
  final VoidCallback onSeeDetails;
}

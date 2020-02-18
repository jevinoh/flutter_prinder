import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_prinder/entities/entities.dart';
import 'package:flutter_prinder/models/models.dart';
import 'package:flutter_prinder/presentation/chat_list_item.dart';
import 'package:flutter_prinder/selectors/selectors.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ViewModel>(
      converter: ViewModel.fromStore,
      builder: (context, vm) {
        int i = 0;
        return new Container(
          color: Colors.white,
          child: new ListView(
            padding: const EdgeInsets.all(0.0),
            addAutomaticKeepAlives: true,
            children: vm.matchs.map((UserEntity match) {
              i += 1;
              return ChatListItem(
                name: match.name,
                lastMessage: 'Last Message Last Message Last Message',
                lastMessageByMe: i % 2 == 0,
                imageUrl: match.images[0],
                onPressed: () => print('chat room pressed'),
              );
            }).toList()
          )
        );
      }
    );
  }
}

class ViewModel {
  ViewModel({
    this.matchs,
  });

  static ViewModel fromStore(Store<AppState> store) {
    return new ViewModel(
     // matchs: matchsSelector(store).matchs,
    );
  }

  final List<UserEntity> matchs;
}

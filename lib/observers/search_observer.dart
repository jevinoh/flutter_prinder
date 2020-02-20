enum ObserverState { INIT, REBUILD, QUESTIONS }

abstract class SearchObserverStateListener {
  void onStateChanged(ObserverState state);
}

//Singleton reusable class
class SearchObserverProvider {

  List<SearchObserverStateListener> observers;

  static final SearchObserverProvider _instance = new SearchObserverProvider.internal();
  factory SearchObserverProvider() => _instance;

  SearchObserverProvider.internal() {
    observers = new List<SearchObserverStateListener>();
    initState();
  }

  void initState() async {
    notify(ObserverState.INIT);
  }

  void subscribe(SearchObserverStateListener listener) {
    observers.add(listener);
  }

  void notify(dynamic state) {
    observers.forEach((SearchObserverStateListener obj) => obj.onStateChanged(state));
  }

  void disposeObserver(SearchObserverStateListener thisObserver) {
    for (var obj in observers) {
      if (obj == thisObserver) {
        observers.remove(obj);
      }
    }
  }
}
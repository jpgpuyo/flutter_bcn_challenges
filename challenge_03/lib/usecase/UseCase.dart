import 'dart:async';

abstract class UseCase<T> {
  final StreamController _outController = new StreamController<T>();

  Stream<T> get _outputStream => _outController.stream;

  StreamSubscription<T> streamSubscription;

  void execute() {
    run().then((response) {
      if (!_outController.isClosed) {
        _outController.add(response);
      }
    });
  }

  void subscribe(void onData(T event),
      {Function onError, void onDone(), bool cancelOnError}) {
    streamSubscription = _outputStream.listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }

  void unsubscribe() {
    if (streamSubscription != null) {
      streamSubscription.cancel();
    }
    _outController.close();
  }

  Future<T> run();
}

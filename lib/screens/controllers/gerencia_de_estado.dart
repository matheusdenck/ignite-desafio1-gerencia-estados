abstract class GerenciaDeEstado<T> {
  late T _state;
  final List<dynamic Function(T)> _listeners = <Function(T state)>[];

  GerenciaDeEstado({
    required T initialState,
  }) {
    _state = initialState;
  }

  T get state => _state;

  void setState(T state) {
    _state = state;
    _updateListeners();
  }

  void _updateListeners() {
    for (var i = 0; i < _listeners.length; i++) {
      _listeners[i](_state);
    }
  }

  void listen(void Function(T state) onUpdate) {
    _listeners.add(onUpdate);
  }
}

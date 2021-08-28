class ErrorState {
  final Exception _ex;

  int _errorCode = -1;
  int get errorCode => _errorCode;

  String _extraMessage = "";
  String get extraMessage => _extraMessage;

  Exception get exception => _ex;

  ErrorState(this._ex, {int errorCode = -1, String extraMessage = ""}) {
    _errorCode = errorCode;
    _extraMessage = extraMessage;
  }

  bool hasException() => _errorCode > -1;

  @override
  String toString() => _ex.toString();
}

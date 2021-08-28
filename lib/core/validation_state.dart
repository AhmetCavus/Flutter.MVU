class ValidationState {
  int _failCode;
  int get failCode => _failCode;

  String _failMessage;
  String get failMessage => _failMessage;

  ValidationState(this._failCode, this._failMessage);

  bool hasFailure() => _failMessage.isNotEmpty;
}

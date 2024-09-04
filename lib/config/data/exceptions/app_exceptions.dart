class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message]) : super('No Internet Connection');
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message]) : super(message, "You don't access to do this");
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message]) : super(message, "Request Timeout");
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, "");
}

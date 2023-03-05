class AppExceptions implements Exception{
  final _message;
  final _prefix;
  AppExceptions([this._message,this._prefix]);

  String toString(){
    return '$_message$_prefix' ;
  }

}

class InternetExceptions extends AppExceptions{
  InternetExceptions([String? message]) : super(message,'No Internet');
}

class RequestTimeOut extends AppExceptions{
  RequestTimeOut([String? message]):super(message,'Request Time Out');
}

class ServerException extends AppExceptions{
  ServerException([String? message]): super(message,'Internal Server Error');
}

class InvalidUrl extends AppExceptions{
  InvalidUrl([String? message]): super(message,'Invalid Url');
}

class CommunicationException extends AppExceptions{
  CommunicationException([String? message]): super(message,'Error occured while communicating with server');
}
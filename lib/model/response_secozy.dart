class ResponseSecozy<T>{
  static const int REQUEST_IN_PROGRESS = 88;
  static const int REQUEST_SUCCESS = 25;
  static const int REQUEST_SUCCESS_EMPTY = 26;
  ///when error happen, give user a way to retry the action
  static const int ERROR_SHOULD_RETRY = -25;
  ///when not authenticated, throw user to login page
  static const int ERROR_NOT_AUTHENTICATED = -26;
  ///When error happen, just do nothing
  static const int ERROR_DO_NOTHING = -27;

  int httpStatusCode;
  int result;
  String errorMessage;
  T data;
  ResponseSecozy({this.httpStatusCode, this.result, this.data, this.errorMessage});

  ResponseSecozy.fromAnotherResponse(ResponseSecozy anotherResponse){
    result = anotherResponse.result;
    errorMessage = anotherResponse.errorMessage;
    httpStatusCode = anotherResponse.httpStatusCode;
    //data = anotherResponse.data;
  }

  ResponseSecozy.fromAnotherResponseWithCustomErrorMessage(ResponseSecozy anotherResponse, this.errorMessage){
    result = anotherResponse.result;
    httpStatusCode = anotherResponse.httpStatusCode;
    //data = anotherResponse.data;
  }

  ResponseSecozy.createShouldRetryResponseWithErrorMessage(this.errorMessage){
    result = ERROR_SHOULD_RETRY;
  }

  ResponseSecozy.createRequestInProgressResponse(){
    result = REQUEST_IN_PROGRESS;
  }

  ResponseSecozy.createEmptyResponse({this.httpStatusCode, this.errorMessage}){
    result = REQUEST_SUCCESS_EMPTY;
  }

  @override
  bool operator ==(other) {
    return httpStatusCode == other.httpStatusCode
        && result == other.result
        && errorMessage == other.errorMessage;
  }
}
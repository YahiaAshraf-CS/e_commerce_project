sealed class ApiResult<T> {
  String? get message => null;
 
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  ApiSuccess(this.data);
}

class ApiError<T> extends ApiResult<T> {
  @override
  final String message;
  ApiError(this.message);
}
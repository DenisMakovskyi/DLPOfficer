class ApiResult<T> {
  final int code;
  final T body;

  ApiResult(this.code, this.body);

  bool isSuccess() => code >= 200 && code < 300;
}

sealed class Result<T, E> {
  const Result();
  factory Result.success(T result) => Success(result); // Option
  factory Result.error(E e) => Error(e); // OpOption
}

class Success<T, E> implements Result<T, E> {
  final T _result;
  Success(this._result);
  get result => _result;
}

class Error<T, E> implements Result<T, E> {
  final E _e;
  Error(this._e);
  get e => _e;
}

// Exception 받아서 처리하고 싶었기 때문에 2개 타입 받음
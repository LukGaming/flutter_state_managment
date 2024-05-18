abstract class BaseState {}

class LoadingState extends BaseState {}

class SuccessState extends BaseState {
  dynamic state;
  SuccessState({
    required this.state,
  });
}

class ErrorState extends BaseState {
  dynamic error;
  ErrorState({
    required this.error,
  });
}

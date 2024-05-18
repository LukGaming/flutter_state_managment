import 'package:base_controller/base_core/base_state.dart';
import 'package:base_controller/domains/entities/user.dart';

class AuthState extends BaseState {}

class InitialState extends AuthState {}

class UnloggedState extends AuthState {}

class LoggedState extends AuthState {
  final User user;

  LoggedState({required this.user});
}

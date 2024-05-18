import 'package:base_controller/base_core/base_controller.dart';
import 'package:base_controller/base_core/base_state.dart';
import 'package:base_controller/domains/entities/user.dart';
import 'package:base_controller/entities/state/auth_state.dart';

class AuthController extends BaseController<AuthState> {
  AuthController() : super(LoadingState());

  void checkIsLogged() async {
    emitState(UnloggedState());
  }

  void login() {
    emitState(LoggedState(user: User(name: "Paulo")));
  }

  void logout() {
    emitState(UnloggedState());
  }
}

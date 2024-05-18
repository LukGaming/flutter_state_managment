import 'package:base_controller/base_core/base_controller.dart';
import 'package:base_controller/base_core/base_state.dart';
import 'package:base_controller/controllers/auth_controller_example.dart';
import 'package:base_controller/entities/state/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final authController = AuthController();

  group("Testing the BaseController", () {
    test("AuthState when instanciated Should be LoadingState", () {
      expect(authController.value, isA<LoadingState>());
    });

    test("When Login, the state should be LoggedState", () async {
      authController.login();
      expect(authController.value, isA<LoggedState>());
    });

    test("When Logout, the state should be LogoutState", () async {
      authController.logout();
      expect(authController.value, isA<UnloggedState>());
    });
  });
}

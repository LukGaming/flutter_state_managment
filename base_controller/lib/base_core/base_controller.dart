// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:base_controller/base_core/base_state.dart';
import 'package:flutter/foundation.dart';

abstract class BaseController<T extends BaseState> extends ChangeNotifier
    implements ValueNotifier<BaseState> {
  late final ValueNotifier<BaseState> _stateNotifier;

  BaseController(BaseState initialState)
      : _stateNotifier = ValueNotifier<BaseState>(initialState);

  @override
  BaseState get value => _stateNotifier.value;

  void emitState(BaseState newState) {
    _stateNotifier.value = newState;
    notifyListeners();
  }

  @override
  set value(BaseState newValue) {}

  @override
  void dispose() {
    _stateNotifier.dispose();
    super.dispose();
  }
}

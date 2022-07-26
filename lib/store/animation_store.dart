import 'package:mobx/mobx.dart';

part 'animation_store.g.dart';

class AnimationStore = _AnimationStore with _$AnimationStore;

abstract class _AnimationStore with Store {
  @observable
  bool willStart = false;

  @action
  void start() => willStart = true;

  @action
  void stop() => willStart = false;
}
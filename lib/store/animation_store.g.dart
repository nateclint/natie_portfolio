// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnimationStore on _AnimationStore, Store {
  late final _$isDoneAtom =
      Atom(name: '_AnimationStore.isDone', context: context);

  @override
  bool get willStart {
    _$isDoneAtom.reportRead();
    return super.willStart;
  }

  @override
  set willStart(bool value) {
    _$isDoneAtom.reportWrite(value, super.willStart, () {
      super.willStart = value;
    });
  }

  late final _$_AnimationStoreActionController =
      ActionController(name: '_AnimationStore', context: context);

  @override
  void start() {
    final _$actionInfo = _$_AnimationStoreActionController.startAction(
        name: '_AnimationStore.setDone');
    try {
      return super.start();
    } finally {
      _$_AnimationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo = _$_AnimationStoreActionController.startAction(
        name: '_AnimationStore.setNotDone');
    try {
      return super.stop();
    } finally {
      _$_AnimationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDone: ${willStart}
    ''';
  }
}
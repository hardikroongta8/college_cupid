// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crush_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CrushListStore on _CrushListStore, Store {
  late final _$crushListAtom =
      Atom(name: '_CrushListStore.crushList', context: context);

  @override
  ObservableList<String> get crushList {
    _$crushListAtom.reportRead();
    return super.crushList;
  }

  @override
  set crushList(ObservableList<String> value) {
    _$crushListAtom.reportWrite(value, super.crushList, () {
      super.crushList = value;
    });
  }

  late final _$getCrushesAsyncAction =
      AsyncAction('_CrushListStore.getCrushes', context: context);

  @override
  Future<void> getCrushes() {
    return _$getCrushesAsyncAction.run(() => super.getCrushes());
  }

  late final _$removeCrushAsyncAction =
      AsyncAction('_CrushListStore.removeCrush', context: context);

  @override
  Future<void> removeCrush(int index) {
    return _$removeCrushAsyncAction.run(() => super.removeCrush(index));
  }

  @override
  String toString() {
    return '''
crushList: ${crushList}
    ''';
  }
}

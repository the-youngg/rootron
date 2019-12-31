// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doorStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DoorStore on _DoorStore, Store {
  final _$positionValueAtom = Atom(name: '_DoorStore.positionValue');

  @override
  String get positionValue {
    _$positionValueAtom.context.enforceReadPolicy(_$positionValueAtom);
    _$positionValueAtom.reportObserved();
    return super.positionValue;
  }

  @override
  set positionValue(String value) {
    _$positionValueAtom.context.conditionallyRunInAction(() {
      super.positionValue = value;
      _$positionValueAtom.reportChanged();
    }, _$positionValueAtom, name: '${_$positionValueAtom.name}_set');
  }

  final _$doorValueAtom = Atom(name: '_DoorStore.doorValue');

  @override
  String get doorValue {
    _$doorValueAtom.context.enforceReadPolicy(_$doorValueAtom);
    _$doorValueAtom.reportObserved();
    return super.doorValue;
  }

  @override
  set doorValue(String value) {
    _$doorValueAtom.context.conditionallyRunInAction(() {
      super.doorValue = value;
      _$doorValueAtom.reportChanged();
    }, _$doorValueAtom, name: '${_$doorValueAtom.name}_set');
  }

  final _$positionsAtom = Atom(name: '_DoorStore.positions');

  @override
  List<String> get positions {
    _$positionsAtom.context.enforceReadPolicy(_$positionsAtom);
    _$positionsAtom.reportObserved();
    return super.positions;
  }

  @override
  set positions(List<String> value) {
    _$positionsAtom.context.conditionallyRunInAction(() {
      super.positions = value;
      _$positionsAtom.reportChanged();
    }, _$positionsAtom, name: '${_$positionsAtom.name}_set');
  }

  final _$doorsAtom = Atom(name: '_DoorStore.doors');

  @override
  List<Door> get doors {
    _$doorsAtom.context.enforceReadPolicy(_$doorsAtom);
    _$doorsAtom.reportObserved();
    return super.doors;
  }

  @override
  set doors(List<Door> value) {
    _$doorsAtom.context.conditionallyRunInAction(() {
      super.doors = value;
      _$doorsAtom.reportChanged();
    }, _$doorsAtom, name: '${_$doorsAtom.name}_set');
  }
}

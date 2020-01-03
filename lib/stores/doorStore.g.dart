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

  final _$devicesAtom = Atom(name: '_DoorStore.devices');

  @override
  List<Device> get devices {
    _$devicesAtom.context.enforceReadPolicy(_$devicesAtom);
    _$devicesAtom.reportObserved();
    return super.devices;
  }

  @override
  set devices(List<Device> value) {
    _$devicesAtom.context.conditionallyRunInAction(() {
      super.devices = value;
      _$devicesAtom.reportChanged();
    }, _$devicesAtom, name: '${_$devicesAtom.name}_set');
  }
}

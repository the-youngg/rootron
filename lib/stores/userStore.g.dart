// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$userIdAtom = Atom(name: '_UserStore.userId');

  @override
  int get userId {
    _$userIdAtom.context.enforceReadPolicy(_$userIdAtom);
    _$userIdAtom.reportObserved();
    return super.userId;
  }

  @override
  set userId(int value) {
    _$userIdAtom.context.conditionallyRunInAction(() {
      super.userId = value;
      _$userIdAtom.reportChanged();
    }, _$userIdAtom, name: '${_$userIdAtom.name}_set');
  }

  final _$tokenAtom = Atom(name: '_UserStore.token');

  @override
  String get token {
    _$tokenAtom.context.enforceReadPolicy(_$tokenAtom);
    _$tokenAtom.reportObserved();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.context.conditionallyRunInAction(() {
      super.token = value;
      _$tokenAtom.reportChanged();
    }, _$tokenAtom, name: '${_$tokenAtom.name}_set');
  }

  final _$houseListAtom = Atom(name: '_UserStore.houseList');

  @override
  HouseList get houseList {
    _$houseListAtom.context.enforceReadPolicy(_$houseListAtom);
    _$houseListAtom.reportObserved();
    return super.houseList;
  }

  @override
  set houseList(HouseList value) {
    _$houseListAtom.context.conditionallyRunInAction(() {
      super.houseList = value;
      _$houseListAtom.reportChanged();
    }, _$houseListAtom, name: '${_$houseListAtom.name}_set');
  }

  final _$positionListAtom = Atom(name: '_UserStore.positionList');

  @override
  PositionList get positionList {
    _$positionListAtom.context.enforceReadPolicy(_$positionListAtom);
    _$positionListAtom.reportObserved();
    return super.positionList;
  }

  @override
  set positionList(PositionList value) {
    _$positionListAtom.context.conditionallyRunInAction(() {
      super.positionList = value;
      _$positionListAtom.reportChanged();
    }, _$positionListAtom, name: '${_$positionListAtom.name}_set');
  }
}

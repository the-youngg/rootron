// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$isLoginAtom = Atom(name: '_UserStore.isLogin');

  @override
  bool get isLogin {
    _$isLoginAtom.context.enforceReadPolicy(_$isLoginAtom);
    _$isLoginAtom.reportObserved();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.context.conditionallyRunInAction(() {
      super.isLogin = value;
      _$isLoginAtom.reportChanged();
    }, _$isLoginAtom, name: '${_$isLoginAtom.name}_set');
  }

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

  final _$currentUserAtom = Atom(name: '_UserStore.currentUser');

  @override
  User get currentUser {
    _$currentUserAtom.context.enforceReadPolicy(_$currentUserAtom);
    _$currentUserAtom.reportObserved();
    return super.currentUser;
  }

  @override
  set currentUser(User value) {
    _$currentUserAtom.context.conditionallyRunInAction(() {
      super.currentUser = value;
      _$currentUserAtom.reportChanged();
    }, _$currentUserAtom, name: '${_$currentUserAtom.name}_set');
  }

  final _$positionBindDeviceListAtom =
      Atom(name: '_UserStore.positionBindDeviceList');

  @override
  Map<String, List<Device>> get positionBindDeviceList {
    _$positionBindDeviceListAtom.context
        .enforceReadPolicy(_$positionBindDeviceListAtom);
    _$positionBindDeviceListAtom.reportObserved();
    return super.positionBindDeviceList;
  }

  @override
  set positionBindDeviceList(Map<String, List<Device>> value) {
    _$positionBindDeviceListAtom.context.conditionallyRunInAction(() {
      super.positionBindDeviceList = value;
      _$positionBindDeviceListAtom.reportChanged();
    }, _$positionBindDeviceListAtom,
        name: '${_$positionBindDeviceListAtom.name}_set');
  }

  final _$houseInfoListAtom = Atom(name: '_UserStore.houseInfoList');

  @override
  HouseInfoList get houseInfoList {
    _$houseInfoListAtom.context.enforceReadPolicy(_$houseInfoListAtom);
    _$houseInfoListAtom.reportObserved();
    return super.houseInfoList;
  }

  @override
  set houseInfoList(HouseInfoList value) {
    _$houseInfoListAtom.context.conditionallyRunInAction(() {
      super.houseInfoList = value;
      _$houseInfoListAtom.reportChanged();
    }, _$houseInfoListAtom, name: '${_$houseInfoListAtom.name}_set');
  }

  final _$getHouseInfoListAsyncAction = AsyncAction('getHouseInfoList');

  @override
  Future getHouseInfoList(int userId) {
    return _$getHouseInfoListAsyncAction
        .run(() => super.getHouseInfoList(userId));
  }
}

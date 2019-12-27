// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registerStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStore, Store {
  final _$usernameAtom = Atom(name: '_RegisterStore.username');

  @override
  String get username {
    _$usernameAtom.context.enforceReadPolicy(_$usernameAtom);
    _$usernameAtom.reportObserved();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.context.conditionallyRunInAction(() {
      super.username = value;
      _$usernameAtom.reportChanged();
    }, _$usernameAtom, name: '${_$usernameAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_RegisterStore.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$isObscureTextAtom = Atom(name: '_RegisterStore.isObscureText');

  @override
  bool get isObscureText {
    _$isObscureTextAtom.context.enforceReadPolicy(_$isObscureTextAtom);
    _$isObscureTextAtom.reportObserved();
    return super.isObscureText;
  }

  @override
  set isObscureText(bool value) {
    _$isObscureTextAtom.context.conditionallyRunInAction(() {
      super.isObscureText = value;
      _$isObscureTextAtom.reportChanged();
    }, _$isObscureTextAtom, name: '${_$isObscureTextAtom.name}_set');
  }

  final _$telAtom = Atom(name: '_RegisterStore.tel');

  @override
  String get tel {
    _$telAtom.context.enforceReadPolicy(_$telAtom);
    _$telAtom.reportObserved();
    return super.tel;
  }

  @override
  set tel(String value) {
    _$telAtom.context.conditionallyRunInAction(() {
      super.tel = value;
      _$telAtom.reportChanged();
    }, _$telAtom, name: '${_$telAtom.name}_set');
  }

  final _$smsCodeAtom = Atom(name: '_RegisterStore.smsCode');

  @override
  String get smsCode {
    _$smsCodeAtom.context.enforceReadPolicy(_$smsCodeAtom);
    _$smsCodeAtom.reportObserved();
    return super.smsCode;
  }

  @override
  set smsCode(String value) {
    _$smsCodeAtom.context.conditionallyRunInAction(() {
      super.smsCode = value;
      _$smsCodeAtom.reportChanged();
    }, _$smsCodeAtom, name: '${_$smsCodeAtom.name}_set');
  }

  final _$smsCodeButtonTextAtom =
      Atom(name: '_RegisterStore.smsCodeButtonText');

  @override
  String get smsCodeButtonText {
    _$smsCodeButtonTextAtom.context.enforceReadPolicy(_$smsCodeButtonTextAtom);
    _$smsCodeButtonTextAtom.reportObserved();
    return super.smsCodeButtonText;
  }

  @override
  set smsCodeButtonText(String value) {
    _$smsCodeButtonTextAtom.context.conditionallyRunInAction(() {
      super.smsCodeButtonText = value;
      _$smsCodeButtonTextAtom.reportChanged();
    }, _$smsCodeButtonTextAtom, name: '${_$smsCodeButtonTextAtom.name}_set');
  }

  final _$countAtom = Atom(name: '_RegisterStore.count');

  @override
  int get count {
    _$countAtom.context.enforceReadPolicy(_$countAtom);
    _$countAtom.reportObserved();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.context.conditionallyRunInAction(() {
      super.count = value;
      _$countAtom.reportChanged();
    }, _$countAtom, name: '${_$countAtom.name}_set');
  }

  final _$isSmsButtonEnableAtom =
      Atom(name: '_RegisterStore.isSmsButtonEnable');

  @override
  bool get isSmsButtonEnable {
    _$isSmsButtonEnableAtom.context.enforceReadPolicy(_$isSmsButtonEnableAtom);
    _$isSmsButtonEnableAtom.reportObserved();
    return super.isSmsButtonEnable;
  }

  @override
  set isSmsButtonEnable(bool value) {
    _$isSmsButtonEnableAtom.context.conditionallyRunInAction(() {
      super.isSmsButtonEnable = value;
      _$isSmsButtonEnableAtom.reportChanged();
    }, _$isSmsButtonEnableAtom, name: '${_$isSmsButtonEnableAtom.name}_set');
  }
}

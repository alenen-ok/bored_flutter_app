// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on SettingsStoreBase, Store {
  final _$useDarkModeAtom = Atom(name: 'SettingsStoreBase.useDarkMode');

  @override
  bool get useDarkMode {
    _$useDarkModeAtom.reportRead();
    return super.useDarkMode;
  }

  @override
  set useDarkMode(bool value) {
    _$useDarkModeAtom.reportWrite(value, super.useDarkMode, () {
      super.useDarkMode = value;
    });
  }

  final _$firstEntryAtom = Atom(name: 'SettingsStoreBase.firstEntry');

  @override
  bool get firstEntry {
    _$firstEntryAtom.reportRead();
    return super.firstEntry;
  }

  @override
  set firstEntry(bool value) {
    _$firstEntryAtom.reportWrite(value, super.firstEntry, () {
      super.firstEntry = value;
    });
  }

  final _$SettingsStoreBaseActionController =
      ActionController(name: 'SettingsStoreBase');

  @override
  void setDarkMode(bool updatedDarkModePreference) {
    final _$actionInfo = _$SettingsStoreBaseActionController.startAction(
        name: 'SettingsStoreBase.setDarkMode');
    try {
      return super.setDarkMode(updatedDarkModePreference);
    } finally {
      _$SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFirstEntry(bool firstEntry) {
    final _$actionInfo = _$SettingsStoreBaseActionController.startAction(
        name: 'SettingsStoreBase.setFirstEntry');
    try {
      return super.setFirstEntry(firstEntry);
    } finally {
      _$SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
useDarkMode: ${useDarkMode},
firstEntry: ${firstEntry}
    ''';
  }
}

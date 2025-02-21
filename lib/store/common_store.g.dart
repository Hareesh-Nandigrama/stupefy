// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommonStore on _CommonStore, Store {
  late final _$dashboardPageAtom =
      Atom(name: '_CommonStore.dashboardPage', context: context);

  @override
  DashboardPageType get dashboardPage {
    _$dashboardPageAtom.reportRead();
    return super.dashboardPage;
  }

  @override
  set dashboardPage(DashboardPageType value) {
    _$dashboardPageAtom.reportWrite(value, super.dashboardPage, () {
      super.dashboardPage = value;
    });
  }

  late final _$isLibraryGridAtom =
      Atom(name: '_CommonStore.isLibraryGrid', context: context);

  @override
  bool get isLibraryGrid {
    _$isLibraryGridAtom.reportRead();
    return super.isLibraryGrid;
  }

  @override
  set isLibraryGrid(bool value) {
    _$isLibraryGridAtom.reportWrite(value, super.isLibraryGrid, () {
      super.isLibraryGrid = value;
    });
  }

  late final _$_CommonStoreActionController =
      ActionController(name: '_CommonStore', context: context);

  @override
  void setDashboardIndex(DashboardPageType newPage) {
    final _$actionInfo = _$_CommonStoreActionController.startAction(
        name: '_CommonStore.setDashboardIndex');
    try {
      return super.setDashboardIndex(newPage);
    } finally {
      _$_CommonStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLibraryGrid() {
    final _$actionInfo = _$_CommonStoreActionController.startAction(
        name: '_CommonStore.setLibraryGrid');
    try {
      return super.setLibraryGrid();
    } finally {
      _$_CommonStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dashboardPage: ${dashboardPage},
isLibraryGrid: ${isLibraryGrid}
    ''';
  }
}

// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:stupefy/constants/enums.dart';
part 'common_store.g.dart';



class CommonStore = _CommonStore with _$CommonStore;

abstract class _CommonStore with Store {
  
  @observable
  DashboardPageType dashboardPage = DashboardPageType.home;

  @action
  void setDashboardIndex(DashboardPageType newPage) {
    dashboardPage= newPage;
  }

}
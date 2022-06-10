import 'dart:async';

import 'package:flutter_mvp_app/data/AppDataManager.dart';
import 'package:flutter_mvp_app/data/network/ApiConfig.dart';
import 'package:flutter_mvp_app/data/network/Method.dart';
import 'package:flutter_mvp_app/ui/base/base_presentor.dart';
import 'package:flutter_mvp_app/ui/home/home_page_view.dart';
import 'package:flutter_mvp_app/utils/network_utils.dart';

class HomePagePresentor extends BasePresentor<HomePageView> {
  Future restApi(String _action, String param, String method,
      Map<String, String> object) async {
    checkViewAttached();

    if (_action == ApiConfig.LOAD_USER) {
      isViewAttached ? getView()?.showLoading("กำลังโหลด...") : null;
      var response = await appDataManager.apiHelper
          .restApi(_action, param, method, object);
      isViewAttached ? getView()?.dismissLoading() : null;
      if(response == null){
        isViewAttached ? getView()?.onHttpException() : null;
      }else {
        if (NetworkUtils.isReqSuccess(response)) {
          String text = response.body;
          isViewAttached ? getView()?.onLoadUser(text) : null;
        } else {
          isViewAttached ? getView()?.onFailLoadUser(response) : null;
        }
      }
    } else if (_action == ApiConfig.EDIT_USER) {
      isViewAttached ? getView()?.showLoading("กำลังแก้ไข...") : null;
      var response = await appDataManager.apiHelper
          .restApi(_action, param, method, object);
      isViewAttached ? getView()?.dismissLoading() : null;
      if(response == null){
        isViewAttached ? getView()?.onHttpException() : null;
      }else {
        if (NetworkUtils.isReqSuccess(response)) {
          String text = response.body;
          isViewAttached ? getView()?.onEditUser(text) : null;
        } else {
          isViewAttached ? getView()?.onFailEditUser(response) : null;
        }
      }
    }
  }
}

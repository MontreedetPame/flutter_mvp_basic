import 'package:http/http.dart';

abstract class HomePageView {
  showLoading(String text);

  onLoadUser(String text);

  onFailLoadUser(Response response) {}

  onEditUser(String text);

  onFailEditUser(Response response) {}

  dismissLoading();
}

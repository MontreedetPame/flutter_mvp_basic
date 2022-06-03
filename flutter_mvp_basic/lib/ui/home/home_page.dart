import 'package:flutter/material.dart';
import 'package:flutter_mvp_app/data/network/ApiConfig.dart';
import 'package:flutter_mvp_app/data/network/Method.dart';
import 'package:flutter_mvp_app/ui/home/home_page_presentor.dart';
import 'package:flutter_mvp_app/ui/home/home_page_presentor.dart';
import 'package:flutter_mvp_app/ui/home/home_page_view.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomePageView {
  String _text = "Loading...";

  HomePagePresentor? _presentor;

  @override
  void initState() {
    _presentor = new HomePagePresentor();
    _presentor?.attachView(this);
    // TODO: implement initState
    super.initState();
  }

  Future<void> loadUser() async {
    String id = "1";
    _presentor?.restApi(ApiConfig.LOAD_USER, "?id=${id}", Method.GET, {});
  }

  Future<void> editUser() async {
    String id = "1";
    Map<String, String> body = {
      'id': id,
      'username': "test111",
      'password': "123456"
    };
    _presentor?.restApi(ApiConfig.EDIT_USER, "", Method.POST, body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("MVP app"),
        ),
        body: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("loadUser"),
                  onPressed: () {
                    loadUser();
                  },
                ),
                SizedBox(width: 5),
                RaisedButton(
                  child: Text("EditUser"),
                  onPressed: () {
                    editUser();
                  },
                ),
              ],
            ),
          ),
        ));
  }

  @override
  showLoading(String text) {
    print(text);
  }

  @override
  onLoadUser(String text) {
    print(text);
    setState(() {
      _text = text;
    });
  }

  @override
  onFailLoadUser(Response response) {
    print("onFailLoadUser");
    setState(() {
      _text = "onFailLoadUser";
    });
  }

  @override
  onEditUser(String text) {
    print(text);
    setState(() {
      _text = text;
    });
  }

  @override
  onFailEditUser(Response response) {
    print("onFailEditUser");
    setState(() {
      _text = "onFailEditUser";
    });
  }

  @override
  dismissLoading() {
    print("dismissLoading");
  }
}

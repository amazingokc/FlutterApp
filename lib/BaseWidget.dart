import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BaseWidgetPage();
  }
}

class _BaseWidgetPage extends State<BaseWidgetPage> {
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var imgUrl = NetworkImage(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4");
    bool _switchSelected = true; //维护单选开关状态
    bool _checkboxSelected = false; //维护复选框状态

    return Scaffold(
        appBar: AppBar(
          title: Text("基础控件"),
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Form(
              key: _formKey,
              autovalidate: true,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text("文本"),
                    RaisedButton(
                      child: Text("RaisedButton"),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text("FlatButton"),
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {},
                    ),
                    OutlineButton(
                      child: Text("OutlineButton"),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.ac_unit),
                      onPressed: () {},
                    ),
                    RaisedButton.icon(
                      icon: Icon(Icons.send),
                      label: Text("Send"),
                      onPressed: _onPressed,
                    ),
                    OutlineButton.icon(
                        onPressed: _onPressed,
                        icon: Icon(Icons.add),
                        label: Text("Add")),
                    FlatButton.icon(
                        onPressed: _onPressed,
                        icon: Icon(Icons.info),
                        label: Text("Info")),
                    Image(
                      image: imgUrl,
                      height: 40.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                    ),
                    Switch(
                      value: _switchSelected,
                      onChanged: (value) {
                        setState(() {
                          _switchSelected = !_switchSelected;
                          print("dsadsadsadas__$_switchSelected");
                        });
                      },
                    ),
//                Checkbox(
//                  value: _checkboxSelected,
//                  activeColor: Colors.blue,
//                  onChanged: (bool value) {
//                    setState(() {
//                      _checkboxSelected = value;
//                    });
//                  },
//                )
                    TextFormField(
                      autofocus: true,
//                  controller: ,
                      decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "用户名或邮箱",
                          prefixIcon: Icon(Icons.person)),
                      onChanged: (v) {},

                      validator: (v) {
                        return v.trim().length > 0 ? null : "用户名不能为空";
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "您的登录密码",
                          prefixIcon: Icon(Icons.lock)),
                      validator: (v) {
                        return v.trim().length > 5 ? null : "密码不能少于6位";
                      },
                    ),
                    // 登录按钮1
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text("登录"),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: () {
                                //在这里不能通过此方式获取FormState，context不对
                                //print(Form.of(context));

                                // 通过_formKey.currentState 获取FormState后，
                                // 调用validate()方法校验用户名密码是否合法，校验
                                // 通过后再提交数据。
                                if ((_formKey.currentState as FormState)
                                    .validate()) {
                                  //验证通过提交数据
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 21.0),
                    ),

                    LinearProgressIndicator(
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation(Colors.green),
                      value: 0.5,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 21.0),
                    ),

                    CircularProgressIndicator(
                      strokeWidth: 4.0,
                      backgroundColor: Colors.grey,
                    ),
                  ],
                ),
              )),
        ));
  }

  void _onPressed() {}
}

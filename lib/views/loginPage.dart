import 'package:ai_dang/session.dart';
import 'package:ai_dang/views/account/signup.dart';
import 'package:ai_dang/views/test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ai_dang/dbHandler.dart';

import '../main.dart';
import 'home.dart';

Color red = const Color(0xffCF2525);
Color gray = const Color(0xffD6D6D6);
Color darKGray = const Color(0xff3E3E3E);

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _idTextEditController = TextEditingController();
  final _passwordTextEditController = TextEditingController();

  bool Login_check = false;
  List<FocusNode> _focusNodes = [
    FocusNode(), FocusNode()
  ];
  void user_check(Email, Password) async {
    var conn = await ConnHandler.instance.conn;

    var result = await conn.query(
        'select * from user where Email = "$Email" and Password = "$Password"');
    // 비어있으면 true
    if (result.isEmpty == false) {
      Login_check = true;
      return login_button();
    } else {
      Login_check = false;
      return showDialogPop_Login();
    }
    return print(Login_check);
  }

  void user_info(Email) async {
    var conn = await ConnHandler.instance.conn;

    var User_info_list = [];
    var result = await conn.query(
        'select name, email, age, sex, height, weight, dt, password, id from user where email = "$Email"');
    for (var row in result) {
      Session.instance.setInfo({
        'name': row[0],
        'email': row[1],
        'age': row[2],
        'sex': row[3],
        'height': row[4],
        'weight': row[5],
        'dt': row[6],
        'password': row[7],
        'id': row[8],
      });
    }
    return print(Session.instance.userInfo);
  }

  void login_button() async {
    user_info(_idTextEditController.text);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }

  void showDialogPop_Login() {
    showDialog(
      context: context,
      barrierDismissible: true,
      // false, //다이얼로그 바깥을 터치 시에 닫히도록 하는지 여부 (true: 닫힘, false: 닫히지않음)
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            //제목 정의
            '계정 정보가 다릅니다.',
          ),
          content: SingleChildScrollView(
            //내용 정의
            child: ListBody(
              children: <Widget>[
                Text(
                  'Email과 Password를 확인 해주세요!',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 현재 화면을 종료하고 이전 화면으로 돌아가기
              },
              child: Text(
                '닫기',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              width: (MediaQuery.of(context).size.width) * 0.75,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) * 0.075,
                  ),
                  // logo ----------------------------------------------------
                  SizedBox(
                      height: 100,
                      child: Image.asset('assets/image/logo.png',
                          fit: BoxFit.fitHeight)),
                  // title ---------------------------------------------------
                  Text(
                    'AI DANG',
                    textScaleFactor: 4,
                    style: TextStyle(fontWeight: FontWeight.w600, color: red),
                  ),
                  // desc ----------------------------------------------------
                  Text(
                    '나만의 스마트한 당뇨관리 비서',
                    textScaleFactor: 1.3,
                    style: TextStyle(color: red),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    child: TextField(
                      controller: _idTextEditController,
                      cursorColor: red,
                      focusNode: _focusNodes[0],
                      decoration: InputDecoration(
                        labelText: '이메일 주소',
                        hintText: '이메일 주소를 입력하세요.',
                        labelStyle: TextStyle(color: darKGray),
                        prefixIcon: Icon(Icons.email,
                          color: _focusNodes[0].hasFocus ? red: darKGray
                        ),
                        focusColor: red,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2, color: gray),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2, color: red),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: darKGray),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _passwordTextEditController,
                    cursorColor: red,
                    focusNode: _focusNodes[1],
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      hintText: '비밀번호를 입력하세요.',
                      labelStyle: TextStyle(color: darKGray),
                      prefixIcon: Icon(Icons.vpn_key,
                          color: _focusNodes[1].hasFocus ? red: darKGray
                      ),
                      focusColor: red,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2, color: gray),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2, color: red),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: darKGray),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) * 0.125,
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) * 0.065,
                    width: (MediaQuery.of(context).size.width) -
                        (MediaQuery.of(context).size.width) * 0.40,
                    child: ElevatedButton(
                      onPressed: () {
                        user_check(_idTextEditController.text,
                            _passwordTextEditController.text);
                      },
                      child: Text(
                        '지금 시작하기',
                        style: TextStyle(
                            fontSize:
                                ((MediaQuery.of(context).size.width) * 0.16) *
                                    0.26),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: red,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) * 0.085,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => signup()),
                        );
                      },
                      child: Text(
                        '처음이신가요? 회원가입',
                        style: TextStyle(
                            fontSize:
                                ((MediaQuery.of(context).size.width) * 0.16) *
                                    0.26,
                            color: red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

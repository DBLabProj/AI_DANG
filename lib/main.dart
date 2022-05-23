import 'package:ai_dang/views/test.dart';
import 'package:flutter/material.dart';
import 'dbHandler.dart';
import 'views/camera.dart';
import 'views/loginPage.dart';
import 'views/home.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ai_dang/views/setting/setting.dart';


void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      home:  loginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {

    var db = DbHandler();
    db.connect().then((conn) {
      db.printData(conn).then((results) {
        print(results);
      });
      conn.close();
    });

    setState(() {
      _counter++;
    });

  }

  int selectedindex=0;
  List _pages=[MyStatefulWidget(),loginPage(),Text('page3'), setting()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _pages[selectedindex],
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         '첫 화면 메인 페이지11',
      //       ),
      //
      //       TextButton(
      //         style: TextButton.styleFrom(
      //           primary: Colors.blue,
      //         ),
      //         onPressed: () {
      //           // print(_incrementCounter);
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => navbartest())
      //           );
      //         },
      //         child: Text('테스트 페이지로 이동'),
      //       ),
      //       TextButton(
      //         style: TextButton.styleFrom(
      //           primary: Colors.blue,
      //         ),
      //         onPressed: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => loginPage())
      //           );
      //         },
      //         child: Text('로그인 페이지로 이동'),
      //       ),
      //       TextButton(
      //         style: TextButton.styleFrom(
      //           primary: Colors.blue,
      //         ),
      //         onPressed: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => HomePage())
      //           );
      //         },
      //         child: Text('홈 페이지로 이동'),
      //       )
      //     ],
      //   ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xffCF2525),
        type: BottomNavigationBarType.fixed,

        onTap: _onItemTapped,
        currentIndex: selectedindex,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Statistics',
            icon: Icon(Icons.insert_chart),
          ),
          BottomNavigationBarItem(
            label: 'My Page',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'Setting',
            icon: Icon(Icons.settings ),
          ),
        ],
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      selectedindex=index;
      // _switchScreen(selectedindex);
    });
  }
  void _switchScreen(index){
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyStatefulWidget()
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => testpage()
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => testpage()
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => setting()
          ),
        );
        break;

    }
  }
}
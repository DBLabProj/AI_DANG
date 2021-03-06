import 'package:ai_dang/views/setting/changePassword.dart';
import 'package:ai_dang/views/setting/profileDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../session.dart';
import '../loginPage.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  bool _isChecked = false;

  var User_name = Session.instance.userInfo['name'];
  var User_age = Session.instance.userInfo['age'];
  var User_dt = Session.instance.userInfo['dt'];
  var User_sex = Session.instance.userInfo['sex'];
  var lightGray = const Color(0xffEEEEEE);

  Widget getIconButtonGroup(icons, color, label, settingText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icons,
              color: color,
            ),
            const SizedBox(width: 20),
            Text(
              label,
              textScaleFactor: 1.1,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.black),
            ),
          ],
        ),
        if (settingText == '') ...[
          const Icon(
            Icons.chevron_right_outlined,
            color: Colors.black,
          ),
        ] else ...[
          Row(
            children: [
              Text(
                settingText,
                style: const TextStyle(color: Colors.grey),
              ),
              const Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              )
            ],
          ),
        ]
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double areaWidth = (MediaQuery.of(context).size.width) * 0.85;
    if (areaWidth > 500) {
      areaWidth = 500;
    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: areaWidth,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  // ????????? ?????? -------------------------------------------------
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                        size: 64,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " $User_name???",
                            textScaleFactor: 1.6,
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => bodyInfoUpdate()),
                              );
                            },
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                minimumSize: const Size(50, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                alignment: Alignment.centerLeft),
                            child: const Text(
                              '????????? ????????????',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '??????',
                              textScaleFactor: 1.0,
                              style: TextStyle(color: Colors.black),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '$User_sex',
                              textScaleFactor: 1.3,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffCF2525)),
                            )
                          ],
                        ),
                        Container(width: 1, height: 30, color: lightGray),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '??????',
                              textScaleFactor: 1.0,
                              style: TextStyle(color: Colors.black),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '$User_age',
                              textScaleFactor: 1.3,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffCF2525)),
                            )
                          ],
                        ),
                        Container(width: 1, height: 30, color: lightGray),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '????????????',
                              textScaleFactor: 1.0,
                              style: TextStyle(color: Colors.black),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '$User_dt',
                              textScaleFactor: 1.3,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffCF2525)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  // ?????? ?????? --------------------------------------------------
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '  ?????? ??????',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  (MediaQuery.of(context).size.width) * 0.04,
                              color: Color(0xffCF2525)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // ???????????? ?????? ?????? --------------------------------------
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => changepass()));
                            },
                            child: getIconButtonGroup(Icons.password,
                                Colors.red[300], '???????????? ??????', '')),
                        Container(
                            width: areaWidth * 0.75,
                            height: 1,
                            color: lightGray),
                        // ???????????? ?????? ------------------------------------------
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            },
                            child: getIconButtonGroup(
                                Icons.logout, Colors.deepPurple, '????????????', '')),
                        Container(
                            width: areaWidth * 0.75,
                            height: 1,
                            color: lightGray),
                        // ????????? ?????? ?????? ---------------------------------------
                        TextButton(
                            onPressed: () {},
                            child: getIconButtonGroup(Icons.person_off,
                                Colors.red[300], '????????? ??????', '')),
                      ],
                    ),
                  ),

                  // ?????? ?????? --------------------------------------------------
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '  ?????? ??????',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  (MediaQuery.of(context).size.width) * 0.04,
                              color: Color(0xffCF2525)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.fromLTRB(6, 0, 6, 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // ???????????? ?????? -----------------------------------------
                        Padding(
                            padding: const EdgeInsets.fromLTRB(8, 4, 5, 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.notifications,
                                      color: Colors.yellowAccent[700],
                                    ),
                                    const SizedBox(width: 20),
                                    const Text(
                                      '???????????? ??????',
                                      textScaleFactor: 1.1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Switch(
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value;
                                    });
                                  },
                                )
                              ],
                            )),
                        Container(
                            width: areaWidth * 0.75,
                            height: 1,
                            color: lightGray),
                        // ???????????? ?????? -----------------------------------------
                        TextButton(
                            onPressed: () {},
                            child: getIconButtonGroup(
                                Icons.brightness_4,
                                Colors.lightBlueAccent,
                                '???????????? ??????',
                                '23:00 ~ 07:00')),
                      ],
                    ),
                  ),

                  // ?????? ?????? ---------------------------------------------------
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '  ?????? ??????',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  (MediaQuery.of(context).size.width) * 0.04,
                              color: Color(0xffCF2525)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // ????????? ?????? ?????? ---------------------------------------
                        TextButton(
                            onPressed: () {},
                            child: getIconButtonGroup(Icons.article,
                                Colors.deepPurple, '????????? ?????? ??????', '?????????')),
                        Container(
                            width: areaWidth * 0.75,
                            height: 1,
                            color: lightGray),
                        // ?????? ?????? --------------------------------------------
                        TextButton(
                            onPressed: () {},
                            child: getIconButtonGroup(
                                Icons.phone_android,
                                Colors.lightBlueAccent,
                                '?????? ??????',
                                'alpha-1.0.0.1')),
                        Container(
                            width: areaWidth * 0.75,
                            height: 1,
                            color: lightGray),
                        // ???????????? ?????? -----------------------------------------
                        TextButton(
                            onPressed: () {},
                            child: getIconButtonGroup(
                                Icons.update, Colors.redAccent, '???????????? ??????', '')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),

      // bottomNavigationBar:  navbartest()
    );
  }
}

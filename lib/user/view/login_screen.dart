import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jwt/common/component/custom_text_form_field.dart';
import 'package:flutter_jwt/common/const/colors.dart';
import 'package:flutter_jwt/common/layout/default_layout.dart';
import 'package:flutter_jwt/common/view/root_tab.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    // localhost
    final emulatorIp = '10.0.2.2:3000';
    final simulatorIp = '127.0.0.1:3000';
    final ip = '192.168.0.50:3000';

    //final ip = Platform.isIOS ? simulatorIp : emulatorIp;
    // final ip = serverIp;

    return DefaultLayout(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: SafeArea(
                top: true,
                bottom: false,
                child: Column(
                  children: [
                    _Title(),
                    _SubTitle(),
                    Image.asset(
                      'asset/img/misc/logo.png',
                      width: MediaQuery.of(context).size.width / 3 * 2,
                    ),
                    CustomTextFormField(
                      hintText: '이메일을 입력해주세요.',
                      onChanged: (String value) {
                        username = value;
                        },
                    ),
                    CustomTextFormField(
                      hintText: '비밀번호를 입력해주세요.',
                      onChanged: (String value) {
                        password = value;
                        },
                      obscureText: true,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final rawString = '$username:$password';

                        Codec<String, String> stringToBase64 = utf8.fuse(base64);

                        String token = stringToBase64.encode(rawString);

                        final resp = await dio.post(
                          'http://192.168.0.50:3000/auth/login',
                          options: Options(
                            headers: {
                              'authorization': 'Basic $token',
                            },
                          ),
                        );

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => RootTab(),
                          ),
                        );
                        print(resp.data);
                        },
                      child: Text(
                        '로그인',
                      ),
                    ),
                  ],
                ),
              ),
        ));
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('환영합니다!',
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ));
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주문이 되길 :)',
      style: TextStyle(
        fontSize: 16,
        color: BODY_TEXT_COLOR,
      ),
    );
  }
}

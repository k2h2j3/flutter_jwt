import 'package:flutter/material.dart';
import 'package:flutter_jwt/common/component/custom_text_form_field.dart';
import 'package:flutter_jwt/common/view/splash_screen.dart';

void main() {
  runApp(
    _App(),
  );
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 입력창 글자 폰트 수정
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      debugShowCheckedModeBanner: false, // 우상단 디버그배너 삭제
      home: SplashScreen(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_jwt/common/const/colors.dart';
import 'package:flutter_jwt/common/layout/default_layout.dart';

class RootTab extends StatelessWidget {
  const RootTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: Center(
        child: Text('Root Tab'),
      ),
    );
  }
}

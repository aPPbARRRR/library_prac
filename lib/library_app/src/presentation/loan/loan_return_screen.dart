import 'package:flutter/material.dart';

class LoanReturnScreen extends StatelessWidget {
  const LoanReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('''반납.

      상단 검색어 필드, 하단 대출 목록. 대출 목록 눌러 
      대출 싱글 페이지 이동 후 반납 수행하는 방식으로 진행.

      체크박스 활용하여 반납 완료로 표시할 것.
      
      이넘 + 드롭바로 검색옵션, 정렬옵션, 모든대출/반납완료대출/반납전대출 정할 것'''),),
    );
  }
}
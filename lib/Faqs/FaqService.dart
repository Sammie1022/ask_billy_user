import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FaqService {
  Dio dio = new Dio();

  getQuestionsFromOffice(String officeName) async {
    try {
      return await dio.post(
          'https://project-billy.herokuapp.com/getquestionsfromoffice',
          data: {"officeName": officeName},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

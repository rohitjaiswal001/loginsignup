import 'dart:convert';
import 'dart:developer';

import 'package:get/route_manager.dart';

import 'package:http/http.dart';

import '../app_routes/page_routes.dart';
import '../model/loginmodel.dart';
import '../util/email_pass_controller.dart';

class ApiService {
  callloginapi(
    var email,
  ) async {
    LoginReg? userModel;

    Response response = await post(
        Uri.parse('http://13.127.138.139/api/Login_Register_User'),
        body: {
          'mobile': email,
        });

    var jsonResponse = jsonDecode(response.body.toString());
    userModel = LoginReg.fromJson(jsonResponse);
    print(jsonResponse['token']);
    var flag = jsonResponse['data']['flag'];
    log('==========flag ===========$flag');
    //return userModel;
    var message = jsonResponse['message'];
    if (response.statusCode == 200) {
      if (flag == 'true') {
        Get.offAllNamed(PageRoutes.home);
        // t
        emailController.clear();
        print('$message');

        // moveToHome(context);

      } else {
        // server error
        print('Not Register');
      }

      // Navigator.pushNamed(context, moveToHome(context));
    }
  }

  //

  //
  callregapi(
    var email,
  ) async {
    LoginReg? userModel;

    Response response = await post(
        Uri.parse('http://13.127.138.139/api/Login_Register_User'),
        body: {
          'mobile': email,
        });

    var jsonResponse = jsonDecode(response.body.toString());
    userModel = LoginReg.fromJson(jsonResponse);
    print(jsonResponse['token']);
    var flag = jsonResponse['data']['flag'];
    log('==========flag ===========$flag');
    //return userModel;
    var message = jsonResponse['message'];
    if (response.statusCode == 200) {
      if (flag == 'false') {
        Get.offAllNamed(PageRoutes.login);
        // t
        emailController.clear();
        print('$message');

        // moveToHome(context);

      } else {
        // server error
        print('Allready registered');
      }

      // Navigator.pushNamed(context, moveToHome(context));
    }
  }
}













// class ApiService {
//   Future<List<LoginReg>> apiCalLogin(
//       Map<String, dynamic> email, password) async {
//     List<LoginReg> model = [];

//     var url = Uri.parse('http://13.127.138.139/api/Login_Register_User');
//     var response =
//         await http.post(url, body: {'email': email, 'password': password});

//     print('Response status:${response.statusCode}');
//     print('Response body:${response.body}');

//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       model = data as List<LoginReg>; // name of model class
//       return model;
//     }

//     return model;
//   }
// }















// class LoginApiResponse {
//   late final String? token;

//   final String? error;

//   LoginApiResponse(this.token, this.error);
// }

// Future apicall() async {
//   http.Response response;
//   stringResponse = http.post(Uri.parse('http://13.127.138.139/api/Login_Register_User.php'));

//     w


// }


// class ApiCall{

// void login(email, password)async{
//  http.Response response =await post( Uri.parse('http://13.127.138.139/api/Login_Register_User.php'),


// body:{'email':email,
// 'password':password} );
// } }
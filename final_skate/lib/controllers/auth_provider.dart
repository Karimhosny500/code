import 'package:final_skate/component/main_snack_bar_sucess.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_skate/router/routes_name.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool loading = false;
  User? _user;
  String? _error;
  final authAdminFormKey = GlobalKey<FormState>();
  final authUserFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future signIn(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      _user = userCredential.user;
      loading = false;
      notifyListeners();
      _error = '';
      return _user;
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  void adminLogin(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        loading = true;
        notifyListeners();
        signIn(emailController.text, passwordController.text);
        Navigator.pushNamed(context, RoutesName.home);
        // Navigator.pushNamed(context, routeName)
      } else {
        loading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
            (SnackBarWidget.MainSnackBarError(
                context, "Check your emaill/password again")));
      }
    });
  }
}

  // TextEditingController otpController = TextEditingController();

//   UserLoginResponseModel? loginResponse;

//   void adminLogin(BuildContext context) {
//     if (authAdminFormKey.currentState!.validate()) {
//       Future.delayed(const Duration(seconds: 1), () {
//         loading = true;
//         notifyListeners();
//         AdminLoginRequestModel model = AdminLoginRequestModel(
//           email: emailController.text,
//           password: passwordController.text,
//         );
//         APIService.loginAdminEnd(model).then((result) async {
//           if (result.statusCode == 201) {
//             print('result: ${result.body}');
//             AdminLoginResponseModel loginResponse =
//                 adminLoginResponseModelFromJson(result.body);
//             await LocalData.saveUserType(UserType.admin.name);
//             LocalData.saveAdminToken(loginResponse.token).whenComplete(() {
//               emailController.clear();
//               passwordController.clear();
//               loading = false;
//               notifyListeners();
//               Navigator.pushNamed(context, RoutesName.dashboardadmin);
//             });
//           } else {
//             loading = false;
//             notifyListeners();
//             // ignore: deprecated_member_use
//             Scaffold.of(context).showSnackBar((SnackBarWidget.MainSnackBarError(
//                 context, "Check your emaill/password again")));
//           }
//         });
//       });
//     }
//   }

//   void userLogin(BuildContext context) {
//     if (authUserFormKey.currentState!.validate()) {
//       loading = true;
//       notifyListeners();
//       UserLoginRequestModel model = UserLoginRequestModel(
//         phoneNumber: phoneController.text,
//       );
//       APIService.checkUserExistEnd(model).then((result) {
//         if (result.statusCode == 201) {
//           APIService.sendOTPEnd(model).then((result) async {
//             if (result.statusCode == 201) {
//               print('response: ${result.body}');
//               loading = false;
//               notifyListeners();
//               Scaffold.of(context)
//                   // ignore: deprecated_member_use
//                   .showSnackBar((SnackBarWidget.MainSnackBarSuccess(
//                       context, "Code has been sent your phone number")))
//                   .closed
//                   .whenComplete(
//                       () => {Navigator.pushNamed(context, RoutesName.otp)});
//             } else {
//               loading = false;
//               notifyListeners();
//               // ignore: deprecated_member_use
//               Scaffold.of(context).showSnackBar(
//                   (SnackBarWidget.MainSnackBarError(context, "Try again")));
//             }
//           });
//         } else if (result.statusCode == 404) {
//           loading = false;
//           notifyListeners();
//           // ignore: deprecated_member_use
//           Scaffold.of(context).showSnackBar((SnackBarWidget.MainSnackBarError(
//               context, "User doesn't exist")));
//         } else {
//           loading = false;
//           notifyListeners();
//           // ignore: deprecated_member_use
//           Scaffold.of(context).showSnackBar(
//               (SnackBarWidget.MainSnackBarError(context, "try again later")));
//         }
//       });
//     }
//   }

//   void otpConfirm(BuildContext context) {
//     if (otpFormKey.currentState!.validate()) {
//       loading = true;
//       notifyListeners();

//       UserVerifyOTPRequestModel model = UserVerifyOTPRequestModel(
//           phoneNumber: phoneController.text, otpCode: otpController.text);
//       APIService.verifyOTPEnd(model).then((result) async {
//         print('hehehr: ${result.body}');
//         loading = false;
//         notifyListeners();
//         if (result.statusCode == 201) {
//           loginResponse = userLoginResponseModelFromJson(result.body);
//           await LocalData.saveUserType(UserType.user.name);
//           LocalData.saveUserToken(loginResponse!.token).whenComplete(() {
//             LocalData.saveUserRoleId(loginResponse!.users[0].roleId)
//                 .whenComplete(() {
//               print('code2: ${loginResponse!.users[0].roleId}');
//               phoneController.clear();
//               otpController.clear();
//               Scaffold.of(context)
//                   // ignore: deprecated_member_use
//                   .showSnackBar((SnackBarWidget.MainSnackBarSuccess(
//                       context, "Successfuly logged in")))
//                   .closed
//                   .whenComplete(() =>
//                       {Navigator.pushNamed(context, RoutesName.dashboarduser)});
//             });
//           });
//         } else if (result.statusCode == 400) {
//           // ignore: deprecated_member_use
//           Scaffold.of(context).showSnackBar(
//               (SnackBarWidget.MainSnackBarError(context, "Invalide code")));
//         } else {
//           // ignore: deprecated_member_use
//           Scaffold.of(context).showSnackBar(
//               (SnackBarWidget.MainSnackBarError(context, "Try again later")));
//         }
//       });
//     }
//   }
// }

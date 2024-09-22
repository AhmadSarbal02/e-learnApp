import 'package:get/get.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/middleware/mymiddleware.dart';
import 'package:project/view/screen/aboutus.dart';

import 'package:project/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:project/view/screen/auth/login.dart';
import 'package:project/view/screen/auth/forgetpassword/resetpasswrd.dart';
import 'package:project/view/screen/auth/signup.dart';
import 'package:project/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:project/view/screen/auth/success_signup.dart';
import 'package:project/view/screen/auth/forgetpassword/verfiy.dart';
import 'package:project/view/screen/auth/verifycodesignup.dart';
import 'package:project/view/screen/courses.dart';
import 'package:project/view/screen/coursesdetails.dart';

import 'package:project/view/screen/homescreen.dart';

import 'package:project/view/screen/mycourses.dart';
import 'package:project/view/screen/myprofile.dart';
import 'package:project/view/screen/onboarding.dart';
import 'package:project/view/screen/settings.dart';
import 'package:project/view/screen/usefultips.dart';
import 'package:project/view/screen/videoplayer.dart';
import 'package:project/view/screen/videos.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const OnBorading(), middlewares: [
    MyMiddleWare(),
  ]),

  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgerPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successsignup, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.successresetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoute.verifycodesignup, page: () => const VerfiyCodeSignUp()),

//OnBoarding

//Home
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),

  GetPage(name: AppRoute.courses, page: () => const Courses()),
  GetPage(name: AppRoute.courseDetails, page: () => const CourseDetails()),
  GetPage(name: AppRoute.mycourses, page: () => const MyCourses()),
  GetPage(name: AppRoute.settings, page: () => const Settings()),
  GetPage(name: AppRoute.aboutUs, page: () => const AboutUs()),
  GetPage(name: AppRoute.usefulTips, page: () => const UsefulTips()),
  GetPage(name: AppRoute.myProfile, page: () => const MyProfile()),
  GetPage(name: AppRoute.videos, page: () => const Videos()),
  GetPage(name: AppRoute.videoPlay, page: () => const VideoPlay()),
];

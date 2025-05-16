import 'package:cholai/app/core/routes/app_routes.dart' show AppRoutes;
import 'package:cholai/app/views/auth/views/otp_view.dart';
import 'package:cholai/app/views/auth/views/profile_setup_view.dart';
import 'package:cholai/app/views/auth/views/sign_in_view.dart';
import 'package:cholai/app/views/chat/views/chat_detail_view.dart';
import 'package:cholai/app/views/contacts/view/contact_view.dart';
import 'package:cholai/app/views/dashboard/views/dashboard_view.dart';
import 'package:get/get.dart';
import '../bindings/app_bindings.dart';

List<GetPage> routes = [
  GetPage(
    name: AppRoutes.signInView,
    page: () => const SignInView(),
    binding: AppBindings(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.otpView,
    page: () => const OtpView(),
    binding: AppBindings(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.profileSetUpView,
    page: () => const ProfileSetUpView(),
    binding: AppBindings(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.dashboardView,
    page: () => const DashBoardView(),
    binding: AppBindings(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.contactView,
    page: () => const ContactView(),
    binding: AppBindings(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.chatDetailView,
    page: () => const ChatDetailView(),
    binding: AppBindings(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 200),
  ),
];

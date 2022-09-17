import 'package:ayi_connect/ui/find_service/screen/finish_registration_screen.dart';
import 'package:ayi_connect/ui/find_service/screen/professional_information_screen.dart';
import 'package:ayi_connect/ui/find_service/screen/select_role_screen.dart';
import 'package:ayi_connect/ui/find_service/screen/personal_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

var router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SelectRoleScreen(),
  ),
  GoRoute(
    path: '/personal_information',
    builder: (context, state) => const PersonalInformationScreen(),
  ),
  GoRoute(
    path: '/professional_information',
    builder: (context, state) => const ProfessionalInformationScreen(),
  ),
  GoRoute(
    path: '/finish_registration',
    builder: (context, state) => const FinishRegistrationScreen(),
  )
]);
Widget get errorPage => const Center(
      child: Text('Error'),
    );

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/extensions/app_localization.dart';
import '../../../../../core/extensions/go_router_extension.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/widgets/link_text.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.locale.signUp)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              // TODO: Replace with a more appropriate widget when backend is integrated
              SvgPicture.asset(
                'assets/images/authentication.svg',
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 80),
              TextFormField(
                decoration: InputDecoration(hintText: context.locale.firstName),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(hintText: context.locale.lastName),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(hintText: context.locale.email),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(hintText: context.locale.password),
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () {
                  context.pushNamedAndRemoveUntil(Routes.home);
                },
                child: Text(context.locale.continueAction),
              ),
              const SizedBox(height: 24),
              LinkText(
                text: context.locale.alreadyHaveAccount,
                linkText: context.locale.signIn,
                onTap: () {
                  context.pushNamedAndRemoveUntil(Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

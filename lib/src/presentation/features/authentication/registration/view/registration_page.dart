import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/extensions/app_localization.dart';
import '../../../../../core/extensions/go_router_extension.dart';
import '../../../../../core/extensions/validation.dart';
import '../../../../../core/utiliity/validation/email_validation.dart';
import '../../../../../core/utiliity/validation/password_validation.dart';
import '../../../../../core/utiliity/validation/required_validation.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/link_text.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.locale.signUp)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                // TODO: Replace with a more appropriate widget when backend is integrated
                SvgPicture.asset(
                  'assets/images/authentication.svg',
                  height: 100,
                  width: 100,
                  colorFilter: ColorFilter.mode(
                    context.color.primary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 80),
                TextFormField(
                  decoration:
                      InputDecoration(hintText: context.locale.firstName),
                  validator: context.validator.apply([
                    RequiredValidation(),
                  ]),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      InputDecoration(hintText: context.locale.lastName),
                  validator: context.validator.apply([
                    RequiredValidation(),
                  ]),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(hintText: context.locale.email),
                  validator: context.validator.apply([
                    RequiredValidation(),
                    EmailValidation(),
                  ]),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      InputDecoration(hintText: context.locale.password),
                  validator: context.validator.apply([
                    RequiredValidation(),
                    PasswordValidation(),
                  ]),
                ),
                const SizedBox(height: 32),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.pushNamedAndRemoveUntil(Routes.home);
                    }
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
      ),
    );
  }
}

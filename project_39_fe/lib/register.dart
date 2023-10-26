import 'package:flutter/material.dart';

const _horizontalPadding = 24.0;

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 2 * _horizontalPadding,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ShrineLogo(),
                  SizedBox(height: 40),
                  _UsernameTextField(),
                  SizedBox(height: 16),
                  _PasswordTextField(),
                  SizedBox(height: 24),
                  _RegisterAndNextButtons(),
                  SizedBox(height: 62),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ShrineLogo extends StatelessWidget {
  const _ShrineLogo();

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            '注册',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
        width: 480,
        child: TextField(
          textInputAction: TextInputAction.next,
          restorationId: 'username_text_field',
          cursorColor: colorScheme.onSurface,
          decoration: const InputDecoration(
            labelText: '用户名',
            labelStyle: TextStyle(
              letterSpacing: 0.04,
            ),
          ),
        ));
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
        width: 480,
        child: TextField(
          restorationId: 'password_text_field',
          cursorColor: colorScheme.onSurface,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: '密码',
            labelStyle: TextStyle(
              letterSpacing: 0.04,
            ),
          ),
        ));
  }
}

class _RegisterAndNextButtons extends StatelessWidget {
  const _RegisterAndNextButtons();

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;

    const buttonTextPadding =
        EdgeInsets.symmetric(horizontal: 24, vertical: 16);

    return Padding(
        padding: EdgeInsets.zero,
        child: OverflowBar(
            spacing: 0,
            alignment: MainAxisAlignment.end,
            children: [
              // TextButton(
              //   style: TextButton.styleFrom(
              //     shape: const BeveledRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(7)),
              //     ),
              //   ),
              //   onPressed: () {
              //     Navigator.of(context, rootNavigator: true).pop();
              //   },
              //   child: Padding(
              //     padding: buttonTextPadding,
              //     child: Text(
              //       '注册',
              //       style: TextStyle(color: colorScheme.onSurface),
              //     ),
              //   ),
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 8,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                ),
                onPressed: () {
                  throw UnimplementedError();
                },
                child: const Padding(
                  padding: buttonTextPadding,
                  child: Text(
                    '下一步',
                    style: TextStyle(
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 200, vertical: 100))
            ]));
  }
}

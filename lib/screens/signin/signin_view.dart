import 'package:caed_app/utils/assets.dart';
import 'package:caed_app/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninView extends ConsumerStatefulWidget {
  const SigninView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SigninViewState();
}

class _SigninViewState extends ConsumerState<SigninView> {
  final key = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  String get password => _password;
  set password(String value) => setState(() => _password = value);

  String get username => _username;
  set username(String value) => setState(() => _username = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            Assets.backgroundSignin,
            height: 255,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 12),
          Image.asset(Assets.smallLogo, width: 162, height: 40),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildForm(),
          ),
          const Spacer(),
          InkWell(
            onTap: onSubmit,
            child: Container(
              height: 55,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.yellow,
              ),
              child: const Center(
                  child: Text(
                'Entrar',
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
            ),
          )
        ],
      ),
    );
  }

  void onSubmit() {
    if (key.currentState?.validate() ?? false) {
      // TODO add navigation to next view
    }
  }

  Widget _buildForm() {
    return Form(
      key: key,
      child: Column(
        children: [
          Input(
            label: 'Usuário',
            onChanged: (v) => username = v,
            validator: (v) =>
                v != null && v == '' ? 'Preencha o usuário' : null,
          ),
          const SizedBox(height: 30),
          Input(
            label: 'Senha',
            isPassword: true,
            onChanged: (v) => password = v,
            validator: (v) => v != null && v == '' ? 'Preencha a senha' : null,
          )
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotato/constants.dart';
import 'package:spotato/models/user_type_enum.dart';
import 'package:spotato/pages/home_page.dart';
import 'package:spotato/pages/registration_page.dart';
import 'package:spotato/services/user_service.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  var _userType = UserType.client;

  void _connect() async {
    setState(() {
      _isLoading = true;
    });

    final res = await ref.read(userServiceProvider).login(
          _usernameController.text,
          _passwordController.text,
          _userType,
        );

    setState(() {
      _isLoading = false;
    });

    res.fold(
      (l) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.message),
          ),
        );
      },
      (r) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
    );
  }

  void _goToRegistrationPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegistrationPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(
                size: 100,
              ),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Nom d\'utilisateur',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: verticalDividerHeight),
              DropdownButton<UserType>(
                isExpanded: true,
                value: _userType,
                items: const [
                  DropdownMenuItem(
                    value: UserType.spotter,
                    child: Text('Spotter'),
                  ),
                  DropdownMenuItem(
                    value: UserType.client,
                    child: Text('Client'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _userType = value!;
                  });
                },
              ),
              const SizedBox(
                height: verticalDividerHeight,
              ),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _connect,
                      style: ElevatedButton.styleFrom(
                        primary: Palette.primaryColor,
                      ),
                      child: const Text('Se connecter',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            // color: Colors.white,
                          )),
                    ),
              TextButton(
                onPressed: _goToRegistrationPage,
                child: const Text(
                  'Pas encore inscrit? Veuillez vous inscrire ici.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Palette.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

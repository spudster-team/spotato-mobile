import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotato/models/user_model.dart';
import 'package:spotato/models/user_type_enum.dart';
import 'package:spotato/pages/login_page.dart';
import 'package:spotato/services/user_service.dart';

import '../constants.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool _isLoading = false;
  var _userType = UserType.client;

  void _register() async {
    setState(() {
      _isLoading = true;
    });

    final user = UserModel(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      phone: _phoneNumberController.text,
      email: _emailController.text,
      username: _usernameController.text,
      password: _passwordController.text,
    );

    final res = await ref.read(userServiceProvider).register(user, _userType);

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
            builder: (context) => const LoginPage(),
          ),
        );
      },
    );

    setState(() {
      _isLoading = false;
    });
  }

  void _goToLoginPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
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
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  // TODO : Limité à un numéro malgache et un numéro airtel
                  labelText: 'Numéro de téléphone',
                  prefixIcon: Icon(Icons.phone_android),
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
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirmation de Mot de passe',
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
              const SizedBox(height: verticalDividerHeight),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        primary: Palette.primaryColor,
                      ),
                      child: const Text('S\'inscrire',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            // color: Colors.white,
                          )),
                    ),
              TextButton(
                onPressed: _goToLoginPage,
                child: const Text(
                  'Déjà inscrit(e)? Veuillez vous connecter ici.',
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

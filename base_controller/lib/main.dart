import 'package:base_controller/base_core/base_state.dart';
import 'package:base_controller/controllers/auth_controller_example.dart';
import 'package:base_controller/entities/state/auth_state.dart';
import 'package:base_controller/utilities/keys.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _authController = AuthController();

  @override
  void initState() {
    _authController.checkIsLogged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _authController,
        builder: (_, state, child) {
          switch (state) {
            case LoadingState():
              return const Center(
                child: CircularProgressIndicator(),
              );

            case UnloggedState():
              return Center(
                child: Column(
                  children: [
                    const Text(
                      "Unlogged",
                    ),
                    ElevatedButton(
                      onPressed: _authController.login,
                      child: const Text("Logar"),
                      key: login_button_key,
                    )
                  ],
                ),
              );
            case LoggedState():
              return Center(
                child: Column(
                  children: [
                    Text("Olá, ${state.user.name}"),
                    ElevatedButton(
                      onPressed: _authController.logout,
                      key: logout_button_key,
                      child: const Text("Logout"),
                    )
                  ],
                ),
              );
            default:
              return const Center(
                child: Text("An error Occurred"),
              );
          }
        },
      ),
    );
  }
}

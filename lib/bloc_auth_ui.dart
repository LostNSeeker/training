import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traning/bloc_auth.dart';
import 'package:traning/bloc_auth_event.dart';
import 'package:traning/bloc_auth_state.dart';

class BlocLoginPage extends StatelessWidget {
  const BlocLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Panel'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            // dialog box
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            width: 16,
                          ),
                          Text('Loading')
                        ],
                      ),
                    ),
                  );
                });
          }
          if (state is AuthError) {
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is Authenticated) {
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Logged in as ${state.username}')));
          }
          if (state is Unauthenticated) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Logged out')));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is Authenticated) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  authBloc.add(LogoutEvent());
                },
                child: Text('Logout'),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    onChanged: (value) {},
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final username = usernameController.text;
                        final password = passwordController.text;

                        authBloc.add(LoginEvent(username, password));
                      },
                      child: Text('Login'))
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapi/logic/bloc/login_bloc.dart';
import 'package:kapi/screens/kavita_login_screen.dart';
import '../../data/kavita/repositories/account_repository.dart';
import '../components/scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => AccountRepository(), child: MyScaffold());
  }
}

class MyBody extends StatelessWidget {
  const MyBody({
    Key? key,
    required this.loginData,
  }) : super(key: key);

  final Map<String, dynamic> loginData;

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = LoginBloc(context.read<AccountRepository>());

    return BlocBuilder<LoginBloc, LoginState>(
        bloc: loginBloc,
        builder: (context, state) {
          if (state is LoginInitial) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        ChoiceChip(label: Text('something'), selected: false),
                        ChoiceChip(label: Text('something'), selected: false),
                      ]),
                    ),
                    Text(state.toString()),
                    ElevatedButton(
                        onPressed: () =>
                            loginBloc.add(LoadLoginEvent(loginData: loginData)),
                        child: const Text('Press me')),
                    ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KavitaLogin())),
                        child: Text('Add Kavita'))
                  ]),
            );
          }
          if (state is LoginLoaded) {
            return Center(child: Text(state.loginDto.username!));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

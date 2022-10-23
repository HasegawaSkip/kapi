import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kapi/data/kavita/repositories/account_repository.dart';
// import 'package:kapi/data/repositories/server_repository.dart';
import 'package:kapi/logic/cubit/server_cubit.dart';

import '../../logic/bloc/login_bloc.dart';

class KavitaLoginModal extends StatelessWidget {
  const KavitaLoginModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServerCubit(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   leading: Container(
        //       alignment: FractionalOffset.topRight,
        //       padding: const EdgeInsets.symmetric(vertical: 12),
        //       child: const Image(
        //           image: AssetImage(
        //               'assets/icons/favicon.ico'))), // ,Icon(Icons.home, color: Color(0xff4ac694)),
        //   backgroundColor: Colors.black,
        // ),
        body: const LoginModal(),
      ),
    );
  }
}

class LoginModal extends StatelessWidget {
  const LoginModal({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final urlController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return SingleChildScrollView(
      child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff4ac694),
            // borderRadius: BorderRadius.circular(8)
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(children: [
              // 'Login' label
              // const Text('Add Kavita',
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.w400,
              //         fontSize: 38)),
              const SizedBox(height: 15),
              // TextFormField 'Name'
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'My Kavita'),
                    ),
                  )),
              const SizedBox(height: 15),
              // TextFormField 'Url'
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.url,
                      controller: urlController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'https://demo.kavitareader.com'),
                    ),
                  )),
              const SizedBox(height: 5),
              const Divider(height: 15, color: Colors.white),
              const SizedBox(height: 5),
              // TextFormField 'username'
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      controller: usernameController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'demouser'),
                    ),
                  )),
              const SizedBox(height: 15),
              // TextFormField 'password'
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Demouser64',
                      ),
                    ),
                  )),
              const SizedBox(height: 15),
              // 'Forgot Password?' button
              // Container(
              //     padding: const EdgeInsets.all(15),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     child: const Center(
              //         child: Text(
              //       'Forgot Password?',
              //       style: TextStyle(
              //           color: Colors.white,
              //           decoration: TextDecoration.underline),
              //     ))),
              const SizedBox(height: 15),
              // 'Submit' button
              Material(
                color: const Color(0xff424c72),
                child: InkWell(
                  onTap: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (context) =>
                    // SimpleDialog(
                    //       title: Text('Title'),
                    //     ));
                    // print(Server(
                    //       name: _nameController.text,
                    //       url: _urlController.text,
                    //       username: _userrnameController.text,
                    //       password: _passwordController.text));

                    // loginBloc.add(LoadLoginEvent(loginData: {
                    //   "username": usernameController.text,
                    //   "password": passwordController.text
                    // }));
                    context.read<ServerCubit>().addServer(
                        serverName: nameController.text,
                        url: urlController.text,
                        username: usernameController.text,
                        password: passwordController.text);

                    Navigator.pop(context);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.transparent),
                      child: const Center(
                          child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapi/screens/discover_screen.dart';
import 'package:kapi/screens/search_screen.dart';
import '../../data/models/server.dart';
import '../../logic/cubit/server_cubit.dart';
import '../settings_screen.dart';
import '../home_screen.dart';
import 'kavita_login_modal.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int _selectedIndex = 0;
  // final _pageViewController = PageController();

  // @override
  // void dispose() {
  //   _pageViewController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> loginData = {
      "username": "YOUR_USERNAME",
      "password": "YOUR_PASSWORD"
    };

    void _onItemTapped(int index) {
      // _pageViewController.animateToPage(index,
      //     duration: Duration(microseconds: 200), curve: Curves.easeInOut);
      setState(() {
        _selectedIndex = index;
      });
    }

    return BlocProvider(
      create: (context) => ServerCubit()..getCurrentServer(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kapi', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: (() => _buildAccountPickerModal(context)),
              icon: CircleAvatar(
                backgroundColor: Color(0xff4ac694),
                child: BlocBuilder<ServerCubit, ServerState>(
                  builder: (context, state) {
                    if (state is CurrentServerFetched) {
                      return Text(
                        state.server.name.substring(0, 1),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      );
                    }
                    return Text(
                      'Ka',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    );
                  },
                ),
              ),
            )
          ],
        ),
        body:
            // Text('asd'),
            // PageView(
            //     controller: _pageViewController,
            // physics: NeverScrollableScrollPhysics(),
            IndexedStack(
          index: _selectedIndex,
          children: [
            MyHomeScreen(),
            MySearchScreen(),
            MyDiscoverScreen(),
            SettingsScreen()
          ],
        ),
        // onPageChanged: (index) => setState(() {
        //       _selectedIndex = index;
        //     })),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.search),
                icon: Icon(Icons.search_outlined),
                label: 'Search'),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.explore),
                icon: Icon(Icons.explore_outlined),
                label: 'Discover'),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.settings),
                icon: Icon(Icons.settings_outlined),
                label: 'Setttings')
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

void _buildAccountPickerModal(context) => showDialog(
    context: context,
    builder: ((context) {
      return BlocProvider(
        create: (context) => ServerCubit()..getCurrentServer(),
        child: BlocBuilder<ServerCubit, ServerState>(
          builder: (context, state) {
            if (state is CurrentServerFetched) {
              return SimpleDialog(
                children: [
                  //SingleChildScrollView(
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          Flexible(
                              child: Text(
                            'Select account',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          )),
                          const SizedBox.shrink(),
                          const SizedBox.shrink(),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      _buildAccountPickerDefault(),
                      const Divider(
                        thickness: 1,
                      ),
                      _buildAccountPickerList(),
                      _buildAccountAddButton()
                    ],
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      );
    }));

class _buildAccountPickerDefault extends StatelessWidget {
  const _buildAccountPickerDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ServerCubit()..getCurrentServer(),
        child: BlocBuilder<ServerCubit, ServerState>(
          builder: (context, state) {
            if (state is CurrentServerFetched) {
              return ServerTile(state.server);
            }
            return ListTile(
              title: Text('asd'),
            );
          },
        ));
  }
}

class _buildAccountPickerList extends StatelessWidget {
  const _buildAccountPickerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();
    return BlocProvider(
      create: (context) => ServerCubit()..getServers(),
      child: BlocBuilder<ServerCubit, ServerState>(builder: (context, state) {
        if (state is ServersFetched) {
          double height =
              MediaQuery.of(context).size.height / (11 / state.servers.length);
          return SizedBox(
            width: double.maxFinite,
            height: height,
            child: Scrollbar(
              controller: _controller,
              thumbVisibility: true,
              child: ListView.builder(
                  controller: _controller,
                  itemCount: state.servers.length,
                  itemBuilder: ((context, index) {
                    Server server = state.servers[index];
                    return ServerTile(server);
                  })),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}

class ServerTile extends StatelessWidget {
  const ServerTile(
    this.server, {
    Key? key,
  }) : super(key: key);

  final Server server;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          context.read<ServerCubit>().setCurrentServer(server);
          Navigator.pop(context);
        },
        leading: CircleAvatar(
            backgroundColor: const Color(0xff4ac694),
            child: Text(
              server.username.isEmpty ? 'K' : server.username.substring(0, 1),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            )),
        title: Text('${server.name} (${server.username})'),
        subtitle: Text(server.url),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          // IconButton(
          //   iconSize: 20,
          //   onPressed: () => print('Edit button'),
          //   icon: const Icon(
          //     Icons.edit,
          //     color: Colors.black,
          //   ),
          // ),
          IconButton(
            iconSize: 20,
            onPressed: () =>
                context.read<ServerCubit>().removeServer(server.key),
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
        ]));
  }
}

class _buildAccountAddButton extends StatelessWidget {
  const _buildAccountAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.person_add_alt_rounded),
      label: const Text('Add Kavita'),
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xff4ac694)),
      onPressed: () => showModalBottomSheet(
          context: context,
          builder: ((context) {
            return const KavitaLoginModal();
          })),
    );
  }
}

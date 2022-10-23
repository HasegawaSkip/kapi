import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kapi/logic/cubit/server_cubit.dart';
import 'package:kapi/logic/cubit/server_cubit.dart';
// import 'package:kapi/screens/search_screen.dart';
import 'components/kavita_login_modal.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ServerCubit serverCubit = ServerCubit();

    return BlocProvider(
      create: (context) => ServerCubit()..getServers(),
      child: _buildAccountList(),
    );
  }
}

class _buildAccountList extends StatelessWidget {
  const _buildAccountList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<ServerCubit>().getServers(),
      child: BlocConsumer<ServerCubit, ServerState>(
          // bloc: ServerCubit()..getServers(),
          listener: (context, state) {
        if (state is ServerReady) {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: ((context) => MySearchScreen())));
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Loaded')));
        }
      }, builder: (context, state) {
        if (state is ServersEmpty) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff4ac694)),
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: ((context) {
                    return const KavitaLoginModal();
                  })),
              child: const Text('Add Kavita'));
        }
        if (state is ServersFetched) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.servers.length,
                      itemBuilder: ((context, index) {
                        final server = state.servers[index];
                        return Card(
                            child: ListTile(
                          onTap: () {
                            context
                                .read<ServerCubit>()
                                .setCurrentServer(server);
                          },
                          title: Text(server.name),
                          subtitle: Text(server.url),
                          leading: BlocBuilder<ServerCubit, ServerState>(
                            bloc: ServerCubit()..getCurrentServer(),
                            builder: (context, state) {
                              if (state is CurrentServerFetched) {
                                return state.server.key == server.key
                                    ? const Icon(Icons.check_circle,
                                        color: Colors.green)
                                    : const SizedBox.shrink();
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),
                          trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                              onPressed: () => context
                                  .read<ServerCubit>()
                                  .removeServer(server.key)),
                        ));
                      })),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xff4ac694)),
                    onPressed: () =>
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => KavitaLogin()))
                        showModalBottomSheet(
                            // isScrollControlled: true,
                            context: context,
                            builder: ((context) {
                              return const KavitaLoginModal();
                            })),
                    child: const Text('Add Kavita')),
              ],
            ),
          );
        } else {
          return Center(child: Text(state.toString()));
        }
      }),
    );
  }
}

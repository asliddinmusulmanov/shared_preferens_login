import 'package:flutter/material.dart';
import 'package:shared_preferans_login/main.dart';

class HomePage extends StatefulWidget {
  final int index;
  const HomePage({super.key, required this.index});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> users = prefs.getStringList('users') ?? [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                int slashindex = users[widget.index].indexOf('/');
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircleAvatar(),
                            Text(users[widget.index].substring(0, slashindex)),
                            Text(users[widget.index].substring(slashindex + 1)),
                          ],
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.person)),
        ],
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            int slashindex = users[index].indexOf('/');
            String email = users[index].substring(0, slashindex);
            return ListTile(
              title: Text(email),
              subtitle: Text(users[index].substring(slashindex + 1)),
            );
          }),
    );
  }
}

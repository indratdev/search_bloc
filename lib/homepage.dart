import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_bloc/bloc/user_bloc.dart';
import 'package:search_bloc/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Datum> masterData = [];
  final _userBl = UserBloc();

  @override
  void initState() {
    super.initState();
    _userBl.add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    final _userBloc = BlocProvider.of<UserBloc>(context);

    print(">>> masterData  : ${masterData.length}");
    print("-------------------------------------");
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(hintText: "Ketik"),
          onChanged: (value) {
            context.read<UserBloc>().add(filterUserEvent(
                  text: value,
                  master: masterData,
                ));
          },
        ),
        BlocBuilder<UserBloc, UserState>(
          bloc: _userBloc,
          builder: (context, state) {
            if (state is SuccessGetUser) {
              print(">>> state SuccessGetUser run...");
              masterData = state.data;
              List<Datum> users = state.data;
              return ListUserWidget(listDataUser: users);
            }
            if (state is SuccessFilterUser) {
              print(">>> state SuccessFilterUser run...");
              List<Datum> users = state.data;
              return ListUserWidget(listDataUser: users);
            }

            return Text("tidak ada data");
          },
        )
      ]),
    );
  }
}

class ListUserWidget extends StatelessWidget {
  List<Datum> listDataUser;

  ListUserWidget({
    Key? key,
    required this.listDataUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: listDataUser.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.home),
          title: Text(listDataUser[index].firstName),
        );
      },
    ));
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_ant_pack/src/bloc/mainBloc/main_bloc.dart';
import 'package:prueba_ant_pack/src/bloc/mainBloc/main_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is ShowData) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Users"),
              centerTitle: true,
            ),
            body: Center(
                child: ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => new AlertDialog(
                        title: new Text(
                          '${state.users[index].name}',
                          textAlign: TextAlign.center,
                        ),
                        content: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 120.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "https://source.unsplash.com/random/200x200?sig=$index",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      boxShadow: [
                                        new BoxShadow(
                                          color: Color(0xffA4A4A4),
                                          offset: Offset(1.0, 5.0),
                                          blurRadius: 3.0,
                                        ),
                                      ]),
                                ),
                                Spacer(),
                                Text(
                                  "Email: ${state.users[index].email}",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Spacer(),
                                Text("City: ${state.users[index].address.city}",
                                    style: TextStyle(fontSize: 20)),
                                Spacer(),
                                Text(
                                    "company Name: ${state.users[index].company.name}",
                                    style: TextStyle(fontSize: 20)),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop(); // dismisses only the dialog and returns nothing
                            },
                            child: new Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  leading: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://source.unsplash.com/random/200x200?sig=$index",
                          ),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          new BoxShadow(
                            color: Color(0xffA4A4A4),
                            offset: Offset(1.0, 5.0),
                            blurRadius: 3.0,
                          ),
                        ]),
                  ),
                  title: Text(state.users[index].name),
                  trailing: Icon(Icons.arrow_forward),
                );
              },
            )),
          );
        }
        return Center(
          child: Image.asset("images/progress.gif"),
        );
      },
    );
  }
}

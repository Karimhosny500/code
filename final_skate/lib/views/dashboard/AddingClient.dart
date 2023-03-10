import 'package:final_skate/component/main_button.dart';
import 'package:final_skate/component/main_text_field_no_icon.dart';
import 'package:final_skate/router/routes_name.dart';

import 'package:final_skate/views/dashboard/services.dart';
import 'package:final_skate/views/home.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'Clients.dart';

class addingClient extends StatefulWidget {
  const addingClient({super.key});

  @override
  State<addingClient> createState() => _addingClientState();
}

class _addingClientState extends State<addingClient> {
  TextEditingController clname = TextEditingController();

  TextEditingController cldate = TextEditingController();

  TextEditingController clyear = TextEditingController();

  TextEditingController clparentname = TextEditingController();

  TextEditingController clnumber = TextEditingController();

  DatabaseService serv = DatabaseService();

  TextEditingController clsession = TextEditingController();

  TextEditingController clstartdate = TextEditingController();

  TextEditingController clcoursetime = TextEditingController();

  TextEditingController clbirthday = TextEditingController();

  TextEditingController clcoach = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return ListTile(
                leading: const Text("Name: "),
                title: Card(
                    child: MainTextFieldNoIcon(
                        hintText: 'Name',
                        textEditingController: clname,
                        prefixIconExist: false)));
          } else if (index == 1) {
            return ListTile(
                leading: const Text("Date: "),
                title: Card(
                    child: MainTextFieldNoIcon(
                        hintText: 'Date',
                        textEditingController: cldate,
                        prefixIconExist: false)));
          } else if (index == 2) {
            return ListTile(
                leading: const Text("parentName: "),
                title: Card(
                    child: MainTextFieldNoIcon(
                        hintText: 'parentName',
                        textEditingController: clparentname,
                        prefixIconExist: false)));
          } else if (index == 3) {
            return ListTile(
                leading: const Text("number: "),
                title: Card(
                    child: MainTextFieldNoIcon(
                        hintText: 'number',
                        textEditingController: clnumber,
                        prefixIconExist: false)));
          } else if (index == 4) {
            return ListTile(
                leading: const Text("year: "),
                title: Card(
                    child: MainTextFieldNoIcon(
                        hintText: 'year',
                        textEditingController: clyear,
                        prefixIconExist: false)));
          } else if (index == 5) {
            return ListTile(
                leading: const Text("birthDay: "),
                title: Card(
                    child: MainTextFieldNoIcon(
                        hintText: 'birthDay',
                        textEditingController: clbirthday,
                        prefixIconExist: false)));
          } else if (index == 6) {
            return ListTile(
                leading: const Text("startDate: "),
                title: Card(
                    child: MainTextFieldNoIcon(
                        hintText: 'startDate',
                        textEditingController: clstartdate,
                        prefixIconExist: false)));
          } else if (index == 7) {
            return ListTile(
                leading: const Text("session: "),
                title: Card(
                    child: MainTextFieldNoIcon(
                        hintText: 'session',
                        textEditingController: clsession,
                        prefixIconExist: false)));
          } else if (index == 8) {
            return ListTile(
                leading: const Text("courseTime: "),
                title: Card(
                    child: MainTextFieldNoIcon(
                        hintText: 'CourseTime',
                        textEditingController: clcoursetime,
                        prefixIconExist: false)));
          } else if (index == 9) {
            return ListTile(
                leading: const Text("coach: "),
                title: Card(
                    child: MainTextFieldNoIcon(
                  hintText: 'Coach Name',
                  textEditingController: clcoach,
                  prefixIconExist: false,
                )
                    // child: TextFormField(
                    //   controller: clcoach,
                    //   autofocus: true,
                    //   autovalidateMode: AutovalidateMode.always,
                    // ),
                    ));
          } else if (index == 10) {
            return Column(
              children: [
                Row(
                  children: [
                    MainButton(
                        isLoading: false,
                        text: "Add",
                        onPressed: () async {
                          Clients cl = Clients(
                              id: const Uuid().v4(),
                              date: cldate.text,
                              name: clname.text,
                              parentName: clparentname.text,
                              number: clnumber.text,
                              year: int.parse(clyear.text),
                              startDate: clstartdate.text,
                              courseTime: clcoursetime.text,
                              coach: clcoach.text,
                              birthDay: clbirthday.text,
                              session: clsession.text);
                          await serv.addClients(cl);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => homepage(index: 0),
                              ));
                        }),
                    MainButton(
                      isLoading: false,
                      text: "Back",
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => homepage(index: 0),
                            ));
                      },
                    )
                  ],
                ),
              ],
            );
          }
        },
        itemCount: 11);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_skate/views/dashboard/Clients.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class buildDataGrid extends StatelessWidget {
  buildDataGrid({super.key});

  late ClientsDataSource clientsDataSource;
  List<Clients> clientData = [];

  TextEditingController searchquery = TextEditingController();
  List<Clients> allclient = [];
  List<Clients> results = [];
  final getData = FirebaseFirestore.instance.collection('Clients').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getData,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        // print(results);

        if (snapshot.hasData) {
          if (clientData.isNotEmpty && results.isEmpty) {
            for (var data in snapshot.data!.docChanges) {
              if (data.type == DocumentChangeType.modified) {
                if (data.oldIndex == data.newIndex) {
                  clientsDataSource.dataGridRows[data.oldIndex] =
                      getDataGridRowFromDataBase(data);
                }
                clientsDataSource.updateDataGridSource();
              } else if (data.type == DocumentChangeType.added) {
                clientsDataSource.dataGridRows
                    .add(getDataGridRowFromDataBase(data));
                clientsDataSource.updateDataGridSource();
              } else if (data.type == DocumentChangeType.removed) {
                clientsDataSource.dataGridRows.removeAt(data.oldIndex);
                clientsDataSource.updateDataGridSource();
              }
            }
          } else if (clientData.isEmpty && results.isEmpty) {
            for (var data in snapshot.data!.docs) {
              clientData.add(Clients(
                  id: data.id,
                  name: data['name'],
                  date: data['date'],
                  coach: data['coach'],
                  number: data['number'],
                  parentName: data['parentName'],
                  startDate: data['startDate'],
                  year: data['year'],
                  courseTime: data['courseTime'],
                  birthDay: data['birthDay'],
                  session: data['session']));
            }
            clientsDataSource = ClientsDataSource(clientData);
          } else if (clientData.isNotEmpty && results.isNotEmpty) {
            // clientsDataSource.clientsData.clear();

            clientsDataSource.updateDataGridSource();

            clientsDataSource = ClientsDataSource(results);
            clientsDataSource._buildDataRow();
            clientsDataSource.updateDataGridSource();
          }
          return SfDataGridTheme(
              data: SfDataGridThemeData(
                  brightness: Brightness.light,
                  gridLineColor: Colors.black45,
                  gridLineStrokeWidth: 4,
                  filterIconColor: Colors.white),
              child: SfDataGrid(
                source: clientsDataSource,
                allowColumnsResizing: true,
                allowFiltering: true,
                // onCellTap: (details) {
                //   List test = clientsDataSource
                //       .dataGridRows[details.rowColumnIndex.rowIndex - 1]
                //       .getCells()
                //       .map((e) => e.value)
                //       .toList();
                //   // print(test);
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => editClient(
                //               cellid: test[0],
                //               cellname: test[1],
                //               celldate: test[2],
                //               cellyear: test[3],
                //               cellnumber: test[4],
                //               cellparentname: test[5],
                //               cellstartdate: test[6],
                //               cellbirthday: test[7],
                //               cellsession: test[8],
                //               cellcoursetime: test[9],
                //               cellcoach: test[10],
                //             )),
                //   );

                //   // setState(() {
                //   //   print(cellcont.selectedRows=[0]);
                //   // });

                //   // print(details[details.rowColumnIndex.rowIndex][0]);
                // },
                allowMultiColumnSorting: true,
                gridLinesVisibility: GridLinesVisibility.both,
                headerGridLinesVisibility: GridLinesVisibility.both,
                allowSorting: true,
                highlightRowOnHover: true,
                columns: getColumns,
                columnWidthMode: ColumnWidthMode.fill,
                columnResizeMode: ColumnResizeMode.onResize,
                navigationMode: GridNavigationMode.row,
                selectionMode: SelectionMode.single,
              ));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

getDataGridRowFromDataBase(DocumentChange<Object?> data) {
  return DataGridRow(
    cells: [
      // DataGridCell(
      //   columnName: 'id',
      //   value: data.doc.id,
      // ),
      DataGridCell(
        columnName: 'Name',
        value: data.doc['name'],
      ),
      DataGridCell(columnName: 'Date', value: data.doc['date']),
      // DataGridCell(columnName: 'Year', value: data.doc["year"]),
      // DataGridCell(columnName: 'Number', value: data.doc["number"]),
      // DataGridCell(columnName: 'ParentsName', value: data.doc["parentName"]),
      // DataGridCell(columnName: 'SDate', value: data.doc["startDate"]),
      // DataGridCell(columnName: 'BDate', value: data.doc["birthDay"]),
      // DataGridCell(columnName: 'Session', value: data.doc["session"]),
      // DataGridCell(columnName: 'CourseTime', value: data.doc["courseTime"]),
      // DataGridCell(columnName: 'Coach', value: data.doc["coach"]),
    ],
  );
}

class ClientsDataSource extends DataGridSource {
  ClientsDataSource(this.clientsData) {
    _buildDataRow();
  }

  List<DataGridRow> dataGridRows = [];
  List<Clients> clientsData;
  void _buildDataRow() {
    dataGridRows = clientsData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              // DataGridCell(columnName: 'id', value: e.id),
              DataGridCell(columnName: 'Name', value: e.name),
              // DataGridCell(columnName: 'Date', value: e.date),
              // DataGridCell(columnName: 'Year', value: e.year),
              // DataGridCell(columnName: 'Number', value: e.number),
              // DataGridCell(columnName: 'ParentsName', value: e.parentName),
              // DataGridCell(columnName: 'SDate', value: e.startDate),
              // DataGridCell(columnName: 'BDate', value: e.birthDay),
              // DataGridCell(columnName: 'Session', value: e.session),
              // DataGridCell(columnName: 'CourseTime', value: e.courseTime),
              // DataGridCell(columnName: 'Coach', value: e.coach),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(
    DataGridRow row,
  ) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}

List<GridColumn> get getColumns {
  return <GridColumn>[
    // columnn('id', true),
    columnn('name', false),
    // columnn('date', false),
    // columnn('year', false),
    // columnn('number', false),
    // columnn('parentsName', false),
    // columnn('startDate', false),
    // columnn('birthDay', false),
    // columnn('session', false),
    // columnn('courseTime', false),
    // columnn('coach', false)
  ];
}

GridColumn columnn(String name, bool visible) {
  return GridColumn(
      visible: visible,
      columnName: name,
      label: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerRight,
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
        ),
      ));
}

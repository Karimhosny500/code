import 'package:final_skate/views/home.dart';
import 'package:flutter/material.dart';
import 'package:final_skate/views/dashboard/crud/BuildGrid.dart';

// import 'AddingClient.dart';
// import 'editingClient.dart';
class ViewClient extends StatefulWidget {
  const ViewClient({super.key});

  @override
  State<ViewClient> createState() => _ViewClientState();
}

class _ViewClientState extends State<ViewClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildDataGrid(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          // Navigator.pushNamed(context,homepage(
          //   index: 1,
          // ));

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => homepage(
                  index: 1,
                ),
              ));
        });
      }),
    );
  }
}
// class ViewClient extends StatefulWidget {
//   ViewClient({
//     Key? key,
//   }) : super(key: key);

//   @override
//   ViewClientState createState() => ViewClientState();
// }

// class ViewClientState extends State<ViewClient> {
//   late ClientsDataSource clientsDataSource;
//   List<Clients> clientData = [];
//   DataGridController cellcont = DataGridController();
//   TextEditingController searchquery = TextEditingController();
//   List<Clients> allclient = [];
//   List<Clients> results = [];
//   // TextEditingController clname = TextEditingController();
//   final getData = FirebaseFirestore.instance.collection('Clients').snapshots();

//   // Widget _buildDataGrid() {
//   //   return StreamBuilder<QuerySnapshot>(
//   //     stream: getData,
//   //     builder: (context, snapshot) {
//   //       // print(results);

//   //       if (snapshot.hasData) {
//   //         if (clientData.isNotEmpty && results.isEmpty) {
//   //           for (var data in snapshot.data!.docChanges) {
//   //             if (data.type == DocumentChangeType.modified) {
//   //               if (data.oldIndex == data.newIndex) {
//   //                 clientsDataSource.dataGridRows[data.oldIndex] =
//   //                     getDataGridRowFromDataBase(data);
//   //               }
//   //               clientsDataSource.updateDataGridSource();
//   //             } else if (data.type == DocumentChangeType.added) {
//   //               clientsDataSource.dataGridRows
//   //                   .add(getDataGridRowFromDataBase(data));
//   //               clientsDataSource.updateDataGridSource();
//   //             } else if (data.type == DocumentChangeType.removed) {
//   //               clientsDataSource.dataGridRows.removeAt(data.oldIndex);
//   //               clientsDataSource.updateDataGridSource();
//   //             }
//   //           }
//   //         } else if (clientData.isEmpty && results.isEmpty) {
//   //           for (var data in snapshot.data!.docs) {
//   //             clientData.add(Clients(
//   //                 id: data.id,
//   //                 name: data['Name'].toString(),
//   //                 date: data['Date'],
//   //                 coach: data['Coach'],
//   //                 number: data['PhoneNumber'],
//   //                 parentName: data['ParentName'],
//   //                 startDate: data['Startdate'],
//   //                 year: data['Year'],
//   //                 courseTime: data['Coursetime'],
//   //                 birthDay: data['Birthday'],
//   //                 session: data['session']));
//   //           }
//   //           clientsDataSource = ClientsDataSource(clientData);
//   //         } else if (clientData.isNotEmpty && results.isNotEmpty) {
//   //           // clientsDataSource.clientsData.clear();

//   //           clientsDataSource.updateDataGridSource();

//   //           clientsDataSource = ClientsDataSource(results);
//   //           clientsDataSource._buildDataRow();
//   //           clientsDataSource.updateDataGridSource();
//   //         }
//   //         return SfDataGridTheme(
//   //             data: SfDataGridThemeData(
//   //                 brightness: Brightness.light,
//   //                 headerHoverColor: Colors.deepOrange.withOpacity(0.3),
//   //                 gridLineColor: Colors.black45,
//   //                 gridLineStrokeWidth: 4,
//   //                 headerColor: Colors.blue,
//   //                 filterIconColor: Colors.white),
//   //             child: SfDataGrid(
//   //               source: clientsDataSource,
//   //               allowColumnsResizing: true,
//   //               allowFiltering: true,
//   //               // onCellTap: (details) {
//   //               //   List test = clientsDataSource
//   //               //       .dataGridRows[details.rowColumnIndex.rowIndex - 1]
//   //               //       .getCells()
//   //               //       .map((e) => e.value)
//   //               //       .toList();
//   //               //   // print(test);
//   //               //   Navigator.push(
//   //               //     context,
//   //               //     MaterialPageRoute(
//   //               //         builder: (context) => editClient(
//   //               //               cellid: test[0],
//   //               //               cellname: test[1],
//   //               //               celldate: test[2],
//   //               //               cellyear: test[3],
//   //               //               cellnumber: test[4],
//   //               //               cellparentname: test[5],
//   //               //               cellstartdate: test[6],
//   //               //               cellbirthday: test[7],
//   //               //               cellsession: test[8],
//   //               //               cellcoursetime: test[9],
//   //               //               cellcoach: test[10],
//   //               //             )),
//   //               //   );

//   //               //   // setState(() {
//   //               //   //   print(cellcont.selectedRows=[0]);
//   //               //   // });

//   //               //   // print(details[details.rowColumnIndex.rowIndex][0]);
//   //               // },
//   //               allowMultiColumnSorting: true,
//   //               gridLinesVisibility: GridLinesVisibility.both,
//   //               headerGridLinesVisibility: GridLinesVisibility.both,
//   //               allowSorting: true,
//   //               highlightRowOnHover: true,
//   //               columns: getColumns,
//   //               columnWidthMode: ColumnWidthMode.fill,
//   //               columnResizeMode: ColumnResizeMode.onResize,
//   //               navigationMode: GridNavigationMode.row,
//   //               selectionMode: SelectionMode.single,
//   //             ));
//   //       } else {
//   //         return const Center(
//   //           child: CircularProgressIndicator(),
//   //         );
//   //       }
//   //     },
//   //   );
//   // }

//   // to update the value changed at runtime
//   // getDataGridRowFromDataBase(DocumentChange<Object?> data) {
//   //   return DataGridRow(
//   //     cells: [
//   //       DataGridCell(
//   //         columnName: 'id',
//   //         value: data.doc.id,
//   //       ),
//   //       DataGridCell(columnName: 'Name', value: data.doc['Name']),
//   //       DataGridCell(columnName: 'Date', value: data.doc['Date']),
//   //       DataGridCell(columnName: 'Year', value: data.doc["Year"]),
//   //       DataGridCell(columnName: 'Number', value: data.doc["PhoneNumber"]),
//   //       DataGridCell(columnName: 'ParentsName', value: data.doc["ParentName"]),
//   //       DataGridCell(columnName: 'SDate', value: data.doc["Startdate"]),
//   //       DataGridCell(columnName: 'BDate', value: data.doc["Birthday"]),
//   //       DataGridCell(columnName: 'Session', value: data.doc["session"]),
//   //       DataGridCell(columnName: 'CourseTime', value: data.doc["Coursetime"]),
//   //       DataGridCell(columnName: 'Coach', value: data.doc["Coach"]),
//   //     ],
//   //   );
//   // }

//   @override
//   void initState() {
//     super.initState();
//     _buildDataGrid();
//     // clientsDataSource.updateDataGridSource();
//     // clientsDataSource = ClientsDataSource(clientData);
//   }

//   // addClient(SidebarXController controller) {
//   //   return AnimatedBuilder(
//   //       animation: controller,
//   //       builder: (context, child) {
//   //         final theme = Theme.of(context);
//   //         // final pageTitle = _getTitleByIndex(controller.selectedIndex);
//   //         // switch (controller.selectedIndex) {
//   //         //   case 0:
//   //         return addingClient();
//   //         // default:
//   //         //   return Text(
//   //         //     "Title",
//   //         //     // pageTitle,
//   //         //     style: theme.textTheme.headlineSmall,
//   //         //   );
//   //       }
//   //       // return

//   //       );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // final SidebarXController controller;
//     return _buildDataGrid;
//   }
// }

// // class ClientsDataSource extends DataGridSource {
// //   ClientsDataSource(this.clientsData) {
// //     _buildDataRow();
// //   }

// //   List<DataGridRow> dataGridRows = [];
// //   List<Clients> clientsData;
// //   void _buildDataRow() {
// //     dataGridRows = clientsData
// //         .map<DataGridRow>((e) => DataGridRow(cells: [
// //               DataGridCell(columnName: 'id', value: e.id),
// //               DataGridCell(columnName: 'Name', value: e.name),
// //               DataGridCell(columnName: 'Date', value: e.date),
// //               DataGridCell(columnName: 'Year', value: e.year),
// //               DataGridCell(columnName: 'Number', value: e.number),
// //               DataGridCell(columnName: 'ParentsName', value: e.parentName),
// //               DataGridCell(columnName: 'SDate', value: e.startDate),
// //               DataGridCell(columnName: 'BDate', value: e.birthDay),
// //               DataGridCell(columnName: 'Session', value: e.session),
// //               DataGridCell(columnName: 'CourseTime', value: e.courseTime),
// //               DataGridCell(columnName: 'Coach', value: e.coach),
// //             ]))
// //         .toList();
// //   }

// //   @override
// //   List<DataGridRow> get rows => dataGridRows;

// //   @override
// //   DataGridRowAdapter buildRow(
// //     DataGridRow row,
// //   ) {
// //     return DataGridRowAdapter(
// //         cells: row.getCells().map<Widget>((e) {
// //       return Container(
// //         alignment: Alignment.center,
// //         padding: const EdgeInsets.all(8.0),
// //         child: Text(e.value.toString()),
// //       );
// //     }).toList());
// //   }

// //   void updateDataGridSource() {
// //     notifyListeners();
// //   }
// // }

// // List<GridColumn> get getColumns {
// //   return <GridColumn>[
// //     GridColumn(
// //         visible: false,
// //         columnName: 'id',
// //         label: Container(
// //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //           alignment: Alignment.centerRight,
// //           child: const Text(
// //             'ID',
// //             overflow: TextOverflow.ellipsis,
// //           ),
// //         )),
// //     GridColumn(
// //         columnName: 'name',
// //         label: Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             alignment: Alignment.centerLeft,
// //             child: const Text(
// //               'Name',
// //               overflow: TextOverflow.ellipsis,
// //             ))),
// //     GridColumn(
// //         columnName: 'date',
// //         label: Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             alignment: Alignment.centerLeft,
// //             child: const Text(
// //               'Date',
// //               overflow: TextOverflow.ellipsis,
// //             ))),
// //     GridColumn(
// //         columnName: 'Year',
// //         label: Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             alignment: Alignment.centerLeft,
// //             child: const Text(
// //               'Year',
// //               overflow: TextOverflow.ellipsis,
// //             ))),
// //     GridColumn(
// //         columnName: 'Number',
// //         label: Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             alignment: Alignment.centerLeft,
// //             child: const Text(
// //               'Number',
// //               overflow: TextOverflow.ellipsis,
// //             ))),
// //     GridColumn(
// //         columnName: 'ParentsName',
// //         label: Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             alignment: Alignment.centerLeft,
// //             child: const Text(
// //               'ParentsName',
// //               overflow: TextOverflow.ellipsis,
// //             ))),
// //     GridColumn(
// //         columnName: 'SDate',
// //         label: Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             alignment: Alignment.centerLeft,
// //             child: const Text(
// //               'SDate',
// //               overflow: TextOverflow.ellipsis,
// //             ))),
// //     GridColumn(
// //         columnName: 'Bday',
// //         label: Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             alignment: Alignment.centerLeft,
// //             child: const Text(
// //               'Bday',
// //               overflow: TextOverflow.ellipsis,
// //             ))),
// //     GridColumn(
// //         columnName: 'Session',
// //         label: Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             alignment: Alignment.centerLeft,
// //             child: const Text(
// //               'Session',
// //               overflow: TextOverflow.ellipsis,
// //             ))),
// //     GridColumn(
// //         columnName: 'CourseTime',
// //         label: Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             alignment: Alignment.centerLeft,
// //             child: const Text(
// //               'CourseTime',
// //               overflow: TextOverflow.ellipsis,
// //             ))),
// //     GridColumn(
// //         columnName: 'Coach',
// //         label: Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             alignment: Alignment.center,
// //             child: const Text(
// //               'coach',
// //               overflow: TextOverflow.ellipsis,
// //             ))),
// //   ];
// // }

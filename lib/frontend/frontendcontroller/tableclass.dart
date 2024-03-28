import 'package:crudappfirebase/backend/controllers/usersfromdb.dart';
import 'package:flutter/material.dart';

class roww extends DataTableSource {
  List data;

  roww({required this.data});
  // List.generate(200, (index) => {'name': 'rw $index', 'age': 'age $index'});
  @override
  DataRow? getRow(int index) {
    // TODO: implement getRow
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(data[index]['name'])),
      DataCell(Text(data[index]['age'])),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}

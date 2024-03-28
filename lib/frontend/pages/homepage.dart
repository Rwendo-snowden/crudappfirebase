import 'package:crudappfirebase/backend/controllers/deleteuser.dart';
import 'package:crudappfirebase/backend/controllers/userscontollers.dart';
import 'package:crudappfirebase/backend/controllers/usersfromdb.dart';
import 'package:crudappfirebase/frontend/frontendcontroller/tableclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  //new instance for the table

  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // from db controller
    usersfromdb tt = Get.put(usersfromdb());
    //
    dataDelete dd = Get.put(dataDelete());

    // here you pass data to the data source class
    roww tb = roww(data: tt.allUsers);
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('crud aap'),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'name'),
                  controller: namecontroller,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'age'),
                  controller: agecontroller,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // new instance for the usercontroller
                    Userscontroller user = Userscontroller(
                        name: namecontroller.text, age: agecontroller.text);
                    await user.addData();
                    agecontroller.clear();
                    namecontroller.clear();
                    await tt.getData();
                  },
                  child: Text('add'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          GetBuilder<usersfromdb>(
              initState: (_) => tt.getData(),
              builder: (r) {
                // return Expanded(
                //     child: PaginatedDataTable(
                //   columns: [
                //     DataColumn(label: Text('name')),
                //     DataColumn(label: Text('age')),
                //   ],
                //   source: tb,
                //   rowsPerPage: 2,
                // ));
                return Expanded(
                  child: ListView.builder(
                    itemCount: tt.allUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return ListTile(
                      //   title: Text(tt.allUsers[index]['name']),
                      //   subtitle: ElevatedButton(
                      //       onPressed: () async {
                      //         await dd.deleted(tt.usersid[index]);
                      //         await tt.getData();
                      //       },
                      //       child: Text('delete')),
                      // );
                      return DataTable(columns: [
                        DataColumn(label: Text('name')),
                        DataColumn(label: Text('age')),
                        DataColumn(label: Text('funcs')),
                      ], rows: [
                        DataRow(cells: [
                          DataCell(Text(tt.allUsers[index]['name'])),
                          DataCell(Text(tt.allUsers[index]['age'])),
                          DataCell(ElevatedButton(
                              onPressed: () async {
                                await dd.deleted(tt.usersid[index]);
                                await tt.getData();
                              },
                              child: Text('delete')))
                        ])
                      ]);
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}

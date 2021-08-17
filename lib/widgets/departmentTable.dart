import 'package:flutter/material.dart';
import 'package:hayel_gocloud/models/department.dart';

class DepartmentsTable extends StatelessWidget {
  List<department> _Departments;

  DepartmentsTable(this._Departments);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Departments ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black45,
                ),
              ),
            ),
            Divider(
              color: Color(0xFFEFEFF6),
            ),
            DataTable(
              columns: [
                DataColumn(
                  label: Text(
                    "#",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  numeric: true,
                  //  tooltip:
                ),
                DataColumn(
                  label: Text(
                    "Department",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  numeric: false,
                  //  tooltip:
                ),
                DataColumn(
                  label: SizedBox(
                    width: 50,
                  ),
                  numeric: false,
                )
              ],
              rows: _Departments.map(
                (department) => DataRow(cells: [
                  DataCell(Text(
                    "${department.id}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  )),
                  DataCell(Text(
                    "${department.departmentName}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  )),
                  DataCell(Row(
                    children: [
                      SizedBox(
                        width: mediaQuery.size.width * 0.2,
                      ),
                      IconButton(icon: Icon(Icons.update), onPressed: () {}),
                      IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                    ],
                  ))
                ]),
              ).toList(),
            ),
          ],
        ));
  }
}

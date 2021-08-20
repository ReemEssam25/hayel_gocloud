import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hayel_gocloud/models/employees_model.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({Key key}) : super(key: key);

  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {

  List<Employee> listViewItems=[Employee("1", "Dr.Mustafa Al-Shobaki", "د/مصطفي الشوبكي", "Project manager- مدير المشروعات", "Web Development", "No", "dr.mustafaelshobaky@gmail"),
    Employee("1", "Dr.Mustafa Al-Shobaki", "د/مصطفي الشوبكي", "Project manager- مدير المشروعات", "Web Development", "No", "dr.mustafaelshobaky@gmail"),
    Employee("1", "Dr.Mustafa Al-Shobaki", "د/مصطفي الشوبكي", "Project manager- مدير المشروعات", "Web Development", "No", "dr.mustafaelshobaky@gmail"),
    Employee("1", "Dr.Mustafa Al-Shobaki", "د/مصطفي الشوبكي", "Project manager- مدير المشروعات", "Web Development", "No", "dr.mustafaelshobaky@gmail")];


  @override
  Widget build(BuildContext context) {
    int dropdownValue = 50;
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Employees ",
                  style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
              )
          ),

          Divider(
            thickness: 2,
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: FlatButton(
                padding: EdgeInsets.all(15),
                  onPressed: (){},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: Text("Create" , style: TextStyle(color: Colors.white, fontSize: 20),),
                  color: Color(0xFF26D5F2),
              ),
            ),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlineButton(
                padding: EdgeInsets.all(15),
                onPressed: (){},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Text("Copy" , style: TextStyle(fontSize: 20, color: Color(0xFF6B6B9E)),),
                borderSide: BorderSide(width: .5, color: Colors.grey),
              ),
              SizedBox(width: 10,),
              OutlineButton(
                padding: EdgeInsets.all(15),
                onPressed: (){},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Text("Excel" , style: TextStyle(fontSize: 20, color: Color(0xFF6B6B9E)),),
                borderSide: BorderSide(width: .5, color: Colors.grey),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Show",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF6B6B9E)
                    )
                ),

                SizedBox(width: 10,),

                DropdownButtonHideUnderline(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButton<int>(
                      value: dropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      style: TextStyle(fontSize: 25, color: Color(0xFF6B6B9E)),
                      items: <int>[10, 20, 50, 100]
                          .map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: .5)
                    ),
                  ),
                ),

                SizedBox(width: 10,),

                Text("entries",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF6B6B9E)
                    )
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Search:  ",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF6B6B9E)
                    )
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1,color: Colors.black)
                      )
                    ),
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dividerThickness: 0,
                    columnSpacing: 0,
                    dataRowHeight: 150,
                    headingRowHeight: 70,
                    columns: [
                      DataColumn(label: tableField(Colors.black, "Code", 70),),
                      DataColumn(label: tableField(Colors.black, "English \nName", 70),),
                      DataColumn(label: tableField(Colors.black, "Arabic \nName",70),),
                      DataColumn(label: tableField(Colors.black, "Job \nTitle", 70),),
                      DataColumn(label: tableField(Colors.black, "Department", 70),),
                      DataColumn(label: tableField(Colors.black, "Insurance", 70),),
                      DataColumn(label: tableField(Colors.black, "Email", 70),),
                      DataColumn(label: tableField(Colors.black, " ", 70),),
                    ],
                    rows:
                      listViewItems.map((e) => DataRow(
                        cells: <DataCell>[
                          DataCell(tableField(Colors.grey, e.Code , 150),),
                          DataCell(tableField(Colors.grey, e.EnglishName , 150),),
                          DataCell(tableField(Colors.grey, e.ArabicName , 150),),
                          DataCell(tableField(Colors.grey, e.JobTitle , 150),),
                          DataCell(tableField(Colors.grey, e.Department , 150),),
                          DataCell(tableField(Colors.grey, e.Insurance , 150),),
                          DataCell(tableField(Colors.grey, e.Email , 150),),
                          DataCell(tableField(Colors.black, " " , 150),),

                        ]
                      )).toList(),
                  ),
                )
              ],
            ),
          )

        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  static Widget tableField(Color color , String title , double height)
  {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(5),
      height: height,
      width: 110,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  color: color
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
      ),
    );
  }

}

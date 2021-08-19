import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({Key key}) : super(key: key);

  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
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

          Column(
            children: [
              Row(

              )
            ],
          )

        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}


class CustomTableRow extends StatelessWidget {
  const CustomTableRow ({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(

    );
  }
}

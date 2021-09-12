import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hayel_gocloud/models/api_services.dart';
import 'package:hayel_gocloud/models/auth.dart';
import 'package:hayel_gocloud/models/department.dart';
import 'package:hayel_gocloud/models/employees_model.dart';
import 'package:provider/provider.dart';

class EditEmployee extends StatefulWidget {
  Employee employee;

  EditEmployee({Key key, this.employee}) : super(key: key);

  @override
  _EditEmployeeState createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  TextEditingController englishNameController = TextEditingController();
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  String departmentController;
  //TextEditingController insuranceController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Future<Employee> _futureEmployee;
  List<Department> _departments = [];
  List<String> _departmentName = [];
  String insuranceText ;

  ApiServices api = ApiServices.getinstance();

  void saveEmployee() async {
    // String token = Provider.of<Auth>(
    //   context,
    //   listen: false,
    // ).token;
    var saveResponce = await ApiServices.getinstance().postEmployee(widget.employee);

    saveResponce == true
        ? Navigator.pop(context, widget.employee)
        : print ("error adding new employee");
  }

  void updateEmployee(Employee e) async {
    // String token = Provider.of<Auth>(
    //   context,
    //   listen: false,
    // ).token;

    _futureEmployee =
        (await ApiServices.getinstance().updateEmployee(e)) as Future<Employee>;

    print(_futureEmployee.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.employee != null) {
      englishNameController.text = widget.employee.englishName;
      arabicNameController.text = widget.employee.arabicName;
      jobTitleController.text = widget.employee.jobTitle;
      departmentController = widget.employee.departmentId.toString();
      insuranceText = widget.employee.insurance ? "Yes" : "No";
      emailController.text = widget.employee.email;
    }
    else
      {
        departmentController = "3004";
        insuranceText = "Yes";
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.circle)),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  child: TextField(
                    controller: englishNameController,
                    decoration: InputDecoration(
                        labelText: 'English Name',
                        labelStyle: TextStyle(
                            color: Colors.black26, fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[300]),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  child: TextField(
                    controller: arabicNameController,
                    decoration: InputDecoration(
                        labelText: 'Arabic Name',
                        labelStyle: TextStyle(
                            color: Colors.black26, fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[300]),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  child: TextField(
                    controller: jobTitleController,
                    decoration: InputDecoration(
                        labelText: 'Job Title',
                        labelStyle: TextStyle(
                            color: Colors.black26, fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[300]),
                        )),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      "Department : ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black26, fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FutureBuilder(
                        future: api.fetchDepartmet(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Department>> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return CircularProgressIndicator();
                            default:
                              if (snapshot.hasError)
                                return Text('Error ' + snapshot.error.toString());
                              else {
                                _departments = snapshot.data;
                                for (int i =0 ; i < _departments.length ; i++)
                                  {
                                    _departmentName.add(_departments[i].departmentName);
                                  }
                              }
                              return DropdownButton<String>(
                                value: departmentController,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    departmentController = newValue;
                                  });
                                },
                                items: _departments.map<DropdownMenuItem<String>>(
                                        (e) => new DropdownMenuItem(
                                  child: Text(e.departmentName),
                                  value: e.id.toString(),
                                )).toList(),
                              );
                          }
                        }),
                  ],
                ),
              ),



              Padding(
                padding: const EdgeInsets.all(15),
                child: Row (
                  children: [
                    Text(
                      "Insurance : ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black26, fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    DropdownButton<String>(
                      value: insuranceText,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          insuranceText = newValue;
                        });
                      },
                      items: ["Yes", "No"].map<DropdownMenuItem<String>>(
                              (e) => new DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          )).toList(),
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Colors.black26, fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[300]),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  child: FlatButton(
                    onPressed: () {
                      if (widget.employee == null) {
                        widget.employee = new Employee(
                            1,
                            englishNameController.text,
                            arabicNameController.text,
                            jobTitleController.text,
                            int.parse(departmentController),
                            emailController.text,
                            insuranceText.toLowerCase() == "yes"
                                ? true
                                : false);
                        saveEmployee();
                      } else {
                        Employee e = new Employee.withId(
                            widget.employee.id,
                            widget.employee.code,
                            englishNameController.text,
                            arabicNameController.text,
                            jobTitleController.text,
                            int.parse(departmentController),
                            widget.employee.department,
                            emailController.text,
                            insuranceText.toLowerCase() == "yes"
                                ? true
                                : false);
                        updateEmployee(e);
                        Navigator.pop(context, e);
                      }
                    },
                    child: Text(
                      widget.employee == null ? "Create" : "Edit",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    color: Colors.lightGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

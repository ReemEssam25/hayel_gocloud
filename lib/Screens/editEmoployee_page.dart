import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hayel_gocloud/models/employees_model.dart';


class EditEmployee extends StatefulWidget {
  final Employee employee;

  const EditEmployee({Key key, this.employee}) : super(key: key);

  @override
  _EditEmployeeState createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {

  TextEditingController englishNameController = TextEditingController();
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController insuranceController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.employee!=null)
      {
        englishNameController.text=widget.employee.englishName;
        arabicNameController.text = widget.employee.arabicName;
        jobTitleController.text = widget.employee.jobTitle;
        departmentController.text = widget.employee.departmentId.toString();
        insuranceController.text = widget.employee.insurance;
        emailController.text = widget.employee.email;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.circle)
      ),
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
                            color: Colors.black26,
                            fontWeight: FontWeight.bold),
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
                            color: Colors.black26,
                            fontWeight: FontWeight.bold),
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
                            color: Colors.black26,
                            fontWeight: FontWeight.bold),
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
                    controller: departmentController,
                    decoration: InputDecoration(
                        labelText: 'Department',
                        labelStyle: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.bold),
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
                    controller: insuranceController,
                    decoration: InputDecoration(
                        labelText: 'Insurance',
                        labelStyle: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.bold),
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
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.bold),
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
                    onPressed: (){
                      Employee e = new Employee(widget.employee.code, englishNameController.text, arabicNameController.text, jobTitleController.text,
                          int.parse(departmentController.text), insuranceController.text, emailController.text);
                      Navigator.pop(context, e);
                    },
                    child: Text("Edit" , style: TextStyle(fontSize: 17, color: Colors.white),),
                    color:Colors.lightGreen ,
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



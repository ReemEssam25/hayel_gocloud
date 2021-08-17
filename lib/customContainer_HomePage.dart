import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer_HomePage extends StatelessWidget {

  final String title;
  final String count;

  const CustomContainer_HomePage({Key key, this.title, this.count}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF6B6B9E)
                ),),
              SizedBox(height: 20,),
              Text(
                count,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          Container(
            child: Icon(Icons.person, color: Color(0xFF181B4C), size: 50,),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(0xFFDBDEFF)
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
}

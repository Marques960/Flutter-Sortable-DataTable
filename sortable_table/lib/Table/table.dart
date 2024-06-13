//ignorances
// ignore_for_file: prefer_const_literals_to_create_immutables 
// ignore_for_file: unused_local_variable
// ignore_for_file: prefer_const_constructors
// ignore_for_file:
// ignore_for_file:
// ignore_for_file:
// ignore_for_file:

//imports
import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TableState();
}

class _TableState extends State<TablePage> {

  //var's out of the widget

  @override
  Widget build(BuildContext context) {

    //Screen measurements
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    //VAR'S

    return Scaffold( 
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Sortable DataTable",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: Row(
              children: [
                //ct1
                Container(
                  width: screenWidth / 1.4,
                  height: screenHeight / 1.2,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  //to navigate on the table
                  child: SingleChildScrollView(
                    child: Table(
                      border: TableBorder.all(color: Colors.white30),
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: [
                        //header
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          children: [
                            //cicle for to give header names to the table
                            for (var header in [
                              "Name Nº1",
                              "Name Nº2",
                              "Name Nº3",
                              "Name Nº4",
                            ])
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  header,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ), 
                              ),
                            ),
                          ],
                        ),
                        //data
                      ],
                    ),
                  ),
                ),
                Spacer(),
                //ct2
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    width: screenWidth / 4,
                    height: screenHeight / 1.2,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "N / A",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
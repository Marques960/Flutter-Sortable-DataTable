//ignorances
// ignore_for_file: prefer_const_literals_to_create_immutables 
// ignore_for_file: unused_local_variable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_print
// ignore_for_file: sized_box_for_whitespace
// ignore_for_file:

//imports
import 'package:flutter/material.dart';
import 'package:sortable_table/Class/class_values.dart';
import 'package:sortable_table/Lists/list.dart';
import 'package:sortable_table/Styles/table_style.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TableState();
}

class _TableState extends State<TablePage> {
  //var's out of the widget
  bool isAscending = true;
  String currentSortColumn = '';

  //list of producao
  List<Producao> producao = [];

  //method to associte data with the class
  void method_assocation() {
    //clear the list
    producao.clear();

    int length = names.length;
    //for cicle to set the each value to one column
    for (int i = 0; i < length; i++) {
      Producao produca = Producao(
        name1: names[i].toString(),
        name2: subjects[i].toString(),
        value1: list_numerbs1[i].toString(),
        value2: list_numerbs2[i].toString(),
      );
      //add values to the list
      producao.add(produca);
    }
  }

  //order method int (test)
  void SortedValuesInt() {
    // 50 - 0
    list_numerbs1.sort();
    print(list_numerbs1.reversed);

    //0-50
    list_numerbs1.sort((a, b) => b.compareTo(a));
    print(list_numerbs1.reversed);
  }

  //sorted value
  void sortedStr(String columnToSort) {
    setState(() {
      if (columnToSort == currentSortColumn) {
        isAscending = !isAscending;
      } else {
        currentSortColumn = columnToSort;
        isAscending = true;
      }

      // Sort the production based on the order
      producao.sort((a, b) {
        if (columnToSort == 'name1') {
          return isAscending
              ? a.name1.compareTo(b.name1)
              : b.name1.compareTo(a.name1);
        } else if (columnToSort == 'name2') {
          return isAscending
              ? a.name2.compareTo(b.name2)
              : b.name2.compareTo(a.name2);
        } else if (columnToSort == 'value1') {
          return isAscending
              ? int.parse(a.value1).compareTo(int.parse(b.value1))
              : int.parse(b.value1).compareTo(int.parse(a.value1));
        } else if (columnToSort == 'value2') {
          return isAscending
              ? int.parse(a.value2).compareTo(int.parse(b.value2))
              : int.parse(b.value2).compareTo(int.parse(a.value2));
        }
        return 0; // Default
      });
    });
  }

  //order method str (test)
  void SortedStr1() {
    //a - z
    names.sort((a, b) => a.compareTo(b));
    print(names);

    //z - a
    names.sort((a, b) => b.compareTo(a));
    print(names);
  }

  //initialize method/var's
  @override
  void initState() {
    super.initState();
    method_assocation();
  }

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
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
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
                              //name 1
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: GestureDetector(
                                  onTap: () {
                                    sortedStr('name1');
                                  },
                                  child: Container(
                                    height: screenHeight / 18,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            "Name 1",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        //condition to display the icon
                                        if (currentSortColumn == 'name1')
                                          Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(
                                              isAscending
                                                  // a - z
                                                  ? Icons.arrow_upward
                                                  //z - a
                                                  : Icons.arrow_downward,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //name 2
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: GestureDetector(
                                  onTap: () {
                                    sortedStr('name2');
                                  },
                                  child: Container(
                                    height: screenHeight / 18,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Text(
                                            "Name 2",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        //condition to display the icon
                                        if (currentSortColumn == 'name2')
                                          Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(
                                              isAscending
                                                  // a - z
                                                  ? Icons.arrow_upward
                                                  //z - a
                                                  : Icons.arrow_downward,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //value 1
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: GestureDetector(
                                  onTap: () {
                                    sortedStr('value1');
                                  },
                                  child: Container(
                                    height: screenHeight / 18,
                                    color: Colors.transparent,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Text(
                                              "Value 1",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(width: 20,),
                                        //condition to display the icon
                                        if (currentSortColumn == 'value1')
                                          Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(
                                              isAscending
                                                  // a - z
                                                  ? Icons.arrow_upward
                                                  //z - a
                                                  : Icons.arrow_downward,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              
                              //value 2
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: GestureDetector(
                                  onTap: () {
                                    sortedStr('value2');
                                  },
                                  child: Container(
                                    height: screenHeight / 18,
                                    color: Colors.transparent,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Text(
                                              "Value 2",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(width: 20,),
                                        //condition to display the icon
                                        if (currentSortColumn == 'value2')
                                          Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(
                                              isAscending
                                                  // a - z
                                                  ? Icons.arrow_upward
                                                  //z - a
                                                  : Icons.arrow_downward,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            
                            ],
                          ),
                          //data
                          for (var produca in producao)
                            TableRow(
                              children: [
                                //name 1
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      produca.name1,
                                      style: tableStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                //name 2
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      produca.name2,
                                      style: tableStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                //value 1
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      produca.value1,
                                      style: tableStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                //value 2
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      produca.value2,
                                      style: tableStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
        ));
  }
}

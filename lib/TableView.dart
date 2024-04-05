import 'package:flutter/material.dart';
import 'Results.dart';

class tableView extends StatefulWidget {
  final int noOfLines;

  const tableView({
    Key? key,
    required this.noOfLines,
  }) : super(key: key);

  @override
  State<tableView> createState() => _tableViewState();
}

class _tableViewState extends State<tableView> {
  List<TextEditingController> xControllers = [];
  List<TextEditingController> yControllers = [];

  @override
  void initState() {
    super.initState();
    xControllers = List.generate(
        widget.noOfLines, (index) => TextEditingController());
    yControllers = List.generate(
        widget.noOfLines, (index) => TextEditingController());
  }

  double calXsum() {
    double xsum = 0;

    for (var controller in xControllers) {
      if (controller.text.isNotEmpty) {
        try {
          xsum += double.parse(controller.text);
        } catch (e) {
          print('Invalid number entered in X field: ${controller.text}');
        }
      }
    }
    return xsum;
  }

  double calYsum() {
    double ysum = 0;
    for (var controller in yControllers) {
      if (controller.text.isNotEmpty) {
        try {
          ysum += double.parse(controller.text);
        } catch (e) {
          print('Invalid number entered in Y field: ${controller.text}');
        }
      }
    }
    return ysum;
  }

  double calXYsum() {
    double XYsum = 0;
    for (int i = 0; i < widget.noOfLines; i++) {
      if (xControllers[i].text.isNotEmpty && yControllers[i].text.isNotEmpty) {
        try {
          XYsum += double.parse(xControllers[i].text) *
              int.parse(yControllers[i].text);
        } catch (e) {
          print(
              'Invalid number entered in X or Y field: ${xControllers[i].text} or ${yControllers[i].text}');
        }
      }
    }
    return XYsum;
  }

  double calXsquare() {
    double xSquare = 0;
    for (int i = 0; i < widget.noOfLines; i++) {
      if (xControllers[i].text.isNotEmpty) {
        try {
          xSquare += double.parse(xControllers[i].text) *
              int.parse(xControllers[i].text);
        } catch (e) {
          print('Invalid number entered in X field: ${xControllers[i].text}');
        }
      }
    }
    return xSquare;
  }

  double calYsquare() {
    double ySquare = 0;
    for (int i = 0; i < widget.noOfLines; i++) {
      if (yControllers[i].text.isNotEmpty) {
        try {
          ySquare += double.parse(yControllers[i].text) *
              int.parse(yControllers[i].text);
        } catch (e) {
          print('Invalid number entered in X field: ${yControllers[i].text}');
        }
      }
    }
    return ySquare;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table View'),
      ),
      body: ListView(

        children: [
          const Row(
            children: [
              Expanded(child:
                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          'Enter the values of X and Y',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top:30, left: 60.0, right: 60.0),
            child: SingleChildScrollView(
              child: DataTable(

                columns: const <DataColumn>[
                  DataColumn(
                    label: Padding(
                      padding: EdgeInsets.only(left: 60.0),
                      child: Text(
                        'X',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Y',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  for (int i = 0; i < widget.noOfLines; i++)
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: xControllers[i],
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter X value',
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: yControllers[i],
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Y value',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: ElevatedButton(

              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Results(
                      xsum: calXsum(),
                      ysum: calYsum(),
                      XYsum: calXYsum(),
                      Xsquaredsum: calXsquare(),
                      Ysquaredsum: calYsquare(),
                      nValue: widget.noOfLines
                    ),
                  ),
                );
              },
              child: const Text('Show Results'),
            ),
          ),
        ],
      ),
    );
  }
}

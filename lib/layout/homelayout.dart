import 'package:intl/intl.dart';
import 'package:main/shaered/componets/componets.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:main/modules/archiveed_tasks/archived_tasks_page.dart';
import 'package:main/modules/done_tasks/done_tasks_page.dart';
import 'package:main/modules/new_tasks/new_tasks_page.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  var titleTextControler;
  var timeTextController;
  var dateTextController;
  bool isButtomSheetShow = false;
  late IconData fabicon;
  var scafuldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  List<Widget> pages = [
    NewTasksPage(),
    DoneTasksPage(),
    ArchiveedTasksPage(),
  ];
  List<String> titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];

  Database? database; // تعريف متغير قاعدة البيانات

  // دالة إنشاء قاعدة البيانات

  void CreateDatabase() async {
    var database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version) {
        print('database created');
        db
            .execute('CREATE TABLE tasks ('
                'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                'title TEXT,'
                'description TEXT,'
                'date TEXT,'
                'status TEXT'
                ')')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('error when creating table: ${error.toString()}');
        });
      },
      onOpen: (db) {
        print('database opened');
      },
    );

    // الآن قم بتعيينه إلى المتغير database
    this.database = database;
  }

  Future insertDataBase({
    required String title,
    required String time,
    required String date,
  }) async {
    return await database?.transaction((txn) {
      return txn
          .rawInsert(
              'insert into tasks(title,date,time,status) values ("$title","$time","$date","old")')
          .then((value) {
        print('$value insert sucssed');
      }).catchError((error) {
        print('Error!! $error');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    titleTextControler = TextEditingController();
    timeTextController = TextEditingController();
    dateTextController = TextEditingController();
    CreateDatabase(); // استدعاء دالة إنشاء قاعدة البيانات عند تهيئة الصفحة
    fabicon = Icons.edit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafuldkey,
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isButtomSheetShow) {
            if (formkey.currentState!.validate()) {
              CreateDatabase();
              insertDataBase(
                  date: dateTextController.text,
                  time: timeTextController.text,
                  title: timeTextController.text);
            }
          } else {
            scafuldkey.currentState?.showBottomSheet(
              (context) => Container(
                color: Colors.grey[100],
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //task title
                      DefaultTextField(
                        controller: titleTextControler,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value != null) {
                            return 'value must not be empty $titleTextControler';
                          } else {
                            return 'nothing';
                          }
                        },
                        label: 'Task Title',
                        prefix: Icons.title,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //time title
                      DefaultTextField(
                        controller: timeTextController,
                        type: TextInputType.datetime,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            timeTextController.text =
                                value?.format(context).toString();
                          });
                        },
                        validate: (value) {
                          if (value != null) {
                            return 'time must not be empty $timeTextController';
                          } else {
                            return 'nothing';
                          }
                        },
                        label: 'Time Title',
                        prefix: Icons.watch_later_outlined,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //date title
                      DefaultTextField(
                        controller: dateTextController,
                        type: TextInputType.datetime,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          ).then((value) {
                            dateTextController.text =
                                DateFormat.yMMMd().format(value!);
                          });
                        },
                        validate: (value) {
                          if (value != null) {
                            return 'datetime must not be empty $dateTextController ';
                          } else {
                            return 'nothing';
                          }
                        },
                        label: 'Date Title',
                        prefix: Icons.calendar_today,
                      ),
                    ],
                  ),
                ),
              ),
            );
            isButtomSheetShow = true;
            setState(() {
              fabicon = Icons.add;
            });
          }
        },
        child: Icon(fabicon),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Done Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: 'Archived Tasks',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/shared/component/components.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

// 1- Create DB
// 2- Create Tables
// 3- Open DB
// 4- Insert to DB - Get from DB - Update In DB - Delete from DB

class HomeLayout extends StatelessWidget
{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDB(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){
          if(state is AppInsertDBState){
            Navigator.pop(context);
          }
        },
        builder: (context, state){
          var cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(AppCubit.get(context).titles[AppCubit.get(context).currentIndex]),
            ),
            body: state is !AppGetLoadingDBState ? cubit.screens[cubit.currentIndex] : Center(child:CircularProgressIndicator()),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheet) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertDB(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text
                    );
                  }
                } else {
                  scaffoldKey.currentState!.showBottomSheet(
                          (context) => Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    textForm(
                                        prefixIcon: Icons.title,
                                        controller: titleController,
                                        type: TextInputType.text,
                                        label: 'Task title',
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'This field must be not empty';
                                          }
                                        }),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    textForm(
                                        prefixIcon: Icons.watch_later_outlined,
                                        controller: timeController,
                                        type: TextInputType.datetime,
                                        label: 'Task time',
                                        ontap: () async {
                                          var time = await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now());
                                          timeController.text = time!.format(context);
                                          print(time.format(context));
                                        },
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'This field must be not empty';
                                          }
                                        }),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    textForm(
                                      prefixIcon: Icons.calendar_today_outlined,
                                      controller: dateController,
                                      type: TextInputType.text,
                                      label: 'Task Date',
                                      ontap: () async {
                                        var date = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime.parse('2021-12-31'));
                                        dateController.text =
                                            DateFormat.yMMMd().format(date!);
                                      },
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'This field must be not empty';
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ))),
                      elevation: 20.0).closed.then((value){
                    cubit.changeBottomSheetState(
                        isShow:  false,
                        icon: FontAwesomeIcons.pen
                    );
                  });
                  cubit.changeBottomSheetState(
                      isShow:  true,
                      icon: Icons.add
                  );
                }
              },
              child: Icon(
                cubit.fbIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.newIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.tasks), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.checkCircle), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.archive), label: 'Archive'),
              ],
            ),
          );
        },
      ),
    );
  }

}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/shared/component/components.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class DoneTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state){
          var tasks = AppCubit.get(context).doneTasks;
          return Container(
            child: tasks.length == 0 ?
            Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.tasks,
                  color: Colors.grey,
                  size: 35.0,
                ),
                SizedBox(height: 15.0,),
                Text(
                  'No tasks yet, Add some tasks :)',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                )
              ],
            ),) : ListView.separated(
                itemBuilder: (context, index) => buildTask(tasks[index], context),
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ),
                itemCount: tasks.length
            )
          );
        },
        listener:(context, state){}
    );
  }
}
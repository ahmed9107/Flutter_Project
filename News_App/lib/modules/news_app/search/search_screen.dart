import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/layout/news_app/cubit/cubit.dart';
import 'package:todo_app/layout/news_app/cubit/states.dart';
import 'package:todo_app/shared/component/components.dart';

class SearchScreen extends StatelessWidget {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state){
          var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: textForm(
                      prefixIcon: Icons.search,
                      controller: searchController,
                      onChange: (value){
                        NewsCubit.get(context).getSearch(value!);
                      },
                      type: TextInputType.text,
                      label: 'Search',
                      validate: (String? value) {
                        if(value!.isEmpty){
                          return 'this field must be full';
                        }
                        return null;
                      },
                    )
                ),
                Expanded(child: articleBuilder(list),)
              ],
            ),
          );
        },
      );
  }
}

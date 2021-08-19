import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/layout/news_app/cubit/cubit.dart';
import 'package:todo_app/layout/news_app/cubit/states.dart';
import 'package:todo_app/layout/news_app/news_layout.dart';
import 'package:todo_app/shared/bloc_observer.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';
import 'package:todo_app/shared/network/local/cache_helper.dart';
import 'package:todo_app/shared/network/remote/dio_helper.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();// to ensure that everything in the method is finished then run the app
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDarkMod = CacheHelper.getData(key: 'isDarkMod');

  runApp(MyApp(isDarkMod));
}

class MyApp extends StatelessWidget
{

  final bool? isDarkMod;

  MyApp(this.isDarkMod);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(
            create: (context) => NewsCubit()..getBusiness()..getSports()..getSciences()
          ),
        BlocProvider(
          create: (context) => AppCubit()..changeMode(fromShared: isDarkMod)),
        ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state){
          var darkMode = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,// base color in app
                scaffoldBackgroundColor: Colors.white,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600
                    )
                ),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                  backwardsCompatibility: false,//bax at7akm fl status bar
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  iconTheme: IconThemeData(
                      color: Colors.black
                  ),
                  color: Colors.white,
                  elevation: 0.0,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    elevation: 30.0
                )
            ),
            darkTheme: ThemeData(
                primarySwatch: Colors.amber,// base color in app
                scaffoldBackgroundColor: Color(0xff26292d),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.amber
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600
                    )
                ),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  titleTextStyle: TextStyle(
                      color: Colors.amber,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                  backwardsCompatibility: false,//bax at7akm fl status bar
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Color(0xff26292d),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  iconTheme: IconThemeData(
                      color: Colors.grey
                  ),
                  color: Color(0xff26292d),
                  elevation: 0.0,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Color(0xff26292d),
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.amber,
                  unselectedItemColor: Colors.grey,
                  elevation: 30.0,
                )
            ),
            themeMode: darkMode.isDarkMod ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}

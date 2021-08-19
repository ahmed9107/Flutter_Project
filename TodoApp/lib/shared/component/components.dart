import 'package:flutter/material.dart';
import 'package:todo_app/modules/news_app/web_view/webview_screen.dart';
import 'package:todo_app/shared/cubit/cubit.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.onPressed, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: CustomText(text:text,color: Colors.white,fontWeight: FontWeight.bold),
      style: ElevatedButton.styleFrom(
        primary: Colors.yellow,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  CustomText({
    this.text = '',
    this.color = Colors.black,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight
      ),
      textAlign: textAlign,
    );

  }
}

Widget textForm({
  @required TextInputType? type,
  @required TextEditingController? controller,
  bool obscure = false,
  String? Function(String?)? onSubmit,
  String? Function(String?)? onChange,
  Function()? ontap,
  @required String? label,
  String? hint,
  @required IconData? prefixIcon,
  IconData? suffixIcon,
  Color? color,
  Function()? suffixPressed,
  @required String? Function(String?)? validate
}) => TextFormField(
  keyboardType: type,
  controller: controller,
  obscureText: obscure,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  onTap: ontap,
  decoration: InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    labelText: label,
    hintText: hint,
    prefixIcon: Icon(
      prefixIcon,
      size: 32.0,
    ),
    suffixIcon: IconButton(
      icon: Icon(
        suffixIcon,
        color: color,
      ),
      onPressed: suffixPressed,
    ),
  ),
  validator: validate,
);

// Todo_App
Widget buildTask(Map task, context) => Dismissible(
  key: Key('${task['id']}'),
  child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            child: Text(
                '${task['time']}'
            ),
          ),
          SizedBox(width: 10.0,),
          Expanded(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${task['title']}',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 15.0,),
              Text(
                '${task['date']}',
                style: TextStyle(
                    color: Colors.grey
                ),
              )
            ],
          )),
          IconButton(
            onPressed: (){
              AppCubit.get(context).updateDB(status: 'done', id: task['id']);
            },
            icon: Icon(
                Icons.done,
                color: Colors.green
            ),
          ),
          SizedBox(width: 10.0,),
          IconButton(
            onPressed: (){
              AppCubit.get(context).updateDB(status: 'archive', id: task['id']);
            },
            icon: Icon(
                Icons.archive,
                color: Colors.lightBlueAccent
            ),
          ),
        ],
      ),
    ),
  onDismissed: (direction){
    AppCubit.get(context).deleteData(id: task['id']);
  },
);
// Todo_App


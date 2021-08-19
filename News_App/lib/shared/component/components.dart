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


Widget buildArticleItems(article, context) => InkWell(
  onTap: (){navigateTo(context, WebViewScreen(article['url']));},
  child: Padding(
    padding: EdgeInsets.all(15.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover
              )
          ),
        ),
        SizedBox(width: 10.0,),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(
                  '${article['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),),
                SizedBox(height: 10.0,),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                      color: Colors.grey
                  ),
                ),

              ],
            ),
          ),
        )
      ],
    ),
  ),
);

Widget articleBuilder(list) => Container(
  child: list.length > 0 ?
  ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildArticleItems(list[index], context),
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey,
        ),
      ),
      itemCount: list.length
  ): Center(child:CircularProgressIndicator()),
);

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget)
);

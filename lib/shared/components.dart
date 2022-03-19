import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro11/modules/news_app/web_view_screen.dart';

Widget defaultButten({
  required double width,
  required Color background,
  required Function function,
  required String text,
  double height = 40,
}) =>
    Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: background,
        ),
        child: MaterialButton(
          onPressed: () {
            function();
          },
          child: Text(
            "$text",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ));

//////////////////////////////////////////////////////////////////////////////////////////////////

Widget defaultTextfeiled({
  required TextEditingController controller,
  required TextInputType keytype,
  required String lable,
  required IconData prefix,
  Function? onSubbmit,
  Function? onChange,
  required Function validate,
  IconData? suffix,
  bool ispassword = false,
  Function? suffixPressed,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keytype,
    obscureText: ispassword,
    onFieldSubmitted: (s) {
      onSubbmit!(s);
    },
    // onChanged: (s) {
    //   onChange!(s);
    // },
    validator: (s) {
      return validate(s);
    },
    decoration: InputDecoration(
      labelText: lable,
      prefixIcon: Icon(
        prefix,
      ),
      suffixIcon: suffix != null
          ? IconButton(
              onPressed: () {
                suffixPressed!();
              },
              icon: Icon(
                suffix,
              ),
            )
          : null,
      border: OutlineInputBorder(),
    ),
  );
}

Widget defaultTextfeiled2({
  required TextEditingController controller,
  required TextInputType keytype,
  required String lable,
  required IconData prefix,
  Function? onSubbmit,
  required Function validate,
  IconData? suffix,
  bool ispassword = false,
  Function? suffixPressed,
  required Function onTapp,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keytype,
    obscureText: ispassword,
    onFieldSubmitted: (s) {
      onSubbmit!(s);
    },
    validator: (s) {
      return validate(s);
    },
    onTap: () {
      onTapp();
    },
    decoration: InputDecoration(
      labelText: lable,
      prefixIcon: Icon(
        prefix,
      ),
      suffixIcon: suffix != null
          ? IconButton(
              onPressed: () {
                suffixPressed!();
              },
              icon: Icon(
                suffix,
              ),
            )
          : null,
      border: OutlineInputBorder(),
    ),
  );
}

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigatTo(context, webViewScreen(article['url']));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${article['title']}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget devider() => Container(
      height: 1,
      width: double.infinity,
    );

void navigatTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void NavigatAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

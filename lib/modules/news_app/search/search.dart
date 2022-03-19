import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro11/layout/news/cubit/newsCubit.dart';
import 'package:pro11/layout/news/cubit/newsState.dart';
import 'package:pro11/shared/components.dart';

class seachScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, NewsStates>(
        builder: (context, state) {
          var list = newsCubit.get(context).search;

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: defaultTextfeiled(
                    controller: searchController,
                    keytype: TextInputType.text,
                    onChange: (String value1) {
                      newsCubit.get(context).getsearch(value: value1);
                    },
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return "search must not be empty";
                      }
                      return null;
                    },
                    lable: "Search",
                    prefix: Icons.search,
                  ),
                ),
                //  Expanded(child: buildArticleItem(list, context)),
                Expanded(
                    child: ConditionalBuilder(
                        condition: list.length > 0,
                        builder: (context) => ListView.separated(
                              itemBuilder: (context, inndex) =>
                                  buildArticleItem(list[inndex], context),
                              separatorBuilder: (context, inndex) => Divider(),
                              itemCount: list.length,
                            ),
                        fallback: (context) => Center())),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}

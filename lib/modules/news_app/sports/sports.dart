import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro11/layout/news/cubit/newsCubit.dart';
import 'package:pro11/layout/news/cubit/newsState.dart';
import 'package:pro11/shared/components.dart';

class sportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, NewsStates>(
        builder: (context, state) {
          var list = newsCubit.get(context).sport;

          return ConditionalBuilder(
              condition: list.length > 0,
              builder: (context) => ListView.separated(
                    itemBuilder: (context, inndex) =>
                        buildArticleItem(list[inndex], context),
                    separatorBuilder: (context, inndex) => Divider(),
                    itemCount: list.length,
                  ),
              fallback: (context) =>
                  Center(child: CircularProgressIndicator()));
        },
        listener: (context, state) {});
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_base_clean_architecture/core/responsive/app_dimens.dart';
import 'package:flutter_base_clean_architecture/generated/l10n.dart';

class ScreenHome extends StatelessWidget {
  final items = List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    AppDimens.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).welcome),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index]}'),
          );
        },
      ),
    );
  }
}

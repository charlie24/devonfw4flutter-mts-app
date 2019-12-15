import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_thai_star_flutter/blocs/current_order_bloc.dart';
import 'package:my_thai_star_flutter/models/dish.dart';
import 'package:my_thai_star_flutter/ui/ui_helper.dart';

class TotalPriceDisplay extends StatelessWidget {
  const TotalPriceDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UiHelper.standard_padding),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Total",
            style:
                Theme.of(context).textTheme.title.copyWith(color: Colors.black),
          ),
          BlocBuilder<CurrentOrderBloc, LinkedHashMap<Dish, int>>(
              builder: (context, order) {
            return Text(
              "${calcPrice(order).toStringAsFixed(2)} €",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.black),
            );
          }),
        ],
      ),
    );
  }

  double calcPrice(Map<Dish, int> order) {
    double price = 0;
    order.forEach((dish, amount) => price += dish.price * amount);
    return price;
  }
}

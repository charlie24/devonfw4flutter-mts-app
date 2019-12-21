import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:my_thai_star_flutter/blocs/current_search_events.dart';
import 'package:my_thai_star_flutter/models/search.dart';

///Handles the state of the current [Search]
///
///Consumes [CurrentSearchEvent]s and mutates the current search
///based on those events. The [CurrentSearchBloc] then emits the
///mutated [Search] as state.
class CurrentSearchBloc extends Bloc<CurrentSearchEvent, Search> {
  @override
  Search get initialState => Search();

  @override
  Stream<Search> mapEventToState(CurrentSearchEvent event) async* {
    Search newSearch;

    if (event is SetQueryEvent) {
      newSearch = currentState.copyWith(query: event.query);
    } else if (event is SetSortEvent) {
      newSearch = currentState.copyWith(sortBy: event.sortBy);
    } else if (event is FlipDirectionEvent) {
      newSearch = currentState.copyWith(descending: !currentState.descending);
    } else if (event is ClearSearchEvent) {
      newSearch = Search();
    }

    yield newSearch;
  }
}

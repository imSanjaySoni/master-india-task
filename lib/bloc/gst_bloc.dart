import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:masters_india/data/model/gst_entity.dart';
import 'package:masters_india/domain/repo_usecase.dart';

part 'gst_event.dart';
part 'gst_state.dart';

class GSTBloc extends Bloc<GSTEvent, GSTState> {
  GSTBloc(this.usecases) : super(GSTInitial());
  final Usecase usecases;

  @override
  Stream<GSTState> mapEventToState(
    GSTEvent event,
  ) async* {
    if (event is Search) {
      if (event.number.isEmpty) {
        yield GSTLoadError('Please enter valid number');
        yield GSTInitial();
      } else {
        yield GSTLoading();
        final failureOrSuccess = await usecases.searchGST(event.number);

        yield failureOrSuccess
            .fold((_) => GSTLoadError('Failed to load data ;('), (data) {
          if (data == null) {
            return GSTLoadError('Failed to load data ;(');
          }
          return GSTLoaded(data);
        });
      }
    }
  }
}

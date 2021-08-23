part of 'gst_bloc.dart';

abstract class GSTEvent extends Equatable {
  const GSTEvent();

  @override
  List<Object> get props => [];
}

class Search extends GSTEvent {
  Search(this.number);
  final String number;
}

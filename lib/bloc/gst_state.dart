part of 'gst_bloc.dart';

abstract class GSTState extends Equatable {
  const GSTState();

  @override
  List<Object> get props => [];
}

class GSTInitial extends GSTState {}

class GSTLoading extends GSTState {}

class GSTLoadError extends GSTState {
  const GSTLoadError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

class GSTLoaded extends GSTState {
  const GSTLoaded(this.data);
  final GSTEntity data;
  @override
  List<Object> get props => [data];
}

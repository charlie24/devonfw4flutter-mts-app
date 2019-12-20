import 'package:equatable/equatable.dart';

abstract class ValidationState<T> extends Equatable {
  final T data;

  ValidationState(this.data);
}

class InitialState<T> extends ValidationState<T> {
  InitialState(data) : super(data);

  @override
  List<Object> get props => [data, toString()];

  @override
  String toString() => 'Initial';
}

class InvalidState<T> extends ValidationState<T> {
  InvalidState(data) : super(data);

  @override
  List<Object> get props => [data, toString()];

  @override
  String toString() => 'Invalid';
}

class ValidState<T> extends ValidationState<T> {
  ValidState(data) : super(data);

  @override
  List<Object> get props => [data, toString()];

  @override
  String toString() => 'Valid';
}

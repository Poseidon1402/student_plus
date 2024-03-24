import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class DuplicatedFailure extends Failure {
  const DuplicatedFailure({super.message = 'Duplicated student number !'});
}

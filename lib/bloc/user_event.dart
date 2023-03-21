part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {}

class filterUserEvent extends UserEvent {
  String text;
  List<Datum> master;

  filterUserEvent({
    required this.text,
    required this.master,
  });
}

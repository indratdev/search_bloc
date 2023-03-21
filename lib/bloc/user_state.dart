part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class SuccessGetUser extends UserState {
  List<Datum> data;

  SuccessGetUser({
    required this.data,
  });

  List<Object> get props => [data];
}

class SuccessFilterUser extends UserState {
  List<Datum> data;

  SuccessFilterUser({
    required this.data,
  });

  List<Object> get props => [data];
}

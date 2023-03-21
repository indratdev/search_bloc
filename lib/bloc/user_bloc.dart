import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:search_bloc/model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUserEvent>((event, emit) {
      try {
        List<Datum> dataUser = listUser;
        emit(SuccessGetUser(data: dataUser));
      } catch (e) {
        log(e.toString());
      }
    });

    on<filterUserEvent>((event, emit) {
      try {
        List<Datum> filterUser = [];
        var text = event.text;
        var master = event.master;
        print(">> bloc filterUserEvent run..");
        print(">>> text : $text");
        print(">>> master : ${master.length}");
        print("-------------------------------------");

        if (text.isNotEmpty) {
          filterUser = master
              .where((element) =>
                  element.firstName.toLowerCase().contains(text.toLowerCase()))
              .toList();
        } else {
          filterUser = master;
        }

        emit(SuccessFilterUser(data: filterUser));
      } catch (e) {
        log(e.toString());
      }
    });
  }
}

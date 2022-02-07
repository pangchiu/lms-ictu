import 'package:flutter_bloc/flutter_bloc.dart';

enum ScreenEvent {classClick,exeClick,checkClick,notifyClick,docClick}

class ScreenBloc extends Bloc<ScreenEvent,int> {
  final int screen;
  ScreenBloc({required this.screen}) : super(screen) {
    on<ScreenEvent>((event, emit){
      switch(event) {
        case ScreenEvent.classClick:
          emit(0);
          break;

        case ScreenEvent.exeClick:
          emit(1);
          break;

        case ScreenEvent.checkClick:
          emit(2);
          break;

        case ScreenEvent.docClick:
          emit(3);
          break;

        case ScreenEvent.notifyClick:
          emit(4);
          break;
      }
    });
  }



}

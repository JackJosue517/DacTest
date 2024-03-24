import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<ThemeChanged>(_changeAppTheme);
  }

  void _changeAppTheme(AppEvent event, Emitter<AppState> emit) {
    // final desiredTheme = event.isDark;
  }
}

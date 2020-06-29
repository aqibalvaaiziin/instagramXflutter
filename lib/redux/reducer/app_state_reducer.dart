import 'package:instagramxflutter/redux/model/app_state_model.dart';
import 'package:instagramxflutter/redux/reducer/main_state_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(mainState: mainReducer(state.mainState, action));
}

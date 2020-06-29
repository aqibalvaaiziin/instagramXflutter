import 'package:instagramxflutter/redux/action/main_state_action.dart';
import 'package:instagramxflutter/redux/model/main_state_model.dart';
import 'package:redux/redux.dart';

final mainReducer = combineReducers<MainState>(
    [TypedReducer<MainState, dynamic>(_setMainState)]);

MainState _setMainState(MainState state, action) {
  if (action is SetImageByFollowing) {
    return state.copyWith(imageByFollowing: action.imageByFollowing);
  } else if (action is SetStory) {
    return state.copyWith(story: action.story);
  } else if (action is SetAllImage) {
    return state.copyWith(allImage: action.allImage);
  } else if (action is SetImageProfile) {
    return state.copyWith(imageProfile: action.imageProfile);
  } else if (action is SetImageComment) {
    return state.copyWith(imageComment: action.imageComment);
  } else if (action is SetAllVideo) {
    return state.copyWith(video: action.video);
  } else if (action is SetVideoComment) {
    return state.copyWith(videoComment: action.videoComment);
  }
  return state;
}

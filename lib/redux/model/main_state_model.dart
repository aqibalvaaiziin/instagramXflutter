import 'package:meta/meta.dart';

@immutable
class MainState {
  final List imageByFollowing;
  final List story;
  final List allImage;
  final List imageProfile;
  final List imageComment;
  final List video;
  final List videoComment;
  final List users;
  final List userFinded;

  MainState({
    @required this.imageByFollowing,
    @required this.story,
    @required this.allImage,
    @required this.imageProfile,
    @required this.imageComment,
    @required this.video,
    @required this.videoComment,
    @required this.users,
    @required this.userFinded,
  });

  factory MainState.initial() {
    return MainState(
      imageByFollowing: [],
      story: [],
      allImage: [],
      imageProfile: [],
      imageComment: [],
      video: [],
      videoComment: [],
      users: [],
      userFinded: [],
    );
  }

  MainState copyWith({
    List imageByFollowing,
    List story,
    List allImage,
    List imageProfile,
    List imageComment,
    List video,
    List videoComment,
    List users,
    List userFinded,
  }) {
    return MainState(
      imageByFollowing: imageByFollowing ?? this.imageByFollowing,
      story: story ?? this.story,
      allImage: allImage ?? this.allImage,
      imageProfile: imageProfile ?? this.imageProfile,
      imageComment: imageComment ?? this.imageComment,
      video: video ?? this.video,
      videoComment: videoComment ?? this.videoComment,
      users: users ?? this.users,
      userFinded: userFinded ?? this.userFinded,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainState &&
          runtimeType == other.runtimeType &&
          imageByFollowing == other.imageByFollowing &&
          story == other.story &&
          allImage == other.allImage &&
          imageProfile == other.imageProfile &&
          imageComment == other.imageComment &&
          video == other.video &&
          videoComment == other.videoComment &&
          users == other.users &&
          userFinded == other.userFinded;

  @override
  int get hashCode =>
      imageByFollowing.hashCode ^
      story.hashCode ^
      allImage.hashCode ^
      imageProfile.hashCode ^
      imageComment.hashCode ^
      video.hashCode ^
      videoComment.hashCode ^
      users.hashCode ^
      userFinded.hashCode;
}

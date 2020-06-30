import 'package:flutter/material.dart';
import './profile_page_view.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final bool isMe;
  final bool fromSearch;

  const ProfilePage({
    Key key,
    this.username,
    this.isMe,
    this.fromSearch,
  }) : super(key: key);

  @override
  ProfilePageView createState() => new ProfilePageView();
}

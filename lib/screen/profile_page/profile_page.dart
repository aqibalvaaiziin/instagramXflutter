import 'package:flutter/material.dart';
import './profile_page_view.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final bool isMe;

  const ProfilePage({
    Key key,
    this.username,
    this.isMe,
  }) : super(key: key);

  @override
  ProfilePageView createState() => new ProfilePageView();
}

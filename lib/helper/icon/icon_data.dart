import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomIcon {
  static Widget iconMore({size, color}) {
    return Icon(
      FontAwesome.bars,
      size: size,
      color: color,
    );
  }

  static Widget comment({size, color}) {
    return Icon(
      FontAwesome.comment,
      size: size,
      color: color,
    );
  }

  static Widget bookmark({size, color, bool status}) {
    return Icon(
      status ? FontAwesome.bookmark : FontAwesome.bookmark_o,
      size: size,
      color: color,
    );
  }

  static Widget favourite({size, bool statusIcon, bool statusColor}) {
    return Icon(
      statusIcon ? Icons.favorite : Icons.favorite_border,
      size: size,
      color: statusColor ? Colors.red : Colors.black,
    );
  }
}

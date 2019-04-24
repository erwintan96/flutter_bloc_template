import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class TabState extends Equatable {
  TabState([List props = const []]) : super(props);
}

class TabChangeIndex extends TabState {
  final int index;

  TabChangeIndex({@required this.index}) : super([index]);
}

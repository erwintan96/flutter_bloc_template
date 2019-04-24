import 'package:flutter/widgets.dart';
import 'package:secozy/repository/user_repository.dart';

class RepositoryProvider extends InheritedWidget {
  final UserRepository userRepository;

  RepositoryProvider({
    Key key,
    Widget child,
    @required this.userRepository,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static RepositoryProvider of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(RepositoryProvider)
          as RepositoryProvider);
}

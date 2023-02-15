import 'package:catalist/view/screens/add_comment_screen.dart';
import 'package:catalist/view/screens/main_dashboard_screen.dart';
import 'package:catalist/view/screens/my_team_dashboard_screen.dart';
import 'package:catalist/view/screens/team_attendance_screen.dart';

import '../../shared/index_shared.dart';
import '../../view/screens/index_screens.dart';

class AppRouter {
  static const String login = '/login';
  static const String uploadPhoto = '/uploadPhoto';
  static const String addComment = '/addComment';
  static const String mainDashBoard = '/mainDashBoard';
  static const String myTeam = '/myTeam';
  static const String teamAttendance = '/teamAttendance';
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case uploadPhoto:
        return MaterialPageRoute(
          builder: (_) => const UploadPhotoScreen(),
        );
      case addComment:
        return MaterialPageRoute(
          builder: (_) => AddCommentScreen(),
        );
      case mainDashBoard:
        return MaterialPageRoute(
          builder: (_) => const MainDashBoardScreen(),
        );
      case myTeam:
        return MaterialPageRoute(
          builder: (_) => const MyTeamDashBoardScreen(),
        );
      case teamAttendance:
        return MaterialPageRoute(
          builder: (_) => const TeamAttendanceScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppText.noRouteFound),
        ),
        body: const Center(
          child: Text(AppText.noRouteFound),
        ),
      ),
    );
  }
}

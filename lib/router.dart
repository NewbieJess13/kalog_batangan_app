import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kalog_batangan_app/features/login/login.dart';
import 'package:kalog_batangan_app/features/signup/views/signup.dart';
import 'package:kalog_batangan_app/features/signup/views/user_details.dart';
import 'package:kalog_batangan_app/models/earthquake_event.dart';
import 'package:kalog_batangan_app/providers/auth_provider.dart';
import 'package:kalog_batangan_app/features/earthquake_events/views/earthquake_event.dart';
import 'package:kalog_batangan_app/features/evac_centers/views/evac_center_map.dart';
import 'package:kalog_batangan_app/screens/edit_profile.dart';
import 'package:kalog_batangan_app/screens/main.dart';
import 'package:kalog_batangan_app/screens/news_feed.dart';
import 'package:kalog_batangan_app/screens/otp_page.dart';
import 'package:kalog_batangan_app/screens/profile.dart';
import 'package:kalog_batangan_app/screens/splash.dart';

final _rootNavigator = GlobalKey<NavigatorState>();
final _shellNavigator = GlobalKey<NavigatorState>();

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  return GoRouter(
      navigatorKey: _rootNavigator,
      initialLocation: SplashPage.routeLocation,
      routes: [
        // ShellRoute(
        //     navigatorKey: _shellNavigator,
        //     builder: (context, state, child) => MainPage(
        //           child: child,
        //         ),
        // routes: [
        GoRoute(
            path: EarthquakeEventPage.routeLocation,
            name: EarthquakeEventPage.routeName,
            builder: (context, state) => const EarthquakeEventPage()),
        GoRoute(
            path: NewsFeedPage.routeLocation,
            name: NewsFeedPage.routeName,
            builder: (context, state) => const NewsFeedPage()),
        GoRoute(
            path: EvacuationCenterMapPage.routeLocation,
            name: EvacuationCenterMapPage.routeName,
            builder: (context, state) => const EvacuationCenterMapPage()),
        GoRoute(
            path: ProfilePage.routeLocation,
            name: ProfilePage.routeName,
            builder: (context, state) => const ProfilePage()),
        // ]),
        GoRoute(
            path: SplashPage.routeLocation,
            name: SplashPage.routeName,
            builder: (context, state) => const SplashPage()),
        GoRoute(
            path: EditProfilePage.routeLocation,
            name: EditProfilePage.routeName,
            builder: (context, state) => const EditProfilePage()),
        GoRoute(
            path: MainPage.routeLocation,
            name: MainPage.routeName,
            builder: (context, state) => const MainPage()),
        GoRoute(
            path: OtpPage.routeLocation,
            name: OtpPage.routeName,
            builder: (context, state) => const OtpPage()),
        GoRoute(
            path: SignUpPage.routeLocation,
            name: SignUpPage.routeName,
            builder: (context, state) => const SignUpPage()),
        GoRoute(
            path: UserDetailsPage.routeLocation,
            name: UserDetailsPage.routeName,
            builder: (context, state) => const UserDetailsPage()),
        GoRoute(
          path: LoginPage.routeLocation,
          name: LoginPage.routeName,
          builder: (context, state) => const LoginPage(),
        )
      ],
      redirect: (context, state) {
        if (authState.isLoading || authState.hasError) return null;

        print(authState.valueOrNull);
        final isAuth = authState.valueOrNull != null;
        if (!isAuth && state.uri.toString() == SignUpPage.routeLocation)
          return null;
        final isSplash = state.uri.toString() == SplashPage.routeLocation;
        print(isSplash);
        if (isSplash) {
          return isAuth ? MainPage.routeLocation : LoginPage.routeLocation;
        }
        final isLoggingIn = state.uri.toString() == LoginPage.routeLocation;
        if (isLoggingIn) {
          return isAuth ? MainPage.routeLocation : null;
        }
        print(state.uri);
        return isAuth ? null : SplashPage.routeLocation;
      });
});

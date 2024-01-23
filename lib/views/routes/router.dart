import 'package:auto_route/auto_route.dart';
import 'package:hotels_exploration/views/routes/router.gr.dart';

///App Router
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = <AutoRoute>[
    AutoRoute(page: HotelRoute.page, initial: true),
    AutoRoute(page: RoomRoute.page),
    AutoRoute(page: ReservationRoute.page),
    AutoRoute(page: PaidRoute.page),
  ];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:hotels_exploration/views/pages/hotel_route.dart' as _i1;
import 'package:hotels_exploration/views/pages/paid_route.dart' as _i2;
import 'package:hotels_exploration/views/pages/reservation_route.dart' as _i3;
import 'package:hotels_exploration/views/pages/room_route.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HotelRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HotelRoute(),
      );
    },
    PaidRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PaidRoute(),
      );
    },
    ReservationRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ReservationRoute(),
      );
    },
    RoomRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RoomRoute(),
      );
    },
  };
}

/// generated route for
/// [_i1.HotelRoute]
class HotelRoute extends _i5.PageRouteInfo<void> {
  const HotelRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HotelRoute.name,
          initialChildren: children,
        );

  static const String name = 'HotelRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PaidRoute]
class PaidRoute extends _i5.PageRouteInfo<void> {
  const PaidRoute({List<_i5.PageRouteInfo>? children})
      : super(
          PaidRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaidRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ReservationRoute]
class ReservationRoute extends _i5.PageRouteInfo<void> {
  const ReservationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ReservationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReservationRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RoomRoute]
class RoomRoute extends _i5.PageRouteInfo<void> {
  const RoomRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoomRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

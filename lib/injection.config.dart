// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart'
    as _i11;
import 'package:hotels_exploration/domain/api/i_api_repository.dart' as _i3;
import 'package:hotels_exploration/domain/models/hotel/i_hotel_repository.dart'
    as _i5;
import 'package:hotels_exploration/domain/models/reservation/i_reservation_repository.dart'
    as _i7;
import 'package:hotels_exploration/domain/models/room/i_rooms_repository.dart'
    as _i9;
import 'package:hotels_exploration/infrastructure/api/api_repository.dart'
    as _i4;
import 'package:hotels_exploration/infrastructure/repositories/hotel/hotel_repository.dart'
    as _i6;
import 'package:hotels_exploration/infrastructure/repositories/reservation/reservation_repository.dart'
    as _i8;
import 'package:hotels_exploration/infrastructure/repositories/rooms/rooms_repository.dart'
    as _i10;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IAPIRepository>(() => _i4.APIRepository());
    gh.lazySingleton<_i5.IHotelRepository>(
        () => _i6.HotelRepository(gh<_i3.IAPIRepository>()));
    gh.lazySingleton<_i7.IReservationRepository>(
        () => _i8.ReservationRepository(gh<_i3.IAPIRepository>()));
    gh.lazySingleton<_i9.IRoomsRepository>(
        () => _i10.RoomsRepository(gh<_i3.IAPIRepository>()));
    gh.factory<_i11.HotelsUiLogicBloc>(
        () => _i11.HotelsUiLogicBloc(gh<_i5.IHotelRepository>()));
    return this;
  }
}

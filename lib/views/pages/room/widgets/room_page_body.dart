import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/app_logic/rooms_ui_logic/rooms_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/models/models_failure.dart';
import 'package:hotels_exploration/domain/models/room/room_model.dart';
import 'package:hotels_exploration/domain/models/room/rooms_list_model.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/pages/room/widgets/room_card/room_card.dart';
import 'package:hotels_exploration/views/routes/router.gr.dart';
import 'package:hotels_exploration/views/widgets/failure_widget.dart';
import 'package:hotels_exploration/views/widgets/loading.dart';

///Room Page Body
class RoomPageBody extends StatelessWidget {
  ///Constructor
  const RoomPageBody({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<RoomsUiLogicBloc, RoomsUiLogicState>(
        builder: (_, RoomsUiLogicState roomsUiLogicState) {
          return roomsUiLogicState.maybeWhen(
            orElse: Container.new,
            loading: () => const Loading(),
            actionFailure: (ModelsFailure failure) => FailureWidget(
              failure: failure.maybeMap(
                  orElse: () => S.current.errorFetchingDataFromAPI,
                  fetchRoomsListFailure: (_) =>
                      S.current.errorFetchReservationDataFailure),
            ),
            actionSuccess: (
              RoomsListModel rooms,
              int? currentIndex,
              CarouselController? controller,
            ) =>
                buildBody(rooms, controller, currentIndex),
          );
        },
      );

  ///build Body
  ListView buildBody(RoomsListModel rooms, CarouselController? controller,
          int? currentIndex) =>
      ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 5, bottom: 5),
        itemCount: rooms.roomsList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final RoomModel? roomModel = rooms.roomsList?.elementAt(index);
          return Column(
            children: [
              SizedBox(height: 10),
              buildRoomCard(controller, currentIndex, roomModel, context),
            ],
          );
        },
      );

  /// build Room Card
  RoomCard buildRoomCard(CarouselController? controller, int? currentIndex,
          RoomModel? roomModel, BuildContext context) =>
      RoomCard(
        controller: controller!,
        currentIndex: currentIndex!,
        imgList: roomModel?.imageUrls ?? [],
        roomName: roomModel?.name ?? '',
        roomPeculiarities: roomModel?.peculiarities ?? [],
        roomPrice: '${roomModel?.price ?? ''}',
        roomPricePer: roomModel?.pricePer ?? '',
        onPageChanged: (int imageIndex, CarouselPageChangedReason reason) {
          context
              .read<RoomsUiLogicBloc>()
              .add(RoomsUiLogicEvent.imageSliderChanged(imageIndex));
        },
        onPressSelectRoom: () {
          context
              .read<ReservationUiLogicBloc>()
              .add(const ReservationUiLogicEvent.getReservationData());
          context.router.push(ReservationRoute());
        },
      );
}

import 'dart:async';
import 'dart:io';

import 'package:ayi_connect/core/data/model/province.dart';
import 'package:ayi_connect/core/data/repository/master/master_repository.dart';
import 'package:ayi_connect/core/utils/calculate_distance.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

part 'personal_information_event.dart';
part 'personal_information_state.dart';

@injectable
class PersonalInformationBloc
    extends Bloc<PersonalInformationEvent, PersonalInformationState> {
  final MasterRepository _repository;
  var province = <Province>[];
  PersonalInformationBloc(this._repository)
      : super(PersonalInformationInitial()) {
    on<ChoosePhotoEvent>(((event, emit) {
      emit(PhotoChoosenState(event.file));
    }));

    on<GetCurrentLocationEvent>((event, emit) async {
      final position = await _determinePosition();
      province.sort((a, b) {
        final distanceA = calculateDistance(
            position.latitude, position.longitude, a.lat, a.lng);
        final distanceB = calculateDistance(
            position.latitude, position.longitude, b.lat, b.lng);
        return distanceA.compareTo(distanceB);
      });
      emit(ProvinceListState(data: province, nearestPlace: province.first));
    });

    on<GetProvinceEvent>((event, emit) async {
      final result = await _repository.getProvinces();
      result.fold((l) => debugPrint(l.getError()), (r) {
        province = [...r];
        emit(ProvinceListState(data: r));
        add(GetCurrentLocationEvent());
      });
    });

    on<SetBirthdateEvent>((event, emit) {
      emit(BirthdateState(event.data));
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}

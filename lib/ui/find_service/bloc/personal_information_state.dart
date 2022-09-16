part of 'personal_information_bloc.dart';

abstract class PersonalInformationState extends Equatable {
  const PersonalInformationState();

  @override
  List<Object?> get props => [];
}

class PersonalInformationInitial extends PersonalInformationState {}

class PhotoChoosenState<T> extends PersonalInformationState {
  final File photo;

  const PhotoChoosenState(this.photo);

  @override
  List<Object?> get props => [photo];
}

class ProvinceListState extends PersonalInformationState {
  final List<Province> data;
  final Province? nearestPlace;
  const ProvinceListState({required this.data, this.nearestPlace});

  @override
  List<Object?> get props => [data, nearestPlace];
}

class BirthdateState extends PersonalInformationState {
  final DateTime data;

  const BirthdateState(this.data);

  @override
  List<Object?> get props => [data];
}

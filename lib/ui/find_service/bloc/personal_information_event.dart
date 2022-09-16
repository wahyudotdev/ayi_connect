part of 'personal_information_bloc.dart';

abstract class PersonalInformationEvent extends Equatable {
  const PersonalInformationEvent();

  @override
  List<Object?> get props => [];
}

class ChoosePhotoEvent extends PersonalInformationEvent {
  final File file;

  const ChoosePhotoEvent(this.file);

  @override
  List<Object?> get props => [file];
}

class GetCurrentLocationEvent extends PersonalInformationEvent {}

class GetProvinceEvent extends PersonalInformationEvent {}

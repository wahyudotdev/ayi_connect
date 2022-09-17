part of 'profesional_information_bloc.dart';

abstract class ProfesionalInformationState extends Equatable {
  const ProfesionalInformationState();

  @override
  List<Object> get props => [];
}

class ProfesionalInformationInitial extends ProfesionalInformationState {}

class SelectedLanguage extends ProfesionalInformationState {
  final List<String> data;

  const SelectedLanguage(this.data);

  @override
  List<Object> get props => [data];
}

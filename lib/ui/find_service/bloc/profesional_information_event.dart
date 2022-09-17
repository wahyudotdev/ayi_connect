part of 'profesional_information_bloc.dart';

abstract class ProfesionalInformationEvent extends Equatable {
  const ProfesionalInformationEvent();

  @override
  List<Object> get props => [];
}

class SelectLanguage extends ProfesionalInformationEvent {
  final List<String> data;

  const SelectLanguage(this.data);
  @override
  List<Object> get props => [data];
}

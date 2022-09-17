import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'profesional_information_event.dart';
part 'profesional_information_state.dart';

@injectable
class ProfesionalInformationBloc
    extends Bloc<ProfesionalInformationEvent, ProfesionalInformationState> {
  ProfesionalInformationBloc() : super(ProfesionalInformationInitial()) {
    on<SelectLanguage>((event, emit) {
      emit(SelectedLanguage(event.data));
    });
  }
}

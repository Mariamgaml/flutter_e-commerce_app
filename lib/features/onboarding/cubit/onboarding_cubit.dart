import 'package:bloc/bloc.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState(currentPage: 0));

  void changePage(int index) {
    emit(state.copyWith(currentPage: index));
  }

  void nextPage() {
    emit(state.copyWith(currentPage: state.currentPage + 1));
  }

  void previousPage() {
    if (state.currentPage > 0) {
      emit(state.copyWith(currentPage: state.currentPage - 1));
    }
  }
}

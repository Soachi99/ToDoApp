// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomFilterState {
  final int filterState;

  CustomFilterState({this.filterState = 0});

  CustomFilterState copyWith({
    int? filterState,
  }) {
    return CustomFilterState(
      filterState: filterState ?? this.filterState,
    );
  }
}

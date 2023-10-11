class CustomTaskState {
  final bool expand;
  final bool completed;

  CustomTaskState({
    this.expand = false,
    this.completed = false,
  });

  CustomTaskState copyWith({
    bool? expand,
    bool? completed,
  }) {
    return CustomTaskState(
      expand: expand ?? this.expand,
      completed: completed ?? this.completed,
    );
  }
}

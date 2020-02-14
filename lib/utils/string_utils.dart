extension NullEmptyCheck on String {
  bool isNullOrEmpty() => this == null || this.isEmpty;

  bool isNonNullOrEmpty() => this != null && this.isNotEmpty;
}

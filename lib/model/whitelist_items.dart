import 'package:equatable/equatable.dart';

class WhitelistItems extends Equatable {
  const WhitelistItems({
    required this.id,
    required this.value,
     this.isDeleting=false,
     this.isFavourite=false,
  });

  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavourite;

  WhitelistItems copyWith({
    String? id,
    String? value,
    bool? isDeleting,
    bool? isFavourite,
  }) {
    return WhitelistItems(
      id: id ?? this.id,
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  List<Object?> get props => [id, value,isDeleting,isFavourite];
}

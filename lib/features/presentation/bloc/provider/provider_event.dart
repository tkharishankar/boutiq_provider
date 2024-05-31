part of 'provider_bloc.dart';

class ProviderEvent extends Equatable {
  const ProviderEvent();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class GetDashboardDetail extends ProviderEvent {
  const GetDashboardDetail();
}

class GetProviderDetail extends ProviderEvent {
  const GetProviderDetail();
}

class UpdateProviderDetail extends ProviderEvent {
  final String companyName;
  final String placeName;
  final String contactName;
  final String contactNumber;
  final String? bannerImageUrl;
  final bool isImageChanged;
  final XFile? file;

  const UpdateProviderDetail({
    required this.companyName,
    required this.placeName,
    required this.contactName,
    required this.contactNumber,
    this.bannerImageUrl,
    required this.isImageChanged,
    this.file,
  });
}

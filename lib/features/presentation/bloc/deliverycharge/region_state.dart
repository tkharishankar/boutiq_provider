part of 'region_bloc.dart';

@freezed
class RegionState with _$RegionState {
  const factory RegionState.initial() = RegionStateInitial;
  const factory RegionState.loading() = RegionStateLoading;
  const factory RegionState.loaded(List<Region> regions) = RegionStateLoaded;
  const factory RegionState.error(String message) = RegionStateError;
}
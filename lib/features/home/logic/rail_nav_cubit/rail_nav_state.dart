import 'package:freezed_annotation/freezed_annotation.dart';
part 'rail_nav_state.freezed.dart';

@freezed
class RailNavState<NavigationRailPage> with _$RailNavState<NavigationRailPage> {
  const factory RailNavState.railNavBarState({required NavigationRailPage page}) = RailNavBarState<NavigationRailPage>;
}

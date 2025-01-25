import 'package:abhiyanth/services/departments/chemical_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Service provider for TechEventsService
final techEventsServiceProvider = Provider<ChemicalTechService>((ref) {
  return ChemicalTechService();
});

/// StateNotifier for managing tech events data
class TechEventsNotifier
    extends StateNotifier<AsyncValue<Map<String, List<Map<String, dynamic>>>>> {
  final ChemicalTechService _service;

  TechEventsNotifier(this._service) : super(const AsyncValue.loading());

  /// Fetch all tech events and categorize them into ongoing and upcoming
  Future<void> fetchTechEvents() async {
    try {
      state = const AsyncValue.loading();
      final data = await _service.getTechEvents();
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

/// StateNotifierProvider for TechEventsNotifier
final chemicalEventsProvider = StateNotifierProvider<
    TechEventsNotifier,
    AsyncValue<Map<String, List<Map<String, dynamic>>>>>(
  (ref) => TechEventsNotifier(ref.watch(techEventsServiceProvider)),
);
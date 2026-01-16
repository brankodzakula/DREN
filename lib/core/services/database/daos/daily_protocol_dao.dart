import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'daily_protocol_dao.g.dart';

@DriftAccessor(tables: [DailyProtocols])
class DailyProtocolDao extends DatabaseAccessor<AppDatabase>
    with _$DailyProtocolDaoMixin {
  DailyProtocolDao(super.db);

  /// Get protocol for a specific date
  Future<DailyProtocol?> getProtocolForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(dailyProtocols)
          ..where((t) => t.date.isBetweenValues(startOfDay, endOfDay)))
        .getSingleOrNull();
  }

  /// Get today's protocol
  Future<DailyProtocol?> getTodayProtocol() async {
    return getProtocolForDate(DateTime.now());
  }

  /// Insert or update daily protocol
  Future<void> upsertProtocol(DailyProtocolsCompanion protocol) async {
    await into(dailyProtocols).insertOnConflictUpdate(protocol);
  }

  /// Get protocols for date range
  Future<List<DailyProtocol>> getProtocolsInRange(
      DateTime start, DateTime end) async {
    return (select(dailyProtocols)
          ..where((t) => t.date.isBetweenValues(start, end))
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .get();
  }

  /// Delete old protocols (older than 30 days)
  Future<void> deleteOldProtocols() async {
    final cutoff = DateTime.now().subtract(const Duration(days: 30));
    await (delete(dailyProtocols)..where((t) => t.date.isSmallerThanValue(cutoff)))
        .go();
  }
}

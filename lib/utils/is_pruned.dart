import 'package:apex_vigne/collections/session.collection.dart';

bool isPruned(Session session) {
  return session.apexFullGrowth == 0 && session.apexSlowerGrowth == 0 && session.apexStuntedGrowth == 0;
}

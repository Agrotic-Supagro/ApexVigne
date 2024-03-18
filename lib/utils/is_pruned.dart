import 'package:apex_vigne/collections/session.collection.dart';

bool isPruned(Session s) {
  return s.apexFullGrowth == 0 && s.apexSlowerGrowth == 0 && s.apexStuntedGrowth == 0;
}

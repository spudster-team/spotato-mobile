import 'package:dartz/dartz.dart';

import '../models/request_model.dart';

abstract class RequestService {
  Future<bool> createRequest(RequestModel request);
  Future<Either<String, List<RequestModel>>> getAllRequests();
  Future<Either<String, List<RequestModel>>> getRequestsFrom(String userId);
  Future<Either<String, List<RequestModel>>> getRequestDetail(String requestId);
  Future<bool> cancelRequest(RequestModel request);
  Future<bool> startRequest(RequestModel request);
  Future<bool> stopRequest(RequestModel request);
}
import 'package:grpc/grpc_web.dart';
import 'package:project_39_fe/src/generated/project_39/v1/project_39.pbgrpc.dart';

Project39ServiceClient newRpcClient() {
  final GrpcWebClientChannel chan =
      GrpcWebClientChannel.xhr(Uri.parse("http://127.0.0.1:3250"));
  return Project39ServiceClient(chan);
}

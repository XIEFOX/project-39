use project_39_be::project_39_pb::{project39_service_server::Project39Service, *};
use tonic::{Request, Response, Status};

#[tokio::main]
async fn main() {
    env_logger::init();
}

type GrpcResult<T> = std::result::Result<Response<T>, Status>;

struct MikuServer {}

#[tonic::async_trait]
impl Project39Service for MikuServer {
    async fn get_user_info(
        &self,
        request: Request<GetUserInfoRequest>,
    ) -> GrpcResult<GetUserInfoResponse> {
        todo!()
    }
    async fn put_user_info(
        &self,
        request: Request<PutUserInfoRequest>,
    ) -> GrpcResult<PutUserInfoResponse> {
        todo!()
    }
    async fn del_user_info(
        &self,
        request: Request<DelUserInfoRequest>,
    ) -> GrpcResult<DelUserInfoResponse> {
        todo!()
    }

    async fn log_in(&self, request: Request<LogInRequest>) -> GrpcResult<LogInResponse> {
        todo!()
    }
    async fn log_out(&self, request: Request<LogOutRequest>) -> GrpcResult<LogOutResponse> {
        todo!()
    }

    async fn get_display_object_batch(
        &self,
        request: Request<GetDisplayObjectBatchRequest>,
    ) -> GrpcResult<GetDisplayObjectBatchResponse> {
        todo!()
    }
    async fn put_display_object_batch(
        &self,
        request: Request<PutDisplayObjectBatchRequest>,
    ) -> GrpcResult<PutDisplayObjectBatchResponse> {
        todo!()
    }
    async fn del_display_object(
        &self,
        request: Request<DelDisplayObjectRequest>,
    ) -> GrpcResult<DelDisplayObjectResponse> {
        todo!()
    }

    async fn get_display_object_status(
        &self,
        request: Request<GetDisplayObjectStatusRequest>,
    ) -> GrpcResult<GetDisplayObjectStatusResponse> {
        todo!()
    }
    async fn put_display_object_status(
        &self,
        request: Request<PutDisplayObjectStatusRequest>,
    ) -> GrpcResult<PutDisplayObjectStatusResponse> {
        todo!()
    }
}

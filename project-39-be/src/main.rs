use project_39_be::project_39_pb::{
    project39_service_server::{Project39Service, Project39ServiceServer},
    *,
};
use project_39_be::user;
use sqlx::{sqlite::SqlitePoolOptions, Pool, Sqlite};
use tonic::{transport::Server, Request, Response, Status};

const SERVER_ADDR: &str = "127.0.0.1:3250";
const SQLITE_DATABASE_URL: &str = "sqlite://../data/db/test_db.db";

#[tokio::main]
async fn main() {
    env_logger::init();

    let miku_server = Project39ServiceServer::new(MikuServer::new().await);

    log::info!("Server will start listening at `{SERVER_ADDR}`");

    Server::builder()
        .add_service(miku_server)
        .serve(SERVER_ADDR.parse().unwrap())
        .await
        .unwrap();
}

type GrpcResult<T> = std::result::Result<Response<T>, Status>;

struct MikuServer {
    sqlite_pool: Pool<Sqlite>,
}

impl MikuServer {
    async fn new() -> Self {
        let sqlite_pool = SqlitePoolOptions::new()
            .max_connections(1)
            .connect(SQLITE_DATABASE_URL)
            .await
            .unwrap();

        Self { sqlite_pool }
    }
}

#[tonic::async_trait]
impl Project39Service for MikuServer {
    async fn get_user_info(
        &self,
        request: Request<GetUserInfoRequest>,
    ) -> GrpcResult<GetUserInfoResponse> {
        user::get_user_info(&self.sqlite_pool, request.into_inner().user_id)
            .await
            .map_err(|err| Status::aborted(err.to_string()))
            .map(|x| Response::new(x))
    }
    async fn put_user_info(
        &self,
        request: Request<PutUserInfoRequest>,
    ) -> GrpcResult<PutUserInfoResponse> {
        let request = request.into_inner();
        let user_name: String = request.user_name;
        let user_email: String = request.user_email;
        let profile_picture_bin = request.profile_picture_bin;
        let profile_picture_bin = if profile_picture_bin.is_empty() {
            None
        } else {
            Some(profile_picture_bin)
        };
        let password: String = request.password;

        user::put_user_info(
            &self.sqlite_pool,
            user_name,
            user_email,
            profile_picture_bin,
            password,
        )
        .await
        .map_err(|err| Status::aborted(err.to_string()))
        .map(Response::new)
    }
    async fn del_user_info(
        &self,
        _request: Request<DelUserInfoRequest>,
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

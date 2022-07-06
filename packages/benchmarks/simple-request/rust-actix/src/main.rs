use actix_web::{get, web, App, HttpServer};
use serde::{Deserialize};

#[derive(Deserialize)]
struct Name {
    name: String,
}

#[get("/")]
async fn hello(info: web::Query<Name>) -> String {
    format!("Hello {}", info.name)
}


#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(hello)
    })
    .bind("0.0.0.0:3000")?
    .run()
    .await
}
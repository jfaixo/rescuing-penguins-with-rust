package vision.singular.talks.rescuing_pingu.simple_request

import io.vertx.core.AbstractVerticle
import io.vertx.core.DeploymentOptions
import io.vertx.core.http.HttpClientOptions
import io.vertx.core.http.HttpServerOptions
import io.vertx.ext.web.Router

class ChildVerticle : AbstractVerticle() {
  override fun start() {
    // Create a Router
    val router = Router.router(vertx)

    // Mount the handler for all incoming requests at every path and HTTP method
    router.route().handler { context ->
      // Get the query parameter "name"
      val queryParams = context.queryParams()
      val name = queryParams.get("name") ?: "unknown"
      // Write a json response
      context.end("Hello $name")
    }

    // Create the HTTP server
    vertx.createHttpServer()
      // Handle every request using the router
      .requestHandler(router)
      .requestHandler(router)
      // Start listening
      .listen(3000)
      // Print the port
      .onSuccess { server ->
        println("HTTP server started on port " + server.actualPort())
      }
  }
}

class MainVerticle : AbstractVerticle() {

  override fun start() {
    // Create a Router
    val router = Router.router(vertx)

    // Mount the handler for all incoming requests at every path and HTTP method
    router.route().handler { context ->
      // Get the query parameter "name"
      val queryParams = context.queryParams()
      val name = queryParams.get("name") ?: "unknown"
      // Write a json response
      context.end("Hello $name")
    }

    vertx.deployVerticle(ChildVerticle::class.java, DeploymentOptions().setInstances(16))

    // Create the HTTP server

  }
}

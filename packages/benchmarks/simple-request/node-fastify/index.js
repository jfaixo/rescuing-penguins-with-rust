import Fastify from 'fastify'

const fastify = Fastify({
  logger: false
})

// Declare a route
fastify.get('/', function (request, reply) {
  reply.send("Hello " + request.query.name)
})

// Run the server!
fastify.listen(3000, '0.0.0.0', function (err, address) {
  if (err) {
    fastify.log.error(err)
    process.exit(1)
  }
  // Server is now listening on ${address}
})
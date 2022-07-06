import Fastify from 'fastify'
import cluster from 'cluster'
import { cpus } from 'os'

const numCPUs = cpus().length;


if (cluster.isPrimary) {
  console.log(`Primary ${process.pid} is running`);

  // Fork workers.
  for (let i = 0; i < numCPUs; i++) {
    cluster.fork();
  }

  cluster.on('exit', (worker, code, signal) => {
    console.log(`worker ${worker.process.pid} died`);
  });
}
else {
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
    
    console.log(`Worker ${process.pid} started`);
  })
}

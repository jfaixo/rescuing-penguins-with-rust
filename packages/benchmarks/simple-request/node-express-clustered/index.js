import express from 'express';
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
    const app = express();

    app.get('/', (req, res) => {

        res.send('Hello ' + req.query.name);
    });

    app.listen(3000, () =>
        console.log('Listening on port 3000'),
    );

    console.log(`Worker ${process.pid} started`);
}

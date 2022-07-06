# Rescuing penguins with Rust

## Quick links

- [Slide Decks](packages/deck)
- [Monitoring setup](packages/green-bench): Helm chart of the monitoring setup used
- [Demo scripts](packages/demo-scripts): Script to ease live demos
- [Memory Toy](packages/memory-toy): Source code of the small binary used to test memory state power consumption
- Benchmarks :
  - Simple Request: A single route server that takes a query parameter `name`, and returns `Hello {name}`
    - [node-express](packages/benchmarks/simple-request/node-express): Naive NodeJS + Express implementation
    - [node-express-clustered](packages/benchmarks/simple-request/node-express-clustered): Naive NodeJS + Express implementation multithreaded for the rpi4
    - [node-fastify](packages/benchmarks/simple-request/node-fastify): NodeJS + Fastify implementation
    - [node-fastify-clustered](packages/benchmarks/simple-request/node-fastify-clustered): NodeJS + Fastify implementation multithreaded for the rpi4
    - [kotlin-vertx](packages/benchmarks/simple-request/kotlin-vertx): Kotlin JVM + Vert.x implementation multithreaded for the rpi4
    - [rust-actix](packages/benchmarks/simple-request/rust-actix): Rust + Actix implementation

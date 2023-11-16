# Swarm 101

1. Initial Docker Swarm

   ```sh
   docker swarm init --advertise-addr 127.0.0.1
   ```

2. Start the registry as a service on your swarm

   ```sh
   docker service create --name registry --publish published=5000,target=5000 registry:2
   ```

3. List services

   ```sh
   docker service ls
   ```

4. Start Docker Compose and Push Image to Registry

   ```sh
   docker compose up -d
   docker compose down
   docker compose push
   ```

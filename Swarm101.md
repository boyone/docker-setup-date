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

5. Deploy a new `Stack`

   ```sh
   docker stack deploy --compose-file docker-compose.yml date-api
   ```

6. List stacks

   ```sh
   docker stack ls
   ```

7. List the services in the stack

   ```sh
   docker stack services date-api
   ```

8. Scale one or multiple replicated services

   ```sh
   docker service scale date-api_api=4
   ```

9. Remove one or more services

   ```sh
   docker service rm registry
   docker service rm date-api_api
   ```

   or remove by stack

   ```sh
   docker stack rm date-api
   ```

10. Leave the swarm

    ```sh
    docker swarm leave --force
    ```

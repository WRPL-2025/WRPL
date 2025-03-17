# WRPL
### How to run the project
```
clone the project : ~$ git clone https://github.com/WRPL-2025/WRPL.git
Run docker in the root: ~$ sudo docker-compose up -d
```
# Do this after Dockerfile update 
```
docker compose down -v
docker compose build [container name]
```

# Useful Links

- [Docker](https://www.docker.com/)
- [ReactJS](https://reactjs.org/)
- [Node.js](https://nodejs.org/)
- [PostgreSQL](https://www.postgresql.org/)
- [TypeScript](https://www.typescriptlang.org/)

# Database Connection Information

## PostgreSQL Connection Details
- Host: localhost
- Port: 5432
- Database: anycademy
- Username: postgres
- Password: [stored in password manager]

## Connection Commands
```bash
# Connect to database
docker exec -it anycademy-database-1 psql -U postgres -d anycademy

# Using connection string
postgresql://postgres:password@localhost:5432/anycademy
```

## Connecting to the PostgreSQL Container

If you encounter an error like:
```
psql: error: connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: No such file or directory
  Is the server running locally and accepting connections on that socket?
```
This is likely because you're starting a new container with `docker run`, rather than connecting to the already running database container.

**Solution:**

1. Ensure the database container is running:
   ```
   docker ps
   ```
2. Connect using docker exec:
   ```
   docker exec -it anycademy-database psql -U postgres
   ```

This will connect you to the running PostgreSQL server inside the container.

## Database Initialization Note

If you run:
  docker exec -it anycademy-anycademy-database-1 psql -U postgres -d anycademy

and then execute \dt, you might see no relations. This happens because the SQL dump file creates a database named "grocerry" and switches to it, while the default database provided (via POSTGRES_DB) is "anycademy". 

To resolve this:
1. Either update the SQL dump (remove or adjust the CREATE DATABASE and USE statements) so that tables are created in "anycademy", or
2. Connect to the correct database (if "grocerry" exists) using:
   docker exec -it anycademy-anycademy-database-1 psql -U postgres -d grocerry

Also, verify container logs for any initialization errors:
  docker logs anycademy-anycademy-database-1

## Security Best Practices
1. Store password in a password manager
2. Use environment variables in production
3. Never commit real credentials to git
4. Rotate passwords periodically

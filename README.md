# E-Commerce MVC App

This is a .NET 10.0 MVC application integrated with SQL Server using Docker.

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running.
- [.NET 10 SDK](https://dotnet.microsoft.com/download/dotnet/10.0) (optional, for local development).

## Getting Started

### 1. Start the Application

To build and start the entire stack (Application + SQL Server), run the following command in the root directory:

```bash
docker-compose up --build
```

### 2. Access the Application

Once the containers are running and the database health check passes:
- **Web App:** [http://localhost:5163](http://localhost:5163)
- **SQL Server:** `localhost,1433` (Username: `sa`, Password: `YourStrong@Password123`)

### 3. Stopping the Application

To stop and remove the containers:

```bash
docker-compose down
```

## Project Structure

- `E-Commerce-MVC/`: The main ASP.NET Core MVC project.
- `Dockerfile`: Multi-stage build for the MVC app.
- `docker-compose.yml`: Orchestrates the app and the SQL Server database.
- `.dockerignore`: Optimizes the Docker build by excluding unnecessary files.

## Environment Variables

The application is configured for a **Development** environment by default in Docker. Connection strings and ports are managed via the `docker-compose.yml` file.

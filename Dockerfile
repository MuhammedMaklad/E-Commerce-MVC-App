FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /source

# Copy csproj and restore as distinct layers
COPY ["E-Commerce-MVC/E-Commerce-MVC.csproj", "E-Commerce-MVC/"]
RUN dotnet restore "E-Commerce-MVC/E-Commerce-MVC.csproj"

# Copy everything else and build
COPY . .
WORKDIR "/source/E-Commerce-MVC"
RUN dotnet build "E-Commerce-MVC.csproj" -c Debug -o /app/build

FROM build AS publish
RUN dotnet publish "E-Commerce-MVC.csproj" -c Debug -o /app/publish /p:UseAppHost=false

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .

# Set environment to Development for detailed errors
ENV ASPNETCORE_ENVIRONMENT=Development
# Ensure the app listens on the port defined in docker-compose
ENV ASPNETCORE_URLS=http://+:5163

ENTRYPOINT ["dotnet", "E-Commerce-MVC.dll"]

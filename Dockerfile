# FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal AS base
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine AS base
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:5229

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-dotnet-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser


# FROM mcr.microsoft.com/dotnet/sdk:6.0-focal AS build-env
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build-env
WORKDIR /app
# Copy csproj and restore as distinct layers

# Copy everything else and build
COPY . ./
RUN dotnet build "date.csproj" -c Release -o /app/out
RUN dotnet publish "date.csproj" -c Release -o out
# RUN dotnet publish -c Release -o out


FROM base AS final
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "date.dll"]
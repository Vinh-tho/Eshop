# Use the .NET 9 SDK image to restore dependencies and compile the API.
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

# Keep the source tree under /src so all project references resolve correctly.
WORKDIR /src

# Copy the backend, including its referenced Library and Services projects.
COPY eShop.API/ ./eShop.API/

# Restore all NuGet dependencies declared by the backend project.
WORKDIR /src/eShop.API
RUN dotnet restore "eShop.API.csproj"

# Publish a framework-dependent release without creating a native app host.
RUN dotnet publish "eShop.API.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Use the smaller ASP.NET Core runtime image for the final container.
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS final

# Run the published application from /app.
WORKDIR /app

# Make Program.cs bind the HTTP server to the container port.
ENV PORT=8080

# Copy only published runtime files into the final image.
COPY --from=build /app/publish .

# Document the HTTP port used by the API.
EXPOSE 8080

# Start the ASP.NET Core API.
ENTRYPOINT ["dotnet", "eShop.API.dll"]

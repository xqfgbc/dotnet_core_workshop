FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./webapi/
WORKDIR /app/webapi
RUN dotnet restore

# copy and publish app and libraries
WORKDIR /app/
COPY . ./webapi/
WORKDIR /app/webapi
RUN dotnet publish -c Release -o out


FROM microsoft/dotnet:2.2.0-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/webapi/out ./
ENTRYPOINT ["dotnet", "webapi.dll"]
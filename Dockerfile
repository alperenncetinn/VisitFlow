# syntax=docker/dockerfile:1
# Build requires the private source tree (src/) in the build context; it is not part of the public repo.
# The SDK stage runs on the build machine's own architecture: the output is portable IL (UseAppHost=false),
# so the same publish output serves both linux/amd64 and linux/arm64 runtime images.
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY global.json Directory.Build.props Directory.Packages.props ./
COPY src/VisitFlow.Core/VisitFlow.Core.csproj src/VisitFlow.Core/
COPY src/VisitFlow.Infrastructure/VisitFlow.Infrastructure.csproj src/VisitFlow.Infrastructure/
COPY src/VisitFlow.Web/VisitFlow.Web.csproj src/VisitFlow.Web/
RUN dotnet restore src/VisitFlow.Web/VisitFlow.Web.csproj
COPY src/ src/
# No .pdb symbols in the distributed image: they carry source paths/line maps that ease reverse engineering.
RUN dotnet publish src/VisitFlow.Web/VisitFlow.Web.csproj -c Release -o /app --no-restore /p:UseAppHost=false \
    /p:DebugType=none /p:DebugSymbols=false

FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
ARG VERSION=dev
LABEL org.opencontainers.image.title="VisitFlow" \
      org.opencontainers.image.description="Kurumsal ziyaretçi yönetimi: KVKK onayı, İSG eğitimi, QR geçiş, denetim kaydı" \
      org.opencontainers.image.authors="Alperen Çetin" \
      org.opencontainers.image.source="https://github.com/alperenncetinn/VisitFlow" \
      org.opencontainers.image.licenses="LicenseRef-VisitFlow-Noncommercial-1.0" \
      org.opencontainers.image.version="${VERSION}"
WORKDIR /app
COPY --from=build /app ./
COPY LICENSE THIRD-PARTY-NOTICES.md /app/
# Writable state lives in volumes; the application files themselves stay read-only for the app user.
RUN mkdir -p /app/App_Data/keys /app/App_Data/mail && chown -R $APP_UID /app/App_Data
USER $APP_UID
ENV ASPNETCORE_HTTP_PORTS=8080 \
    ASPNETCORE_ENVIRONMENT=Production \
    DOTNET_RUNNING_IN_CONTAINER=true \
    Security__HttpsRedirection=false
EXPOSE 8080
VOLUME ["/app/App_Data"]
ENTRYPOINT ["dotnet", "VisitFlow.Web.dll"]

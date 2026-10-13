# Third-party notices

VisitFlow uses the following third-party components. Each is licensed under its own terms; the VisitFlow
Noncommercial License does not apply to them.

| Component | License | Where |
|---|---|---|
| .NET / ASP.NET Core / Entity Framework Core | MIT | NuGet |
| Npgsql, Npgsql.EntityFrameworkCore.PostgreSQL | PostgreSQL License | NuGet |
| EFCore.NamingConventions | Apache-2.0 | NuGet |
| Microsoft.IdentityModel.* | MIT | NuGet |
| Sustainsys.Saml2 / Sustainsys.Saml2.AspNetCore2 | MIT | NuGet |
| MailKit / MimeKit | MIT | NuGet |
| QRCoder | MIT | NuGet |
| @microsoft/signalr 9.0.19 (`wwwroot/lib/signalr`) | MIT | vendored |
| jsQR 1.4.0 (`wwwroot/lib/jsqr`) | Apache-2.0 | vendored |
| Inter 5.3.0 variable font (`wwwroot/lib/inter`) | SIL OFL 1.1 | vendored |
| Lucide icon paths (`src/VisitFlow.Web/Icons.cs`) | ISC | adapted |
| xUnit, Microsoft.NET.Test.Sdk, coverlet (tests only) | Apache-2.0 / MIT | NuGet |

Vendored browser files and their SHA-256 hashes (verify after updating):

```
95dbd9a7eb7db7b1228a49421f7e6babd8f70ff2ca6a40053f87ceee60f46c77  wwwroot/lib/signalr/signalr.min.js
bc40c8a15196236b2314db0856f72ca0b49980cd5413b8c852a7349f5fee0859  wwwroot/lib/jsqr/jsQR.js
3100e775e8616cd2611beecfa23a4263d7037586789b43f035236a2e6fbd4c62  wwwroot/lib/inter/inter-latin-wght-normal.woff2
34b9c504cab7a73e37b746343a449132e56cf7b5481af2cb81dc74dcff25c956  wwwroot/lib/inter/inter-latin-ext-wght-normal.woff2
```

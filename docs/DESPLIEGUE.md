# Despliegue en un hosting gratuito

El sistema es una aplicación **ASP.NET Web Forms sobre .NET Framework 4.7.2**, así que necesita un servidor **Windows con IIS**. No puede alojarse en GitHub Pages, Netlify ni Vercel, porque esos servicios solo sirven sitios estáticos.

Opciones gratuitas que admiten ASP.NET 4.x:

| Hosting | Plan | Notas |
|---|---|---|
| **MonsterASP.NET** | Gratuito | Hosting Windows/IIS con soporte para ASP.NET 4.x. Subida por FTP, Web Deploy o administrador de archivos |
| **Azure App Service** | F1 (Free) | Hay que elegir la pila **.NET Framework 4.8**. Requiere cuenta de Azure |

> El sistema guarda los datos en la **sesión** (memoria del servidor), así que no hace falta base de datos. Cada visitante trabaja con sus propios datos, que se borran cuando cierra el navegador o cuando el hosting reinicia la app.

## 1. Generar los archivos para publicar

Desde la raíz del repositorio, con Visual Studio 2019/2022 instalado:

```powershell
msbuild "LIstas genericas 2026.sln" -t:restore -p:RestorePackagesConfig=true
msbuild Datos\Datos.csproj -p:Configuration=Release -p:DeployOnBuild=true -p:PublishProfile=Carpeta
```

Esto deja el sitio compilado en la carpeta `publish/`, usando el perfil `Datos/Properties/PublishProfiles/Carpeta.pubxml`. En Release se quita el modo debug y se ocultan los detalles de error a los visitantes (`customErrors="RemoteOnly"`).

Desde Visual Studio también podés hacer clic derecho en el proyecto **Datos** → **Publicar** → perfil **Carpeta**.

**Atajo:** en [Releases](https://github.com/vecs0/Gestion_calificaciones/releases/latest) está `Gestion_calificaciones-web-v1.1.0.zip`, con el sitio ya compilado. Descomprimilo y subí su contenido directamente.

## 2. Subir al hosting

### MonsterASP.NET

1. Creá una cuenta gratuita y un sitio web nuevo.
2. En la configuración del sitio, elegí **ASP.NET 4.x / .NET Framework**.
3. Subí el **contenido** de la carpeta `publish/` (no la carpeta en sí) a la raíz del sitio (`wwwroot`), por FTP o con el administrador de archivos.
4. Abrí la URL que te asigna el hosting y probá `/Calificaciones`.

### Azure App Service (F1)

1. Creá un **App Service** con sistema operativo **Windows**, pila **.NET Framework 4.8** y plan **F1**.
2. En Visual Studio: clic derecho en **Datos** → **Publicar** → **Azure** → **Azure App Service (Windows)** y elegí el servicio creado.
3. Al terminar, Visual Studio abre la URL `https://<nombre>.azurewebsites.net`.

## 3. Cargar datos de demostración

En la página **Sistema de Calificaciones**, sección **Sesión (backup)**:

1. Elegí el archivo [`docs/demo/respaldo-demo.json`](demo/respaldo-demo.json), que trae 14 alumnos ficticios con 19 registros.
2. Hacé clic en **Restaurar**.

## Problemas comunes

| Síntoma | Solución |
|---|---|
| Error 500 al abrir el sitio | Comprobá que el sitio esté configurado con **.NET Framework 4.x** (no .NET Core) y que se haya subido la carpeta `bin/` completa |
| Error de compilación `roslyn\csc.exe` | Subí también `bin/roslyn/`, que la genera el paquete `Microsoft.CodeDom.Providers.DotNetCompilerPlatform` |
| Los datos desaparecen | Es el comportamiento esperado: viven en la sesión. Usá **Guardar** para descargar un respaldo JSON |

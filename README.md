# 🌿 BioCampus - Landing Page de Descarga APK

Página de descarga para la aplicación móvil **BioCampus** (Universidad Rafael Belloso Chacín).

## 🚀 Publicación en GitHub Pages

Para publicar esta página web en GitHub Pages:

1. Sube esta carpeta `download-page` (o el contenido de este repositorio) a tu cuenta de GitHub.
2. Ve a los **Settings** de tu repositorio en GitHub -> **Pages**.
3. En **Build and deployment**, selecciona la rama `main` (o `master`) y la carpeta `/ (root)`.
4. Guarda los cambios. En pocos segundos, GitHub te proporcionará una URL pública como:
   `https://tu-usuario.github.io/tu-repositorio/`

## 🔄 Sincronización Automática del APK

Cada vez que ejecutas el script `compilar_apk.ps1` desde PowerShell:
- Compila la app React (Vite).
- Sincroniza Capacitor Android.
- Compila el APK nativo con Gradle.
- **Copia automáticamente** el archivo `BioCampus-Latest.apk` actualizado tanto a tu **Escritorio** como a esta carpeta `download-page/BioCampus-Latest.apk`.
- Genera el archivo `version.json` con la fecha y hora exacta de la última actualización.

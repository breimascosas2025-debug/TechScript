═══════════════════════════════════════════════════════════════════
  LIMPIEZA DE WINDOWS UPDATE
  Resolución de problemas de actualización
═══════════════════════════════════════════════════════════════════

DESCRIPCIÓN:
Este script soluciona problemas comunes de Windows Update limpiando
los componentes de actualización, reparando archivos corruptos y
restableciendo los servicios necesarios.

PROBLEMAS QUE RESUELVE:
───────────────────────────────────────────────────────────────────
✓ Error 0x80070002 (archivos no encontrados)
✓ Error 0x80240034 (descarga fallida)
✓ Error 0x800f081f (archivos de origen no encontrados)
✓ Windows Update atascado buscando actualizaciones
✓ Actualizaciones que no se descargan
✓ Errores de instalación de actualizaciones

¿QUÉ HACE ESTE SCRIPT?
───────────────────────────────────────────────────────────────────
1. Detiene servicios: wuauserv, cryptSvc, bits, msiserver
2. Limpia la carpeta SoftwareDistribution
3. Renombra/regenera la carpeta catroot2
4. Registra nuevamente las DLLs de Windows Update
5. Restablece el servicio BITS
6. Reinicia todos los servicios
7. Abre Configuración de Windows Update

INSTRUCCIONES:
───────────────────────────────────────────────────────────────────
1. Ejecuta como Administrador
2. Espera a que termine el proceso
3. Cuando se abra Windows Update, busca actualizaciones
4. Instala las actualizaciones disponibles

⚠️ NOTA:
───────────────────────────────────────────────────────────────────
- Windows descargará nuevamente las actualizaciones necesarias
- El primer escaneo puede tardar más de lo normal
- Es normal, el sistema está reconstruyendo la caché

VERSIÓN: 1.0
COMPATIBILIDAD: Windows 10/11
═══════════════════════════════════════════════════════════════════
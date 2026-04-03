═══════════════════════════════════════════════════════════════════
  LIMPIEZA DE LOGS Y EVENTOS DEL SISTEMA
  Liberación de espacio en disco
═══════════════════════════════════════════════════════════════════

DESCRIPCIÓN:
Este script elimina archivos de registro (logs) del sistema Windows
que pueden ocupar gigabytes de espacio en disco, especialmente en
sistemas con mucho tiempo de uso.

¿QUÉ HACE ESTE SCRIPT?
───────────────────────────────────────────────────────────────────
1. Limpia el Visor de eventos de Windows (Event Viewer)
2. Elimina logs de IIS (Internet Information Services)
3. Borra logs de Windows Update
4. Limpia logs CBS (Component Based Servicing)
5. Elimina logs de instalaciones previas
6. Borra logs de Windows Defender
7. Elimina minidumps y memory dumps
8. Limpia la cola de reportes de error

CUÁNDO USARLO:
───────────────────────────────────────────────────────────────────
- Cuando el disco duro tiene poco espacio libre
- Después de solucionar problemas del sistema
- Periódicamente para mantenimiento
- Cuando los logs ocupan más de 1GB

⚠️ ADVERTENCIA:
───────────────────────────────────────────────────────────────────
- Los logs se usan para diagnóstico de problemas
- No elimines logs si estás solucionando un problema activo
- Los logs se regenerarán automáticamente
- Es seguro ejecutar este script periódicamente

INSTRUCCIONES:
───────────────────────────────────────────────────────────────────
1. Ejecutar como Administrador
2. Esperar a que termine el proceso
3. Reinicio no requerido (opcional)

VERSIÓN: 1.0
COMPATIBILIDAD: Windows 10/11
═══════════════════════════════════════════════════════════════════
/**
 * Tech Center - JavaScript Principal
 * Funcionalidades interactivas de la página
 */

// ============================================
// DATOS DE SCRIPTS
// ============================================
const scriptsData = [
    {
        id: 1,
        name: "Limpieza Total de Archivos Temporales",
        category: "limpieza",
        description: "Elimina archivos temporales de %temp%, Windows\Temp, Prefetch, caché de Windows Update y más. Libera espacio en disco y mejora el rendimiento.",
        icon: "🧹",
        file: "01-limpieza-temporal.zip",
        downloads: 15420,
        code: `@echo off
cd /d %temp%
del /f /s /q *.* 2>nul
rd /s /q C:\Windows\Temp 2>nul
del /f /s /q C:\Windows\Prefetch\*.* 2>nul
echo Limpieza completada`,
        isPro: false
    },
    {
        id: 2,
        name: "Flush DNS - Limpieza de Caché DNS",
        category: "red",
        description: "Limpia la caché DNS y renueva la configuración de red. Soluciona problemas de navegación web y errores DNS_PROBE.",
        icon: "🌐",
        file: "02-flush-dns.zip",
        downloads: 8930,
        code: `@echo off
ipconfig /flushdns
ipconfig /release
ipconfig /renew
net stop dnscache
net start dnscache
echo DNS renovado`,
        isPro: false
    },
    {
        id: 3,
        name: "Liberación de Memoria RAM",
        category: "rendimiento",
        description: "Libera memoria RAM ocupada innecesariamente, optimiza el Working Set de procesos y limpia el caché del sistema.",
        icon: "💾",
        file: "03-liberar-ram.zip",
        downloads: 12350,
        code: `@echo off
powershell -Command "[GC]::Collect()"
powershell -Command "Get-Process | ForEach-Object { $_.MinWorkingSet = $_.MinWorkingSet }"
taskkill /f /im explorer.exe >nul
start explorer.exe
echo RAM liberada`,
        isPro: false
    },
    {
        id: 4,
        name: "Desactivar Servicios Innecesarios",
        category: "rendimiento",
        description: "Desactiva servicios de Windows que consumen recursos: telemetría, geolocalización, Xbox, fax y más. Incluye script para revertir cambios.",
        icon: "⚙️",
        file: "04-desactivar-servicios.zip",
        downloads: 9870,
        code: `@echo off
sc config DiagTrack start= disabled
sc config dmwappushservice start= disabled
sc config WSearch start= disabled
sc config SysMain start= disabled
echo Servicios desactivados`,
        isPro: false
    },
    {
        id: 5,
        name: "Limpieza de Logs del Sistema",
        category: "limpieza",
        description: "Elimina archivos de registro (logs) del sistema que pueden ocupar gigabytes de espacio. Limpia Event Viewer, Windows Update, CBS logs y más.",
        icon: "📋",
        file: "05-limpieza-logs.zip",
        downloads: 7650,
        code: `@echo off
wevtutil el | Foreach-Object {wevtutil cl "$_"}
del /f /s /q C:\Windows\Logs\*.*
del /f /s /q C:\Windows\SoftwareDistribution\*.*
echo Logs eliminados`,
        isPro: false
    },
    {
        id: 6,
        name: "Optimización de Inicio de Windows",
        category: "rendimiento",
        description: "Acelera el arranque de Windows desactivando programas del inicio, tareas programadas innecesarias y optimizando la hibernación.",
        icon: "🚀",
        file: "06-optimizar-inicio.zip",
        downloads: 11200,
        code: `@echo off
reg delete "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run" /v "OneDrive" /f
powercfg /hibernate off
schtasks /change /tn "Microsoft\\Windows\\Application Experience\\Microsoft Compatibility Appraiser" /disable
echo Inicio optimizado`,
        isPro: false
    },
    {
        id: 7,
        name: "Eliminación de Archivos Basura Ocultos",
        category: "limpieza",
        description: "Encuentra y elimina archivos ocultos como Thumbs.db, .DS_Store, archivos vacíos y caché de iconos que consumen espacio.",
        icon: "🗑️",
        file: "07-basura-oculta.zip",
        downloads: 6890,
        code: `@echo off
del /f /s /q /a:h Thumbs.db
del /f /s /q .DS_Store
del /f /s /q desktop.ini
for /r C:\ %%F in (*) do @if %%~zF==0 del "%%F"
echo Basura eliminada`,
        isPro: false
    },
    {
        id: 8,
        name: "Reparación Básica del Sistema",
        category: "reparacion",
        description: "Ejecuta SFC /scannow y DISM para verificar y reparar archivos del sistema corruptos. Soluciona errores de Windows y estabilidad.",
        icon: "🔧",
        file: "08-reparar-sistema.zip",
        downloads: 14560,
        code: `@echo off
echo Ejecutando SFC...
sfc /scannow
echo Ejecutando DISM...
dism /Online /Cleanup-Image /RestoreHealth
echo Reparacion completada`,
        isPro: false
    },
    {
        id: 9,
        name: "Limpieza de Windows Update",
        category: "reparacion",
        description: "Repara problemas de Windows Update limpiando componentes, re-registrando DLLs y restableciendo servicios.",
        icon: "🔄",
        file: "09-limpieza-update.zip",
        downloads: 10230,
        code: `@echo off
net stop wuauserv
rd /s /q C:\Windows\SoftwareDistribution
net start wuauserv
regsvr32 wuaueng.dll /s
echo Windows Update reparado`,
        isPro: false
    },
    {
        id: 10,
        name: "Reset de Red Completo",
        category: "red",
        description: "Restablece toda la configuración de red a valores predeterminados. Soluciona problemas de conectividad complejos.",
        icon: "📡",
        file: "10-reset-red.zip",
        downloads: 8760,
        code: `@echo off
ipconfig /release
ipconfig /flushdns
netsh winsock reset
netsh int ip reset
netsh advfirewall reset
ipconfig /renew
echo Red restablecida`,
        isPro: false
    },
    {
        id: 11,
        name: "Optimización de Disco",
        category: "rendimiento",
        description: "Detecta automáticamente si tienes SSD o HDD y aplica las optimizaciones correctas: TRIM para SSD, desfragmentación para HDD.",
        icon: "💿",
        file: "11-optimizar-disco.zip",
        downloads: 9340,
        code: `@echo off
cleanmgr /sagerun:1
wmic diskdrive get MediaType | find "SSD" >nul
if %errorlevel%==0 (
    fsutil behavior set DisableDeleteNotify 0
    echo SSD optimizado
) else (
    defrag C: /O
    echo HDD desfragmentado
)`,
        isPro: false
    },
    {
        id: 12,
        name: "Limpieza de Navegadores",
        category: "limpieza",
        description: "Limpia caché, cookies e historial de Chrome, Firefox, Edge, Opera y Brave. Libera espacio y mejora privacidad.",
        icon: "🌐",
        file: "12-limpiar-navegador.zip",
        downloads: 11890,
        code: `@echo off
taskkill /F /IM chrome.exe /IM firefox.exe /IM msedge.exe
rd /s /q "%LOCALAPPDATA%\\Google\\Chrome\\User Data\\Default\\Cache"
rd /s /q "%LOCALAPPDATA%\\Mozilla\\Firefox\\Profiles\\*\\cache2"
rd /s /q "%LOCALAPPDATA%\\Microsoft\\Edge\\User Data\\Default\\Cache"
echo Navegadores limpios`,
        isPro: false
    },
    {
        id: 13,
        name: "Eliminación de Bloatware",
        category: "limpieza",
        description: "Elimina apps preinstaladas innecesarias de Windows: Xbox, Skype, OneDrive, apps de publicidad y más.",
        icon: "📱",
        file: "13-eliminar-bloatware.zip",
        downloads: 7890,
        code: `@echo off
powershell "Get-AppxPackage *3dbuilder* | Remove-AppxPackage"
powershell "Get-AppxPackage *skypeapp* | Remove-AppxPackage"
powershell "Get-AppxPackage *xboxapp* | Remove-AppxPackage"
%SystemRoot%\\System32\\OneDriveSetup.exe /uninstall
echo Bloatware eliminado`,
        isPro: false
    },
    {
        id: 14,
        name: "Optimización Total PRO",
        category: "pro",
        description: "Suite completa que ejecuta TODAS las optimizaciones en un solo script. Crea punto de restauración, limpia, repara y optimiza todo el sistema.",
        icon: "⭐",
        file: "14-optimizacion-total.zip",
        downloads: 25670,
        code: `@echo off
:: CREAR PUNTO DE RESTAURACION
powershell "Checkpoint-Computer -Description 'OptimizacionTotal' -RestorePointType 'MODIFY_SETTINGS'"
:: LIMPIEZA COMPLETA
del /f /s /q %temp%\*.*
ipconfig /flushdns
wevtutil el | Foreach-Object {wevtutil cl "$_"}
:: REPARACION
sfc /scannow
dism /Online /Cleanup-Image /RestoreHealth
:: OPTIMIZACION
powercfg /hibernate off
sc config DiagTrack start= disabled
shutdown /r /t 60`,
        isPro: true
    },
    {
        id: 15,
        name: "Flush IP y Red",
        category: "red",
        description: "Limpieza rápida de configuración IP. Libera y renueva direcciones IPv4/IPv6, limpia cachés de red.",
        icon: "🔌",
        file: "15-flush-ip.zip",
        downloads: 6540,
        code: `@echo off
ipconfig /release
ipconfig /release6
ipconfig /flushdns
nbtstat -R
ipconfig /renew
ipconfig /renew6
echo IP renovada`,
        isPro: false
    }
];

// ============================================
// DATOS DE HERRAMIENTAS
// ============================================
const toolsData = [
    {
        id: 1,
        name: "CrystalDiskInfo",
        description: "Monitorea la salud de tus discos duros y SSD con información S.M.A.R.T.",
        category: "diagnostico",
        url: "https://crystalmark.info/en/software/crystaldiskinfo/"
    },
    {
        id: 2,
        name: "CPU-Z",
        description: "Información detallada del procesador, placa base, memoria y gráficos.",
        category: "diagnostico",
        url: "https://www.cpuid.com/softwares/cpu-z.html"
    },
    {
        id: 3,
        name: "Recuva",
        description: "Recupera archivos borrados accidentalmente de discos duros y memorias USB.",
        category: "recuperacion",
        url: "https://www.ccleaner.com/recuva"
    },
    {
        id: 4,
        name: "CCleaner",
        description: "Limpia archivos temporales, optimiza el registro y mejora el rendimiento.",
        category: "optimizacion",
        url: "https://www.ccleaner.com/ccleaner"
    },
    {
        id: 5,
        name: "HWiNFO64",
        description: "Análisis profundo del hardware con monitoreo en tiempo real.",
        category: "diagnostico",
        url: "https://www.hwinfo.com/"
    },
    {
        id: 6,
        name: "Rufus",
        description: "Crea unidades USB booteables para instalar Windows o Linux.",
        category: "utilidades",
        url: "https://rufus.ie/"
    }
];

// ============================================
// INICIALIZACIÓN
// ============================================
document.addEventListener('DOMContentLoaded', function() {
    renderScripts(scriptsData);
    renderTools();
    setupEventListeners();
    setupNavbarScroll();
    animateOnScroll();
});

// ============================================
// RENDERIZAR SCRIPTS
// ============================================
function renderScripts(scripts) {
    const container = document.getElementById('scripts-container');
    if (!container) return;
    
    container.innerHTML = scripts.map(script => `
        <div class="script-card ${script.isPro ? 'pro' : ''}" data-category="${script.category}" data-id="${script.id}">
            <div class="script-header">
                <div class="script-icon">${script.icon}</div>
                <div>
                    <h3 class="script-title">${script.name}</h3>
                    <span class="script-category">${getCategoryName(script.category)}</span>
                </div>
            </div>
            <p class="script-desc">${script.description}</p>
            <div class="script-meta">
                <span><i class="fas fa-download"></i> ${formatNumber(script.downloads)}</span>
                <span><i class="fas fa-file-archive"></i> ZIP</span>
                ${script.isPro ? '<span style="color: #00ff88;"><i class="fas fa-star"></i> PRO</span>' : ''}
            </div>
            <div class="script-actions">
                <button class="btn btn-primary" onclick="downloadScript('${script.file}', '${script.name}')">
                    <i class="fas fa-download"></i> Descargar
                </button>
                <button class="btn btn-secondary" onclick="showInstructions('${script.id}')">
                    <i class="fas fa-info-circle"></i> Info
                </button>
            </div>
        </div>
    `).join('');
}

function getCategoryName(category) {
    const names = {
        'limpieza': 'Limpieza',
        'red': 'Red/Internet',
        'rendimiento': 'Rendimiento',
        'reparacion': 'Reparación',
        'pro': 'Suite PRO'
    };
    return names[category] || category;
}

function formatNumber(num) {
    if (num >= 1000) {
        return (num / 1000).toFixed(1) + 'K';
    }
    return num.toString();
}

function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

// ============================================
// RENDERIZAR HERRAMIENTAS
// ============================================
function renderTools() {
    const container = document.getElementById('tools-container');
    if (!container) return;
    
    container.innerHTML = toolsData.map(tool => `
        <div class="tool-card">
            <div class="tool-icon"><i class="fas fa-wrench"></i></div>
            <div class="tool-info">
                <h3>${tool.name}</h3>
                <p>${tool.description}</p>
                <div class="tool-actions">
                    <a href="${tool.url}" target="_blank" class="btn btn-primary">
                        <i class="fas fa-external-link-alt"></i> Descargar
                    </a>
                </div>
            </div>
        </div>
    `).join('');
}

// ============================================
// EVENT LISTENERS
// ============================================
function setupEventListeners() {
    // Filtros de scripts
    const filterButtons = document.querySelectorAll('.filter-btn');
    filterButtons.forEach(btn => {
        btn.addEventListener('click', function() {
            filterButtons.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            const category = this.dataset.filter;
            filterScripts(category);
        });
    });
    
    // Búsqueda
    const searchInput = document.getElementById('script-search');
    if (searchInput) {
        searchInput.addEventListener('input', function() {
            const query = this.value.toLowerCase();
            searchScripts(query);
        });
    }
    
    // Menú móvil
    const mobileMenuBtn = document.getElementById('mobile-menu-btn');
    if (mobileMenuBtn) {
        mobileMenuBtn.addEventListener('click', toggleMobileMenu);
    }
}

function filterScripts(category) {
    const cards = document.querySelectorAll('.script-card');
    cards.forEach(card => {
        if (category === 'all' || card.dataset.category === category) {
            card.style.display = 'block';
            card.classList.add('fade-in');
        } else {
            card.style.display = 'none';
        }
    });
}

function searchScripts(query) {
    const cards = document.querySelectorAll('.script-card');
    cards.forEach(card => {
        const title = card.querySelector('.script-title').textContent.toLowerCase();
        const desc = card.querySelector('.script-desc').textContent.toLowerCase();
        
        if (title.includes(query) || desc.includes(query)) {
            card.style.display = 'block';
        } else {
            card.style.display = 'none';
        }
    });
}

// ============================================
// DESCARGA DE SCRIPTS
// ============================================
function downloadScript(filename, scriptName) {
    // Mostrar modal de descarga
    const modal = document.getElementById('download-modal');
    const modalTitle = document.getElementById('modal-title');
    const modalText = document.getElementById('modal-text');
    
    modalTitle.textContent = `Descargando ${scriptName}`;
    modalText.textContent = 'Preparando archivo ZIP...';
    modal.classList.add('active');
    
    // Simular preparación y descargar
    setTimeout(() => {
        modalText.textContent = 'Iniciando descarga...';
        
        // Crear enlace de descarga
        const link = document.createElement('a');
        link.href = `downloads/${filename}`;
        link.download = filename;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        
        // Incrementar contador (simulado)
        incrementDownloadCount(filename);
        
        // Cerrar modal
        setTimeout(() => {
            modal.classList.remove('active');
        }, 1500);
    }, 1000);
}

function incrementDownloadCount(filename) {
    const script = scriptsData.find(s => s.file === filename);
    if (script) {
        script.downloads++;
        // Actualizar UI si es necesario
        const card = document.querySelector(`[data-id="${script.id}"]`);
        if (card) {
            const downloadCount = card.querySelector('.script-meta span');
            if (downloadCount) {
                downloadCount.innerHTML = `<i class="fas fa-download"></i> ${formatNumber(script.downloads)}`;
            }
        }
    }
}

// ============================================
// INFORMACIÓN ADICIONAL
// ============================================
function showInstructions(scriptId) {
    const script = scriptsData.find(s => s.id === parseInt(scriptId));
    if (script) {
        alert(`${script.name}\n\n📖 Instrucciones:\n1. Descarga el archivo ZIP\n2. Extrae los archivos\n3. Lee README.txt antes de ejecutar\n4. Ejecuta como Administrador\n5. Sigue las instrucciones en pantalla\n\n⚠️ IMPORTANTE:\n• Cierra programas antes de ejecutar\n• Guarda tu trabajo\n• Lee RESTORE.txt para saber cómo revertir cambios`);
    }
}

// ============================================
// NAVBAR SCROLL
// ============================================
function setupNavbarScroll() {
    const navbar = document.querySelector('.navbar');
    if (!navbar) return;
    
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });
}

// ============================================
// ANIMACIONES SCROLL
// ============================================
function animateOnScroll() {
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('slide-up');
            }
        });
    }, { threshold: 0.1 });
    
    document.querySelectorAll('.script-card, .tool-card').forEach(el => {
        observer.observe(el);
    });
}

// ============================================
// MENÚ MÓVIL
// ============================================
function toggleMobileMenu() {
    const navLinks = document.querySelector('.nav-links');
    navLinks.classList.toggle('mobile-active');
}

// ============================================
// SMOOTH SCROLL
// ============================================
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});
# gentoo-portage-overlay

[![License](https://img.shields.io/:license-gpl-green.svg)](https://www.gnu.org/licenses/gpl-3.0.txt)
[![pipeline status](https://gitlab.nis.com.ar/proyectos/gentoo-portage-overlay/badges/master/pipeline.svg)](https://gitlab.nis.com.ar/proyectos/gentoo-portage-overlay/-/commits/master)

Overlay del portage de Gentoo Linux para ebuilds relacionados con [gentoo-portage-overlay](https://gitlab.nis.com.ar/proyectos/gentoo-portage-overlay).

El conjunto de ebuilds que conforman este proyecto es software libre publicado 
bajo la Licencia Pública General de GNU Versión 2 o posterior, según se publica 
en: http://www.gnu.org/licenses/gpl-2.0.txt

## Portage

Portage es el gestor de paquetes oficial de la distribución [Gentoo Linux](https://es.wikipedia.org/wiki/Gentoo_Linux), 
[Calculate Linux](https://en.wikipedia.org/wiki/Calculate_Linux), [ChromiumOS](https://en.wikipedia.org/wiki/ChromiumOS), 
y [ChromeOS](https://en.wikipedia.org/wiki/ChromeOS), entre otras.

Implementa gestión de dependencias, afinamiento preciso de los paquetes a gusto 
del administrador, instalaciones falsas (al estilo OpenBSD), entornos de prueba 
durante la compilación, desinstalación segura, perfiles de sistema, paquetes 
virtuales, gestión de los ficheros de configuración y múltiples ranuras para 
distintas versiones de un mismo paquete.

El portage dispone de un árbol local que contiene las descripciones de los paquetes 
de software y las funcionalidades necesarias para instalarlos en archivos llamados 
ebuilds. Este árbol se puede sincronizar con un servidor remoto mediante una orden:

<pre>
emerge --sync
</pre> 

### Extender el portage con los ebuilds de este proyecto

Para extender su portage con los ebuilds desarrollados por este proyecto, debe crear el archivo _/etc/portage/repos.conf/gentoo-portage-overlay.conf_ con el siguiente contenido:

<pre>
[gentoo-portage-overlay]
location = /var/db/repos/gentoo-portage-overlay
sync-type = git
sync-uri = https://gitlab.nis.com.ar/proyectos/gentoo-portage-overlay.git
auto-sync = yes
</pre>

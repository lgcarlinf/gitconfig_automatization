# Configuración Automatizada de Git y SSH
Este script de Bash automatiza la configuración inicial de Git y la generación de claves SSH para un nuevo proyecto. Facilita la configuración de nombres de usuario, correos electrónicos y configuraciones específicas de Git para proyectos individuales.

## Uso
1. **Clonación del Repositorio**

Clone este repositorio en el directorio deseado:

```bash
git clone <URL_del_repositorio>
cd <nombre_del_directorio>
```

> [!NOTE]   
> Estos comandos pueden ejecutarse en Unix/Linux, macOS y Windows utilizando Git Bash.


1. **Dar Permiso de Ejecución**

Antes de ejecutar el script, asegúrese de dar permisos de ejecución al archivo setup.sh:

```bash
chmod +x setup.sh
```
3. **Ejecución del Script**

Ejecute el script `setup.sh` y siga las instrucciones para configurar su entorno:

```bash
./setup.sh
```
Siga las instrucciones para ingresar los detalles requeridos como el nombre del proyecto, nombre de usuario de Git, correo electrónico, etc.

4. **Agregar Clave SSH a GitHub**

Después de generar la clave SSH, agregue el archivo id_rsa_<nombre_del_proyecto> a su cuenta de GitHub:

- Copie el contenido de la clave SSH generada:

```bash
cat ~/.ssh/id_rsa_<nombre_del_proyecto>.pub
```
- Ingrese a GitHub y navegue a Settings -> SSH and GPG keys.

- Haga clic en New SSH key o Add SSH key.

- Pegue el contenido de la clave SSH en el campo Key.

- Asigne un título descriptivo para identificar la clave (opcional).

- Haga clic en Add SSH key para guardar.

## Detalles del Script
El script realiza las siguientes acciones:

- **Generación de Clave SSH**

    - Genera una nueva clave SSH con el nombre proporcionado.
    - Guarda la clave en el directorio ~/.ssh/.
- **Configuración Global de Git**

    - Crea o actualiza el archivo .gitconfig global.
    - Establece la configuración predeterminada del repositorio y configura inclusiones condicionales basadas en el directorio de trabajo.
- **Configuración del Directorio de Trabajo de Git**

    - Crea un archivo .gitconfig.<nombre_del_proyecto> específico para el directorio de trabajo.
    - Configura el nombre de usuario, correo electrónico y el nombre de usuario de GitHub para el proyecto.
  
Este README proporciona una guía detallada sobre cómo configurar y utilizar el script para la automatización de la configuración de Git y SSH. Asegúrese de seguir todos los pasos y personalizar el script según sea necesario para adaptarlo a sus necesidades específicas de desarrollo y gestión de proyectos.









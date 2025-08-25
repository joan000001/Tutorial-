# Tutorial 

# Joan Franco Sandoval




## 1. Instalación de las herramientas

### 1. Introducción

Con el objetivo de establecer un entorno funcional para el desarrollo, simulación y programación. Se realizó la instalación y configuración de diversas herramientas de software. A continuación, se detalla el procedimiento llevado a cabo, incluyendo los recursos utilizados y los aspectos técnicos relevantes.

### 2. Instalación de Visual Studio Code

Se descargó e instaló la aplicación Visual Studio Code desde su sitio oficial.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/1.PNG )


### 3. Instalación de Extensiones en Visual Studio Code
#### 3.1 Lushay Code

Una vez instalado VSCode, se procedió a instalar la extensión Lushay Code. Esta extensión permite la integración de herramientas como Yosys.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/2.PNG )

#### 3.2 Verilog-HDL/SystemVerilog

Además, se incorporó la extensión Verilog-HDL/SystemVerilog, que proporciona funcionalidades de resaltado de sintaxis, autocompletado y validación para dichos lenguajes.

![image Alt](  )

### 4. Instalación de OSS-Cad-Suite

Se descargó el paquete OSS-Cad-Suite desde el repositorio oficial de YosysHQ.

El archivo descargado fue descomprimido, generando una carpeta llamada oss-cad-suite, que contiene todos los ejecutables necesarios.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/3.PNG )

### 5. Configuración de Lushay Code

Dentro de VSCode, se configuró manualmente la ruta de acceso a la carpeta bin de la OSS-Cad-Suite, mediante las opciones de configuración de la extensión Lushay Code.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/5.PNG )

### 6. Instalación y Configuración del Controlador USB (Zadig)

Se instaló el programa Zadig para reemplazar el controlador USB correspondiente a la interfaz JTAG de la FPGA. Una vez conectada la placa, se seleccionó el dispositivo JTAG Debugger (Interface 0), y se reemplazó el controlador.


![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/6.PNG )

### 7. Instalación de GNU-Make

Se descargó e instaló GNU-Make desde el sitio de GnuWin32. Para permitir el uso de Make desde cualquier terminal o consola integrada en VSCode, se agregó manualmente la ruta de la carpeta bin de GnuWin32 a la variable de entorno PATH del sistema operativo. Esta operación se realizó a través del editor de variables de entorno de Windows.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/7.PNG )

## 2. Uso de la cadena de herramientas para diseño en FPGA



Uso del entorno de desarrollo de código abierto para FPGA Tang Nano 9K

Este proyecto documenta la experiencia de uso del entorno de herramientas open source aplicado al diseño digital en la FPGA Tang Nano 9K, siguiendo el tutorial oficial y comprobando el funcionamiento de cada etapa del flujo de diseño.

📂 Estructura del proyecto

Se utilizó la jerarquía de carpetas recomendada:

design/ → Archivos RTL del diseño (.sv, .v)

sim/ → Archivos de simulación (testbench)

constr/ → Restricciones físicas (.cst)

build/ → Contiene el Makefile con las recetas

El repositorio fue clonado con:

git clone https://github.com/DJosueMM/open_source_fpga_environment.git

⚙️ Inicialización del entorno

Se abrió el proyecto en Visual Studio Code (VSC) y se usó la extensión FPGA Toolchain para abrir una terminal OSS-CAD-Suite.
La instalación fue verificada con:

yosys


La herramienta de síntesis respondió correctamente, confirmando que el entorno estaba listo para usarse.

🧪 Simulación del diseño

Con el ejemplo BlinkyLed:

cd ./ejemplos/BlinkyLed/src/build/
make test


Se generó un archivo .vcd con las señales simuladas.

Luego, con:

make wv


se abrió GTKwave para visualizar los diagramas de tiempo.
Las señales fueron cargadas y mostraron el comportamiento esperado.

🛠️ Síntesis e implementación

Se ejecutaron las etapas de diseño desde RTL hasta hardware:

Síntesis:

make synth


→ Generó un .json y log de síntesis.

Place & Route:

make pnr


→ Implementación física correcta.

Bitstream:

make bitstream


→ Generó archivo .fs con el diseño.

Carga en la FPGA:

make load


→ El diseño fue cargado exitosamente en la Tang Nano 9K.

También se validó el comando global:

make all


→ Ejecutó todas las etapas automáticamente.

📝 Configuración del Makefile

Se revisaron y comprendieron las variables principales:

FUENTES → Archivos de diseño RTL

TESTBENCH → Archivos de simulación

CONSTRAINTS → Archivo .cst de pines

TOP_DESIGN → Módulo superior

TOP_TB → Módulo del testbench

VCD_FILE → Nombre del archivo de simulación .vcd

Estas son las únicas que deben modificarse para proyectos nuevos.
Las recetas (synth, pnr, bitstream, load, etc.) funcionaron sin cambios.